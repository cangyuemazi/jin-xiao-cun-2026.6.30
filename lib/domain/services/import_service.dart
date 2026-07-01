import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'audit_log_service.dart';
import 'customer_service.dart';
import 'finance_service.dart';
import 'order_service.dart';
import 'shipment_service.dart';
import 'supplier_service.dart';

class ImportPreviewIssue {
  const ImportPreviewIssue({
    required this.rowNumber,
    required this.field,
    required this.code,
    required this.message,
  });

  final int rowNumber;
  final String field;
  final String code;
  final String message;
}

class ImportPreviewRow {
  const ImportPreviewRow({
    required this.rowNumber,
    required this.raw,
    required this.orderNo,
    required this.productNameSnapshot,
    required this.productCodeSnapshot,
    required this.specificationSnapshot,
    required this.quantityRaw,
    required this.quantityValue,
    required this.quantityUnit,
    required this.orderDate,
    required this.shipDate,
    required this.costAmount,
    required this.saleAmount,
    required this.customerName,
    required this.customerPhone,
    required this.addressText,
    required this.supplierName,
    required this.carrier,
    required this.carrierKey,
    required this.trackingNo,
    required this.remark,
    required this.issues,
  });

  final int rowNumber;
  final Map<String, String?> raw;
  final String orderNo;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final String? quantityRaw;
  final double? quantityValue;
  final String? quantityUnit;
  final DateTime? orderDate;
  final DateTime? shipDate;
  final int? costAmount;
  final int? saleAmount;
  final String customerName;
  final String? customerPhone;
  final String? addressText;
  final String? supplierName;
  final String? carrier;
  final String? carrierKey;
  final String? trackingNo;
  final String? remark;
  final List<ImportPreviewIssue> issues;

  bool get hasIssues => issues.isNotEmpty;

  bool get canImport {
    return issues.every((issue) => !_blockingIssueCodes.contains(issue.code));
  }

  static const _blockingIssueCodes = {
    'duplicate_order_no',
    'duplicate_tracking_no',
    'invalid_money',
    'invalid_date',
    'missing_product',
  };
}

class ImportPreviewReport {
  const ImportPreviewReport({
    required this.fileName,
    required this.sheetName,
    required this.totalRows,
    required this.rows,
    required this.issues,
  });

  final String fileName;
  final String sheetName;
  final int totalRows;
  final List<ImportPreviewRow> rows;
  final List<ImportPreviewIssue> issues;

  bool get hasIssues => issues.isNotEmpty;

  int get importableRows => rows.where((row) => row.canImport).length;
}

class ImportConfirmResult {
  const ImportConfirmResult({
    required this.importUuid,
    required this.totalRows,
    required this.importedRows,
    required this.skippedRows,
    required this.issues,
  });

  final String importUuid;
  final int totalRows;
  final int importedRows;
  final int skippedRows;
  final List<ImportPreviewIssue> issues;

  bool get hasIssues => issues.isNotEmpty;
}

class QuantityParseResult {
  const QuantityParseResult({required this.value, required this.unit});

  final double value;
  final String unit;
}

class _RecipientInfo {
  const _RecipientInfo({required this.name, this.phone, this.address});

  final String name;
  final String? phone;
  final String? address;
}

