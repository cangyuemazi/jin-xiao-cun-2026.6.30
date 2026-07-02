import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/database/database_paths.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import '../../data/repositories/supplier_repository.dart';
import 'audit_log_service.dart';
import 'dictionary_service.dart';

enum OrderExportMode { filtered, fullBackup }

class OrderExportResult {
  const OrderExportResult({
    required this.exportUuid,
    required this.filePath,
    required this.rowCount,
    required this.orderCount,
    required this.generatedAt,
    required this.mode,
    this.keyword,
  });

  final String exportUuid;
  final String filePath;
  final int rowCount;
  final int orderCount;
  final DateTime generatedAt;
  final OrderExportMode mode;
  final String? keyword;

  String get modeLabel {
    return switch (mode) {
      OrderExportMode.filtered => '筛选导出',
      OrderExportMode.fullBackup => '完整备份式导出',
    };
  }
}

class OrderExportRow {
  const OrderExportRow({
    required this.orderNo,
    required this.customerName,
    required this.customerCompany,
    required this.productName,
    required this.productCode,
    required this.specification,
    required this.quantity,
    required this.unit,
    required this.orderDate,
    required this.shipDate,
    required this.costAmount,
    required this.saleAmount,
    required this.profitAmount,
    required this.supplierName,
    required this.carrierName,
    required this.trackingNo,
    required this.orderStatus,
    required this.remark,
  });

  final String orderNo;
  final String customerName;
  final String customerCompany;
  final String productName;
  final String productCode;
  final String specification;
  final String quantity;
  final String unit;
  final String orderDate;
  final String shipDate;
  final String costAmount;
  final String saleAmount;
  final String profitAmount;
  final String supplierName;
  final String carrierName;
  final String trackingNo;
  final String orderStatus;
  final String remark;

  List<String> toCells() {
    return [
      orderNo,
      customerName,
      customerCompany,
      productName,
      productCode,
      specification,
      quantity,
      unit,
      orderDate,
      shipDate,
      costAmount,
      saleAmount,
      profitAmount,
      supplierName,
      carrierName,
      trackingNo,
      orderStatus,
      remark,
    ];
  }
}

class _ShipmentBundle {
  const _ShipmentBundle({required this.shipment, required this.items});

  final Shipment shipment;
  final List<ShipmentItem> items;
}