class ImportService {
  ImportService({
    OrderService? orderService,
    CustomerService? customerService,
    SupplierService? supplierService,
    ShipmentService? shipmentService,
    FinanceService? financeService,
    OrderRepository? orderRepository,
    ShipmentRepository? shipmentRepository,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _orderService = orderService,
       _customerService = customerService,
       _supplierService = supplierService,
       _shipmentService = shipmentService,
       _financeService = financeService,
       _orderRepository = orderRepository,
       _shipmentRepository = shipmentRepository,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  static const orderImportHeaders = [
    '序号',
    '产品名称',
    '货号',
    '规格',
    '重量',
    '客户下单时间',
    '给客户发货时间',
    '成本价',
    '销售金额',
    '收件人信息',
    '厂家',
    '发货方式',
    '快递单号',
    '备注',
  ];

  final OrderService? _orderService;
  final CustomerService? _customerService;
  final SupplierService? _supplierService;
  final ShipmentService? _shipmentService;
  final FinanceService? _financeService;
  final OrderRepository? _orderRepository;
  final ShipmentRepository? _shipmentRepository;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<ImportPreviewReport> previewOrderExcelFile(String path) async {
    final bytes = await File(path).readAsBytes();
    return previewOrderExcelBytes(
      bytes,
      fileName: path.split(Platform.pathSeparator).last,
    );
  }

  ImportPreviewReport previewOrderExcelBytes(
    Uint8List bytes, {
    String fileName = '',
  }) {
    final excel = Excel.decodeBytes(bytes);
    if (excel.tables.isEmpty) {
      return const ImportPreviewReport(
        fileName: '',
        sheetName: '',
        totalRows: 0,
        rows: [],
        issues: [
          ImportPreviewIssue(
            rowNumber: 1,
            field: '文件',
            code: 'empty_workbook',
            message: 'Excel 文件中没有工作表。',
          ),
        ],
      );
    }

    final sheetName = excel.tables.keys.first;
    final sheet = excel.tables[sheetName]!;
    final rows = _rowsFromSheet(sheet);
    return buildOrderImportPreview(
      rows,
      fileName: fileName,
      sheetName: sheetName,
    );
  }

  ImportPreviewReport buildOrderImportPreview(
    List<Map<String, String?>> rows, {
    String fileName = '',
    String sheetName = '',
  }) {
    final previewRows = <ImportPreviewRow>[];
    final issues = <ImportPreviewIssue>[];
    final orderNumbers = <String>{};
    final trackingNumbers = <String>{};

    for (var index = 0; index < rows.length; index += 1) {
      final row = rows[index];
      final rowNumber = index + 2;
      final rowIssues = <ImportPreviewIssue>[];
      final legacyNo = _blankToNull(row['序号']);
      final orderNo = legacyNo ?? _generatedOrderNo(index);
      final quantity = parseQuantity(row['重量']);
      final costAmount = parseMoneyToFen(row['成本价']);
      final saleAmount = parseMoneyToFen(row['销售金额']);
      final recipient = _parseRecipient(row['收件人信息']);
      final orderDate = parseDate(row['客户下单时间']);
      final shipDate = parseDate(row['给客户发货时间']);
      final trackingNo = _blankToNull(row['快递单号']);
      final supplierName = _blankToNull(row['厂家']);
      final carrier = _blankToNull(row['发货方式']);

      _checkDuplicate(
        issues: rowIssues,
        rowNumber: rowNumber,
        field: '序号',
        value: orderNo,
        seenValues: orderNumbers,
        code: 'duplicate_order_no',
        message: '重复订单号。',
      );
      _checkDuplicate(
        issues: rowIssues,
        rowNumber: rowNumber,
        field: '快递单号',
        value: trackingNo,
        seenValues: trackingNumbers,
        code: 'duplicate_tracking_no',
        message: '重复快递单号。',
      );

      if (_isBlank(row['产品名称'])) {
        rowIssues.add(_issue(rowNumber, '产品名称', 'missing_product', '产品名称为空。'));
      }

      if (_isBlank(row['销售金额'])) {
        rowIssues.add(
          _issue(rowNumber, '销售金额', 'missing_sale_amount', '销售金额为空。'),
        );
      } else if (saleAmount == null) {
        rowIssues.add(_issue(rowNumber, '销售金额', 'invalid_money', '无法识别金额。'));
      }

      if (_isBlank(row['成本价'])) {
        rowIssues.add(_issue(rowNumber, '成本价', 'missing_cost', '成本为空。'));
      } else if (costAmount == null) {
        rowIssues.add(_issue(rowNumber, '成本价', 'invalid_money', '无法识别金额。'));
      }

      if (!_isBlank(row['重量']) && quantity == null) {
        rowIssues.add(_issue(rowNumber, '重量', 'invalid_quantity', '无法识别数量单位。'));
      }

      if (_blankToNull(recipient.phone) == null) {
        rowIssues.add(
          _issue(rowNumber, '收件人信息', 'missing_customer_phone', '客户电话为空。'),
        );
      }

      if (supplierName == null) {
        rowIssues.add(_issue(rowNumber, '厂家', 'missing_supplier', '厂家为空。'));
      }

      if (trackingNo == null) {
        rowIssues.add(
          _issue(rowNumber, '快递单号', 'missing_tracking_no', '快递单号为空。'),
        );
      }

      _checkDate(rowIssues, rowNumber, '客户下单时间', row['客户下单时间']);
      _checkDate(rowIssues, rowNumber, '给客户发货时间', row['给客户发货时间']);

      previewRows.add(
        ImportPreviewRow(
          rowNumber: rowNumber,
          raw: row,
          orderNo: orderNo,
          productNameSnapshot: _blankToNull(row['产品名称']) ?? '',
          productCodeSnapshot: _blankToNull(row['货号']),
          specificationSnapshot: _blankToNull(row['规格']),
          quantityRaw: _blankToNull(row['重量']),
          quantityValue: quantity?.value,
          quantityUnit: quantity?.unit,
          orderDate: orderDate,
          shipDate: shipDate,
          costAmount: costAmount,
          saleAmount: saleAmount,
          customerName: recipient.name,
          customerPhone: _blankToNull(recipient.phone),
          addressText: _blankToNull(recipient.address),
          supplierName: supplierName,
          carrier: carrier,
          carrierKey: _carrierKey(carrier),
          trackingNo: trackingNo,
          remark: _buildRemark(
            legacyNo: legacyNo,
            rowRemark: row['备注'],
            quantityRaw: quantity == null ? row['重量'] : null,
          ),
          issues: rowIssues,
        ),
      );
      issues.addAll(rowIssues);
    }

    return ImportPreviewReport(
      fileName: fileName,
      sheetName: sheetName,
      totalRows: rows.length,
      rows: previewRows,
      issues: issues,
    );
  }

  Future<ImportConfirmResult> confirmOrderImport(
    ImportPreviewReport preview, {
    String? operatorName,
    String? deviceId,
  }) async {
    final issues = [...preview.issues];
    final importUuid = _uuid.v4();
    var importedRows = 0;

    for (final row in preview.rows) {
      if (!row.canImport) {
        continue;
      }

      if (await _orderNoExists(row.orderNo)) {
        issues.add(_issue(row.rowNumber, '序号', 'duplicate_order_no', '重复订单号。'));
        continue;
      }

      if (row.trackingNo != null && await _trackingNoExists(row.trackingNo!)) {
        issues.add(
          _issue(row.rowNumber, '快递单号', 'duplicate_tracking_no', '重复快递单号。'),
        );
        continue;
      }

      final customer = await _findOrCreateCustomer(row, deviceId: deviceId);
      final address = await _createAddressIfNeeded(
        row,
        customerUuid: customer?.uuid,
        deviceId: deviceId,
      );
      final supplier = await _findOrCreateSupplier(row, deviceId: deviceId);

      final order = await _orderService?.createOrder(
        CreateOrderInput(
          orderNo: row.orderNo,
          customerUuid: customer?.uuid,
          orderDate: row.orderDate,
          orderStatus: 'confirmed',
          remark: row.remark,
          operatorName: operatorName,
          deviceId: deviceId,
          items: [
            CreateOrderItemInput(
              productNameSnapshot: row.productNameSnapshot,
              productCodeSnapshot: row.productCodeSnapshot,
              specificationSnapshot: row.specificationSnapshot,
              quantityValue: row.quantityValue,
              quantityUnit: row.quantityUnit,
              saleAmount: row.saleAmount ?? 0,
              costAmount: row.costAmount ?? 0,
              supplierUuid: supplier?.uuid,
              remark: row.remark,
            ),
          ],
        ),
      );

      if (order == null) {
        continue;
      }

      final items = await _orderRepository?.listItemsByOrderUuid(order.uuid);
      final orderItem = items?.isEmpty == false ? items!.first : null;

      if (row.costAmount != null) {
        await _financeService?.createExpense(
          CreateExpenseInput(
            relatedType: orderItem == null ? 'sales_order' : 'sales_order_item',
            relatedUuid: orderItem?.uuid ?? order.uuid,
            expenseType: 'product_cost',
            amount: row.costAmount!,
            expenseDate: row.orderDate,
            orderUuid: order.uuid,
            supplierUuid: supplier?.uuid,
            remark: row.remark,
            operatorName: operatorName,
            deviceId: deviceId,
          ),
        );
      }

      if (orderItem != null &&
          (row.trackingNo != null ||
              row.carrierKey != null ||
              row.shipDate != null)) {
        await _shipmentService?.createShipment(
          CreateShipmentInput(
            shipmentNo: 'FH-${row.orderNo}',
            orderUuid: order.uuid,
            customerUuid: customer?.uuid,
            addressUuid: address?.uuid,
            carrier: row.carrierKey ?? row.carrier,
            trackingNo: row.trackingNo,
            shipDate: row.shipDate,
            shipmentStatus: row.shipDate == null && row.trackingNo == null
                ? 'pending'
                : 'shipped',
            remark: row.remark,
            operatorName: operatorName,
            deviceId: deviceId,
            items: [
              CreateShipmentItemInput(
                orderUuid: order.uuid,
                orderItemUuid: orderItem.uuid,
                productUuid: orderItem.productUuid,
                productNameSnapshot: row.productNameSnapshot,
                quantityValue: row.quantityValue,
                quantityUnit: row.quantityUnit,
                isFullShipment: true,
                remark: row.remark,
              ),
            ],
          ),
        );
      }

      importedRows += 1;
    }

    await _auditLogService?.recordImport(
      importUuid: importUuid,
      newValue: {
        'file_name': preview.fileName,
        'sheet_name': preview.sheetName,
        'total_rows': preview.totalRows,
        'imported_rows': importedRows,
        'issue_count': issues.length,
      },
      operatorName: operatorName,
      deviceId: deviceId,
      remark: 'Excel order import',
    );

    return ImportConfirmResult(
      importUuid: importUuid,
      totalRows: preview.totalRows,
      importedRows: importedRows,
      skippedRows: preview.totalRows - importedRows,
      issues: issues,
    );
  }

  int? parseMoneyToFen(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final normalized = value.replaceAll(RegExp(r'[,\s¥￥]'), '');
    final match = RegExp(r'^(-)?(\d+)(?:\.(\d{1,2}))?$').firstMatch(normalized);
    if (match == null) {
      return null;
    }

    final sign = match.group(1) == '-' ? -1 : 1;
    final yuan = int.parse(match.group(2)!);
    final centsText = (match.group(3) ?? '').padRight(2, '0');
    final cents = centsText.isEmpty ? 0 : int.parse(centsText);

    return sign * (yuan * 100 + cents);
  }

  QuantityParseResult? parseQuantity(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final match = RegExp(
      r'^([0-9]+(?:\.[0-9]+)?)\s*([a-zA-Zμµ\u4e00-\u9fa5]+)$',
    ).firstMatch(value);
    if (match == null) {
      return null;
    }

    return QuantityParseResult(
      value: double.parse(match.group(1)!),
      unit: match.group(2)!,
    );
  }

  DateTime? parseDate(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final normalized = value.replaceAll('/', '-').replaceAll('.', '-');
    final excelSerial = double.tryParse(normalized);
    if (excelSerial != null && excelSerial > 20000 && excelSerial < 80000) {
      return DateTime(1899, 12, 30).add(Duration(days: excelSerial.floor()));
    }

    return DateTime.tryParse(normalized);
  }

  Future<bool> _orderNoExists(String orderNo) async {
    final matches = await _orderRepository?.search(orderNo, limit: 10);
    return matches?.any((order) => order.orderNo == orderNo) ?? false;
  }

  Future<bool> _trackingNoExists(String trackingNo) async {
    final matches = await _shipmentRepository?.search(trackingNo, limit: 10);
    return matches?.any((shipment) => shipment.trackingNo == trackingNo) ??
        false;
  }

  Future<Customer?> _findOrCreateCustomer(
    ImportPreviewRow row, {
    String? deviceId,
  }) async {
    final keyword = row.customerPhone ?? row.customerName;
    final matches = await _customerService?.listCustomers(
      keyword: keyword,
      limit: 10,
    );
    final existing = matches
        ?.map((entry) => entry.customer)
        .where(
          (customer) =>
              customer.phone == row.customerPhone ||
              customer.customerName == row.customerName,
        )
        .firstOrNull;
    if (existing != null) {
      return existing;
    }

    return _customerService?.createCustomer(
      CreateCustomerInput(
        customerName: row.customerName,
        phone: row.customerPhone,
        remark: 'Excel 导入创建',
        deviceId: deviceId,
      ),
    );
  }

  Future<CustomerAddressesData?> _createAddressIfNeeded(
    ImportPreviewRow row, {
    required String? customerUuid,
    String? deviceId,
  }) async {
    if (customerUuid == null || row.addressText == null) {
      return null;
    }

    return _customerService?.createAddress(
      CreateCustomerAddressInput(
        customerUuid: customerUuid,
        recipientName: row.customerName,
        phone: row.customerPhone,
        detailAddress: row.addressText,
        isDefault: true,
        remark: 'Excel 导入创建',
        deviceId: deviceId,
      ),
    );
  }

  Future<Supplier?> _findOrCreateSupplier(
    ImportPreviewRow row, {
    String? deviceId,
  }) async {
    final supplierName = row.supplierName;
    if (supplierName == null) {
      return null;
    }

    final matches = await _supplierService?.listSuppliers(
      keyword: supplierName,
      limit: 10,
    );
    final existing = matches
        ?.map((entry) => entry.supplier)
        .where((supplier) => supplier.supplierName == supplierName)
        .firstOrNull;
    if (existing != null) {
      return existing;
    }

    return _supplierService?.createSupplier(
      CreateSupplierInput(
        supplierName: supplierName,
        supplierType: 'manufacturer',
        remark: 'Excel 导入创建',
        deviceId: deviceId,
      ),
    );
  }

  List<Map<String, String?>> _rowsFromSheet(Sheet sheet) {
    final rows = sheet.rows;
    if (rows.isEmpty) {
      return const [];
    }

    final headerIndexes = <String, int>{};
    final headerRow = rows.first;
    for (var index = 0; index < headerRow.length; index += 1) {
      final header = _cellText(headerRow[index]);
      if (header != null && orderImportHeaders.contains(header)) {
        headerIndexes[header] = index;
      }
    }

    return [
      for (var rowIndex = 1; rowIndex < rows.length; rowIndex += 1)
        if (!_isEmptyRow(rows[rowIndex]))
          {
            for (final header in orderImportHeaders)
              header: _cellText(
                _cellAt(rows[rowIndex], headerIndexes[header] ?? -1),
              ),
          },
    ];
  }

  Data? _cellAt(List<Data?> row, int index) {
    if (index < 0 || index >= row.length) {
      return null;
    }

    return row[index];
  }

  String? _cellText(Data? cell) {
    final value = cell?.value;
    if (value == null) {
      return null;
    }

    final text = switch (value) {
      TextCellValue() => value.value.text,
      DateCellValue() => _formatDate(value.asDateTimeLocal()),
      DateTimeCellValue() => _formatDate(value.asDateTimeLocal()),
      TimeCellValue() => value.toString(),
      IntCellValue() => value.value.toString(),
      DoubleCellValue() => _formatNumber(value.value),
      BoolCellValue() => value.value ? 'true' : 'false',
      FormulaCellValue() => value.formula,
    };

    return _blankToNull(text);
  }

  bool _isEmptyRow(List<Data?> row) {
    return row.every((cell) => _cellText(cell) == null);
  }

  _RecipientInfo _parseRecipient(String? raw) {
    final text = _blankToNull(raw);
    if (text == null) {
      return const _RecipientInfo(name: '未知客户');
    }

    final phoneMatch = RegExp(r'1[3-9]\d{9}').firstMatch(text);
    final phone = phoneMatch?.group(0);
    final withoutPhone = phone == null ? text : text.replaceFirst(phone, ' ');
    final parts = withoutPhone
        .split(RegExp(r'[\s,，;；]+'))
        .map(_blankToNull)
        .whereType<String>()
        .toList();
    final name = parts.isEmpty ? '未知客户' : parts.first;
    final address = parts.length <= 1 ? null : parts.skip(1).join(' ');

    return _RecipientInfo(name: name, phone: phone, address: address);
  }

  void _checkDuplicate({
    required List<ImportPreviewIssue> issues,
    required int rowNumber,
    required String field,
    required String? value,
    required Set<String> seenValues,
    required String code,
    required String message,
  }) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return;
    }

    if (!seenValues.add(normalized)) {
      issues.add(_issue(rowNumber, field, code, message));
    }
  }