class ExportService {
  ExportService({
    OrderRepository? orderRepository,
    CustomerRepository? customerRepository,
    SupplierRepository? supplierRepository,
    ShipmentRepository? shipmentRepository,
    DictionaryService? dictionaryService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _orderRepository = orderRepository,
       _customerRepository = customerRepository,
       _supplierRepository = supplierRepository,
       _shipmentRepository = shipmentRepository,
       _dictionaryService = dictionaryService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  static const orderExportHeaders = [
    '订单号',
    '客户',
    '客户单位',
    '产品名称',
    '货号',
    '规格',
    '数量',
    '单位',
    '下单时间',
    '发货时间',
    '成本',
    '销售金额',
    '毛利',
    '厂家',
    '快递公司',
    '快递单号',
    '订单状态',
    '备注',
  ];

  final OrderRepository? _orderRepository;
  final CustomerRepository? _customerRepository;
  final SupplierRepository? _supplierRepository;
  final ShipmentRepository? _shipmentRepository;
  final DictionaryService? _dictionaryService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<OrderExportResult> exportOrders({
    OrderExportMode mode = OrderExportMode.filtered,
    String keyword = '',
    String? outputPath,
    String? operatorName,
    String? deviceId,
  }) async {
    final generatedAt = DateTime.now();
    final rows = await buildOrderExportRows(mode: mode, keyword: keyword);
    final effectiveOutputPath = await _resolveOutputPath(
      outputPath,
      mode,
      generatedAt,
    );
    await writeOrderExportFile(
      filePath: effectiveOutputPath,
      rows: rows,
      generatedAt: generatedAt,
      mode: mode,
      keyword: keyword,
    );

    final exportUuid = _uuid.v4();
    await _auditLogService?.recordExport(
      exportUuid: exportUuid,
      newValue: {
        'file_path': effectiveOutputPath,
        'row_count': rows.length,
        'order_count': rows.map((row) => row.orderNo).toSet().length,
        'mode': mode.name,
        'keyword': keyword.trim(),
        'exported_at': generatedAt,
      },
      operatorName: operatorName,
      deviceId: deviceId,
      remark: mode == OrderExportMode.fullBackup
          ? 'Full order Excel export'
          : 'Filtered order Excel export',
    );

    return OrderExportResult(
      exportUuid: exportUuid,
      filePath: effectiveOutputPath,
      rowCount: rows.length,
      orderCount: rows.map((row) => row.orderNo).toSet().length,
      generatedAt: generatedAt,
      mode: mode,
      keyword: keyword.trim().isEmpty ? null : keyword.trim(),
    );
  }

  Future<List<OrderExportRow>> buildOrderExportRows({
    OrderExportMode mode = OrderExportMode.filtered,
    String keyword = '',
    int limit = 100000,
  }) async {
    final orderRepository = _orderRepository;
    if (orderRepository == null) {
      return const [];
    }

    final trimmedKeyword = keyword.trim();
    final orders = mode == OrderExportMode.fullBackup || trimmedKeyword.isEmpty
        ? await orderRepository.list(limit: limit)
        : await orderRepository.search(trimmedKeyword, limit: limit);

    final orderStatusLabels = await _dictionaryLabels('order_status');
    final carrierLabels = await _dictionaryLabels('carrier');
    final customerCache = <String, Customer>{};
    final supplierCache = <String, Supplier>{};
    final exportRows = <OrderExportRow>[];

    for (final order in orders) {
      final customer = await _customerByUuid(order.customerUuid, customerCache);
      final items = await orderRepository.listItemsByOrderUuid(order.uuid);
      final shipmentBundles = await _shipmentBundles(order.uuid);

      if (items.isEmpty) {
        exportRows.add(
          _buildOrderExportRow(
            order: order,
            customer: customer,
            shipments: shipmentBundles.map((bundle) => bundle.shipment),
            orderStatusLabels: orderStatusLabels,
            carrierLabels: carrierLabels,
          ),
        );
        continue;
      }

      for (final item in items) {
        final supplier = await _supplierByUuid(
          item.supplierUuid,
          supplierCache,
        );
        final itemShipments = shipmentBundles
            .where(
              (bundle) =>
                  bundle.items.any((entry) => entry.orderItemUuid == item.uuid),
            )
            .map((bundle) => bundle.shipment);

        exportRows.add(
          _buildOrderExportRow(
            order: order,
            item: item,
            customer: customer,
            supplier: supplier,
            shipments: itemShipments,
            orderStatusLabels: orderStatusLabels,
            carrierLabels: carrierLabels,
          ),
        );
      }
    }

    return exportRows;
  }

  Future<void> writeOrderExportFile({
    required String filePath,
    required List<OrderExportRow> rows,
    required DateTime generatedAt,
    required OrderExportMode mode,
    String keyword = '',
  }) async {
    final excel = Excel.createExcel();
    const orderSheetName = '订单导出';
    final defaultSheet = excel.getDefaultSheet();
    if (defaultSheet != null && defaultSheet != orderSheetName) {
      excel.rename(defaultSheet, orderSheetName);
    }
    excel.setDefaultSheet(orderSheetName);

    excel.appendRow(
      orderSheetName,
      orderExportHeaders.map((header) => TextCellValue(header)).toList(),
    );

    for (final row in rows) {
      excel.appendRow(
        orderSheetName,
        row.toCells().map((cell) => TextCellValue(cell)).toList(),
      );
    }

    const metadataSheetName = '导出信息';
    excel.appendRow(metadataSheetName, [
      TextCellValue('导出类型'),
      TextCellValue(mode == OrderExportMode.fullBackup ? '完整备份式导出' : '筛选导出'),
    ]);
    excel.appendRow(metadataSheetName, [
      TextCellValue('筛选关键词'),
      TextCellValue(keyword.trim().isEmpty ? '全部' : keyword.trim()),
    ]);
    excel.appendRow(metadataSheetName, [
      TextCellValue('导出时间'),
      TextCellValue(_formatDateTime(generatedAt)),
    ]);
    excel.appendRow(metadataSheetName, [
      TextCellValue('订单数'),
      TextCellValue('${rows.map((row) => row.orderNo).toSet().length}'),
    ]);
    excel.appendRow(metadataSheetName, [
      TextCellValue('明细行数'),
      TextCellValue('${rows.length}'),
    ]);

    final bytes = excel.encode();
    if (bytes == null) {
      throw StateError('Excel 文件生成失败。');
    }

    final file = File(_ensureXlsxExtension(filePath));
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes, flush: true);
  }

  String defaultOrderExportFileName({
    OrderExportMode mode = OrderExportMode.filtered,
    DateTime? now,
  }) {
    final timestamp = _timestamp(now ?? DateTime.now());
    final prefix = mode == OrderExportMode.fullBackup
        ? 'orders_backup_export'
        : 'orders_export';
    return '${prefix}_$timestamp.xlsx';
  }

  String defaultOrderExportDirectoryPath() {
    AppDatabasePaths.ensureRuntimeDirectories();
    return p.join(
      AppDatabasePaths.dataRootDirectory.path,
      AppDatabasePaths.exportDirectoryName,
    );
  }

  String formatFen(int amount) {
    final sign = amount < 0 ? '-' : '';
    final absolute = amount.abs();
    final yuan = absolute ~/ 100;
    final cents = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$yuan.$cents';
  }

  OrderExportRow _buildOrderExportRow({
    required SalesOrder order,
    SalesOrderItem? item,
    Customer? customer,
    Supplier? supplier,
    Iterable<Shipment> shipments = const [],
    Map<String, String> orderStatusLabels = const {},
    Map<String, String> carrierLabels = const {},
  }) {
    final saleAmount = item?.saleAmount ?? order.totalSaleAmount;
    final costAmount = item?.costAmount ?? order.totalCostAmount;
    final profitAmount = item == null
        ? order.totalProfitAmount
        : saleAmount - costAmount;

    return OrderExportRow(
      orderNo: order.orderNo,
      customerName: customer?.customerName ?? order.customerUuid ?? '',
      customerCompany: customer?.companyName ?? '',
      productName: item?.productNameSnapshot ?? '',
      productCode: item?.productCodeSnapshot ?? '',
      specification: item?.specificationSnapshot ?? '',
      quantity: _formatQuantityValue(item?.quantityValue),
      unit: item?.quantityUnit ?? '',
      orderDate: _formatDate(order.orderDate),
      shipDate: _joinValues(
        shipments.map((shipment) => _formatDate(shipment.shipDate)),
      ),
      costAmount: formatFen(costAmount),
      saleAmount: formatFen(saleAmount),
      profitAmount: formatFen(profitAmount),
      supplierName: supplier?.supplierName ?? item?.supplierUuid ?? '',
      carrierName: _joinValues(
        shipments.map((shipment) => _labelFor(carrierLabels, shipment.carrier)),
      ),
      trackingNo: _joinValues(shipments.map((shipment) => shipment.trackingNo)),
      orderStatus: orderStatusLabels[order.orderStatus] ?? order.orderStatus,
      remark: item?.remark ?? order.remark ?? '',
    );
  }

  Future<Customer?> _customerByUuid(
    String? uuid,
    Map<String, Customer> cache,
  ) async {
    if (uuid == null || uuid.isEmpty) {
      return null;
    }

    final cached = cache[uuid];
    if (cached != null) {
      return cached;
    }

    final customer = await _customerRepository?.getByUuid(uuid);
    if (customer != null) {
      cache[uuid] = customer;
    }

    return customer;
  }

  Future<Supplier?> _supplierByUuid(
    String? uuid,
    Map<String, Supplier> cache,
  ) async {
    if (uuid == null || uuid.isEmpty) {
      return null;
    }

    final cached = cache[uuid];
    if (cached != null) {
      return cached;
    }

    final supplier = await _supplierRepository?.getByUuid(uuid);
    if (supplier != null) {
      cache[uuid] = supplier;
    }

    return supplier;
  }

  Future<List<_ShipmentBundle>> _shipmentBundles(String orderUuid) async {
    final shipmentRepository = _shipmentRepository;
    if (shipmentRepository == null) {
      return const [];
    }

    final shipments = await shipmentRepository.listByOrderUuid(orderUuid);
    final bundles = <_ShipmentBundle>[];
    for (final shipment in shipments) {
      final items = await shipmentRepository.listItemsByShipmentUuid(
        shipment.uuid,
      );
      bundles.add(_ShipmentBundle(shipment: shipment, items: items));
    }

    return bundles;
  }

  Future<Map<String, String>> _dictionaryLabels(String dictType) async {
    final dictionaryService = _dictionaryService;
    if (dictionaryService == null) {
      return const {};
    }

    await dictionaryService.initializeDefaultDictionaries();
    final dictionaries = await dictionaryService.listEnabledByType(dictType);
    return {
      for (final dictionary in dictionaries)
        dictionary.dictKey: dictionary.dictLabel,
    };
  }

  Future<String> _resolveOutputPath(
    String? outputPath,
    OrderExportMode mode,
    DateTime generatedAt,
  ) async {
    if (outputPath != null && outputPath.trim().isNotEmpty) {
      return _ensureXlsxExtension(outputPath.trim());
    }

    final directoryPath = defaultOrderExportDirectoryPath();
    final defaultPath = p.join(
      directoryPath,
      defaultOrderExportFileName(mode: mode, now: generatedAt),
    );

    return _nextAvailablePath(defaultPath);
  }

  Future<String> _nextAvailablePath(String filePath) async {
    final normalizedPath = _ensureXlsxExtension(filePath);
    if (!await File(normalizedPath).exists()) {
      return normalizedPath;
    }

    final directory = p.dirname(normalizedPath);
    final basename = p.basenameWithoutExtension(normalizedPath);
    final extension = p.extension(normalizedPath);
    var index = 1;
    while (true) {
      final candidate = p.join(directory, '$basename-$index$extension');
      if (!await File(candidate).exists()) {
        return candidate;
      }
      index += 1;
    }
  }

  String _ensureXlsxExtension(String filePath) {
    return p.extension(filePath).toLowerCase() == '.xlsx'
        ? filePath
        : '$filePath.xlsx';
  }

  String _labelFor(Map<String, String> labels, String? key) {
    if (key == null || key.trim().isEmpty) {
      return '';
    }

    return labels[key] ?? key;
  }

  String _joinValues(Iterable<String?> values) {
    final normalized = <String>[];
    for (final value in values) {
      final trimmed = value?.trim();
      if (trimmed == null || trimmed.isEmpty || normalized.contains(trimmed)) {
        continue;
      }
      normalized.add(trimmed);
    }

    return normalized.join('、');
  }

  String _formatQuantityValue(double? value) {
    if (value == null) {
      return '';
    }

    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toString();
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '';
    }

    return '${value.year}-${_two(value.month)}-${_two(value.day)}';
  }

  String _formatDateTime(DateTime value) {
    return '${_formatDate(value)} ${_two(value.hour)}:${_two(value.minute)}:${_two(value.second)}';
  }

  String _timestamp(DateTime value) {
    return '${value.year}${_two(value.month)}${_two(value.day)}_${_two(value.hour)}${_two(value.minute)}${_two(value.second)}';
  }

  String _two(int value) {
    return value.toString().padLeft(2, '0');
  }
}