  void _checkDate(
    List<ImportPreviewIssue> issues,
    int rowNumber,
    String field,
    String? value,
  ) {
    if (_isBlank(value)) {
      return;
    }

    if (parseDate(value) == null) {
      issues.add(_issue(rowNumber, field, 'invalid_date', '日期格式异常。'));
    }
  }

  ImportPreviewIssue _issue(
    int rowNumber,
    String field,
    String code,
    String message,
  ) {
    return ImportPreviewIssue(
      rowNumber: rowNumber,
      field: field,
      code: code,
      message: message,
    );
  }

  String _generatedOrderNo(int index) {
    final now = DateTime.now();
    return 'IMP${now.year}${_two(now.month)}${_two(now.day)}${_two(index + 1)}';
  }

  String? _carrierKey(String? carrier) {
    final normalized = carrier?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    const mapping = {
      '顺丰': 'sf',
      'sf': 'sf',
      '京东': 'jd',
      'jd': 'jd',
      '中通': 'zt',
      'zt': 'zt',
      '圆通': 'yt',
      'yt': 'yt',
      '申通': 'sto',
      'sto': 'sto',
      '韵达': 'yd',
      'yd': 'yd',
      'ems': 'ems',
    };

    return mapping[normalized] ?? normalized;
  }

  String? _buildRemark({
    required String? legacyNo,
    required String? rowRemark,
    required String? quantityRaw,
  }) {
    final parts = [
      if (_blankToNull(legacyNo) != null) 'legacy_no: ${legacyNo!.trim()}',
      if (_blankToNull(quantityRaw) != null)
        'raw_quantity: ${quantityRaw!.trim()}',
      if (_blankToNull(rowRemark) != null) rowRemark!.trim(),
    ];

    return parts.isEmpty ? null : parts.join('\n');
  }

  String _formatDate(DateTime value) {
    return '${value.year}-${_two(value.month)}-${_two(value.day)}';
  }

  String _formatNumber(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toString();
  }

  String _two(int value) {
    return value.toString().padLeft(2, '0');
  }

  bool _isBlank(String? value) {
    return value == null || value.trim().isEmpty;
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
