import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/inventory_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import '../../data/repositories/supplier_repository.dart';
import 'shipment_service.dart';

enum DataQualitySeverity { info, warning, danger }

class DataQualityRuleDefinition {
  const DataQualityRuleDefinition({
    required this.code,
    required this.title,
    required this.severity,
  });

  final String code;
  final String title;
  final DataQualitySeverity severity;
}

class DataQualityIssue {
  const DataQualityIssue({
    required this.code,
    required this.title,
    required this.message,
    required this.severity,
    required this.entityType,
    required this.entityUuid,
    this.orderUuid,
    this.orderNo,
  });

  final String code;
  final String title;
  final String message;
  final DataQualitySeverity severity;
  final String entityType;
  final String entityUuid;
  final String? orderUuid;
  final String? orderNo;
}

class DataQualityRuleSummary {
  const DataQualityRuleSummary({
    required this.code,
    required this.title,
    required this.severity,
    required this.issueCount,
    required this.orderCount,
  });

  final String code;
  final String title;
  final DataQualitySeverity severity;
  final int issueCount;
  final int orderCount;

  bool get hasIssues => issueCount > 0;
}

class DataQualityReport {
  const DataQualityReport({
    required this.issues,
    required this.ruleSummaries,
    required this.abnormalOrderCount,
  });

  final List<DataQualityIssue> issues;
  final List<DataQualityRuleSummary> ruleSummaries;
  final int abnormalOrderCount;

  List<DataQualityIssue> issuesForCode(String code) {
    if (code == DataQualityService.allIssuesCode) {
      return issues;
    }

    final groupedCodes = DataQualityService._groupedIssueCodes[code];
    if (groupedCodes != null) {
      return issues
          .where((issue) => groupedCodes.contains(issue.code))
          .toList();
    }

    return issues.where((issue) => issue.code == code).toList();
  }
}

class DataQualityService {
  DataQualityService({
    required OrderRepository orderRepository,
    required ShipmentRepository shipmentRepository,
    CustomerRepository? customerRepository,
    SupplierRepository? supplierRepository,
    InventoryRepository? inventoryRepository,
    ShipmentService? shipmentService,
  }) : _orderRepository = orderRepository,
       _shipmentRepository = shipmentRepository,
       _customerRepository = customerRepository,
       _supplierRepository = supplierRepository,
       _inventoryRepository = inventoryRepository,
       _shipmentService = shipmentService;

  static const allIssuesCode = 'all';
  static const missingCostGroupCode = 'missing_cost_group';
  static const missingSaleAmountGroupCode = 'missing_sale_amount_group';

  static const Map<String, Set<String>> _groupedIssueCodes = {
    missingCostGroupCode: {'shipped_missing_cost', 'sale_without_cost'},
    missingSaleAmountGroupCode: {
      'shipped_missing_sale_amount',
      'cost_without_sale',
    },
  };

  static const ruleDefinitions = [
    DataQualityRuleDefinition(
      code: 'ordered_not_shipped',
      title: '已下单但未发货',
      severity: DataQualitySeverity.info,
    ),
    DataQualityRuleDefinition(
      code: 'shipped_missing_sale_amount',
      title: '已发货但未填写销售金额',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'shipped_missing_cost',
      title: '已发货但未填写成本',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'cost_without_sale',
      title: '有成本但没有销售金额',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'sale_without_cost',
      title: '有销售金额但没有成本',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'missing_tracking_no',
      title: '快递单号为空',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'missing_ship_date',
      title: '发货时间为空',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'order_overdue',
      title: '订单超过预计交期',
      severity: DataQualitySeverity.danger,
    ),
    DataQualityRuleDefinition(
      code: 'missing_customer_phone',
      title: '客户电话为空',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'missing_supplier',
      title: '厂家为空',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'negative_profit',
      title: '毛利为负数',
      severity: DataQualitySeverity.danger,
    ),
    DataQualityRuleDefinition(
      code: 'duplicate_tracking_no',
      title: '重复快递单号',
      severity: DataQualitySeverity.danger,
    ),
    DataQualityRuleDefinition(
      code: 'duplicate_order_no',
      title: '重复订单号',
      severity: DataQualitySeverity.danger,
    ),
    DataQualityRuleDefinition(
      code: 'missing_product_unit',
      title: '产品没有单位',
      severity: DataQualitySeverity.warning,
    ),
    DataQualityRuleDefinition(
      code: 'insufficient_inventory',
      title: '库存数量不足',
      severity: DataQualitySeverity.danger,
    ),
  ];

  static final Map<String, DataQualityRuleDefinition> _definitionsByCode = {
    for (final definition in ruleDefinitions) definition.code: definition,
  };

  final OrderRepository _orderRepository;
  final ShipmentRepository _shipmentRepository;
  final CustomerRepository? _customerRepository;
  final SupplierRepository? _supplierRepository;
  final InventoryRepository? _inventoryRepository;
  final ShipmentService? _shipmentService;

  Future<DataQualityReport> analyze({int limit = 10000, DateTime? now}) async {
    final current = now ?? DateTime.now();
    final orders = await _orderRepository.list(limit: limit);
    final shipments = await _shipmentRepository.list(limit: limit);
    final inventoryItems =
        await _inventoryRepository?.list(limit: limit) ??
        const <InventoryItem>[];
    final trackingCounts = _trackingCounts(shipments);
    final orderNoCounts = _orderNoCounts(orders);
    final inventoryByProduct = _inventoryByProduct(inventoryItems);
    final customerCache = <String, Customer?>{};
    final supplierCache = <String, Supplier?>{};
    final issues = <DataQualityIssue>[];

    for (final order in orders) {
      final items = await _orderRepository.listItemsByOrderUuid(order.uuid);
      final orderShipments = shipments
          .where((shipment) => shipment.orderUuid == order.uuid)
          .toList();
      final shipmentStatus =
          await _shipmentService?.resolveOrderShipmentStatus(order.uuid) ??
          (orderShipments.isEmpty ? 'pending' : 'partial_shipped');
      final isTerminal = _terminalOrderStatuses.contains(order.orderStatus);
      final hasShipment = orderShipments.isNotEmpty;
      final isShipped = {'shipped', 'partial_shipped'}.contains(shipmentStatus);

      if (!isTerminal && shipmentStatus == 'pending') {
        issues.add(
          _orderIssue(
            code: 'ordered_not_shipped',
            order: order,
            message: '订单 ${order.orderNo} 已下单但尚未发货。',
          ),
        );
      }

      if (!isTerminal && isShipped && order.totalSaleAmount <= 0) {
        issues.add(
          _orderIssue(
            code: 'shipped_missing_sale_amount',
            order: order,
            message: '订单 ${order.orderNo} 已发货但销售金额为空。',
          ),
        );
      }

      if (!isTerminal && isShipped && order.totalCostAmount <= 0) {
        issues.add(
          _orderIssue(
            code: 'shipped_missing_cost',
            order: order,
            message: '订单 ${order.orderNo} 已发货但成本为空。',
          ),
        );
      }

      if (!isTerminal &&
          order.totalCostAmount > 0 &&
          order.totalSaleAmount <= 0) {
        issues.add(
          _orderIssue(
            code: 'cost_without_sale',
            order: order,
            message: '订单 ${order.orderNo} 已有成本但没有销售金额。',
          ),
        );
      }

      if (!isTerminal &&
          order.totalSaleAmount > 0 &&
          order.totalCostAmount <= 0) {
        issues.add(
          _orderIssue(
            code: 'sale_without_cost',
            order: order,
            message: '订单 ${order.orderNo} 已有销售金额但没有成本。',
          ),
        );
      }

      if (!isTerminal && order.totalProfitAmount < 0) {
        issues.add(
          _orderIssue(
            code: 'negative_profit',
            order: order,
            message: '订单 ${order.orderNo} 毛利为负数。',
          ),
        );
      }

      if (orderNoCounts[order.orderNo] != null &&
          orderNoCounts[order.orderNo]! > 1) {
        issues.add(
          _orderIssue(
            code: 'duplicate_order_no',
            order: order,
            message: '订单号 ${order.orderNo} 重复。',
          ),
        );
      }

      final customer = await _customerByUuid(order.customerUuid, customerCache);
      if (!_hasText(customer?.phone)) {
        issues.add(
          _orderIssue(
            code: 'missing_customer_phone',
            order: order,
            message: '订单 ${order.orderNo} 的客户电话为空。',
          ),
        );
      }

      for (final shipment in orderShipments) {
        if (!_hasText(shipment.trackingNo)) {
          issues.add(
            _shipmentIssue(
              code: 'missing_tracking_no',
              order: order,
              shipment: shipment,
              message:
                  '订单 ${order.orderNo} 的发货单 ${shipment.shipmentNo} 快递单号为空。',
            ),
          );
        } else if (trackingCounts[shipment.trackingNo] != null &&
            trackingCounts[shipment.trackingNo]! > 1) {
          issues.add(
            _shipmentIssue(
              code: 'duplicate_tracking_no',
              order: order,
              shipment: shipment,
              message: '快递单号 ${shipment.trackingNo} 重复。',
            ),
          );
        }

        if (shipment.shipDate == null) {
          issues.add(
            _shipmentIssue(
              code: 'missing_ship_date',
              order: order,
              shipment: shipment,
              message:
                  '订单 ${order.orderNo} 的发货单 ${shipment.shipmentNo} 发货时间为空。',
            ),
          );
        }
      }

      var hasMissingSupplier = false;
      var hasMissingUnit = false;
      var hasInsufficientInventory = false;
      var maxLeadDays = 0;

      for (final item in items) {
        if (!_hasText(item.supplierUuid)) {
          hasMissingSupplier = true;
        } else {
          final supplier = await _supplierByUuid(
            item.supplierUuid,
            supplierCache,
          );
          final leadDays = supplier?.defaultLeadDays ?? 0;
          if (leadDays > maxLeadDays) {
            maxLeadDays = leadDays;
          }
        }

        if (!_hasText(item.quantityUnit)) {
          hasMissingUnit = true;
        }

        if (_isInventoryInsufficient(item, inventoryByProduct)) {
          hasInsufficientInventory = true;
        }
      }

      if (hasMissingSupplier) {
        issues.add(
          _orderIssue(
            code: 'missing_supplier',
            order: order,
            message: '订单 ${order.orderNo} 存在未填写厂家的产品明细。',
          ),
        );
      }

      if (hasMissingUnit) {
        issues.add(
          _orderIssue(
            code: 'missing_product_unit',
            order: order,
            message: '订单 ${order.orderNo} 存在未填写单位的产品明细。',
          ),
        );
      }

      if (hasInsufficientInventory) {
        issues.add(
          _orderIssue(
            code: 'insufficient_inventory',
            order: order,
            message: '订单 ${order.orderNo} 存在库存数量不足的产品。',
          ),
        );
      }

      final orderDate = order.orderDate ?? order.createdAt;
      if (!isTerminal &&
          !hasShipment &&
          maxLeadDays > 0 &&
          current.isAfter(orderDate.add(Duration(days: maxLeadDays)))) {
        issues.add(
          _orderIssue(
            code: 'order_overdue',
            order: order,
            message: '订单 ${order.orderNo} 已超过预计交期 $maxLeadDays 天。',
          ),
        );
      }
    }

    return _buildReport(issues);
  }

  String ruleTitle(String code) {
    if (code == allIssuesCode) {
      return '全部异常订单';
    }

    if (code == missingCostGroupCode) {
      return '未填成本订单';
    }

    if (code == missingSaleAmountGroupCode) {
      return '未填销售金额订单';
    }

    return _definitionsByCode[code]?.title ?? code;
  }

  DataQualityReport _buildReport(List<DataQualityIssue> issues) {
    final summaries = <DataQualityRuleSummary>[];
    for (final definition in ruleDefinitions) {
      final matched = issues
          .where((issue) => issue.code == definition.code)
          .toList();
      summaries.add(
        DataQualityRuleSummary(
          code: definition.code,
          title: definition.title,
          severity: definition.severity,
          issueCount: matched.length,
          orderCount: matched
              .map((issue) => issue.orderUuid)
              .whereType<String>()
              .toSet()
              .length,
        ),
      );
    }

    return DataQualityReport(
      issues: issues,
      ruleSummaries: summaries,
      abnormalOrderCount: issues
          .map((issue) => issue.orderUuid)
          .whereType<String>()
          .toSet()
          .length,
    );
  }

  DataQualityIssue _orderIssue({
    required String code,
    required SalesOrder order,
    required String message,
  }) {
    final definition = _definitionsByCode[code]!;
    return DataQualityIssue(
      code: code,
      title: definition.title,
      message: message,
      severity: definition.severity,
      entityType: 'sales_order',
      entityUuid: order.uuid,
      orderUuid: order.uuid,
      orderNo: order.orderNo,
    );
  }

  DataQualityIssue _shipmentIssue({
    required String code,
    required SalesOrder order,
    required Shipment shipment,
    required String message,
  }) {
    final definition = _definitionsByCode[code]!;
    return DataQualityIssue(
      code: code,
      title: definition.title,
      message: message,
      severity: definition.severity,
      entityType: 'shipment',
      entityUuid: shipment.uuid,
      orderUuid: order.uuid,
      orderNo: order.orderNo,
    );
  }

  Future<Customer?> _customerByUuid(
    String? customerUuid,
    Map<String, Customer?> cache,
  ) async {
    final uuid = customerUuid?.trim();
    if (uuid == null || uuid.isEmpty) {
      return null;
    }

    if (cache.containsKey(uuid)) {
      return cache[uuid];
    }

    final customer = await _customerRepository?.getByUuid(uuid);
    cache[uuid] = customer;
    return customer;
  }

  Future<Supplier?> _supplierByUuid(
    String? supplierUuid,
    Map<String, Supplier?> cache,
  ) async {
    final uuid = supplierUuid?.trim();
    if (uuid == null || uuid.isEmpty) {
      return null;
    }

    if (cache.containsKey(uuid)) {
      return cache[uuid];
    }

    final supplier = await _supplierRepository?.getByUuid(uuid);
    cache[uuid] = supplier;
    return supplier;
  }

  bool _isInventoryInsufficient(
    SalesOrderItem item,
    Map<String, List<InventoryItem>> inventoryByProduct,
  ) {
    if (!_hasText(item.productUuid) || item.quantityValue == null) {
      return false;
    }

    final inventories = inventoryByProduct[item.productUuid] ?? const [];
    if (inventories.isEmpty) {
      return false;
    }

    final sameUnitInventories = inventories.where(
      (inventory) =>
          !_hasText(item.quantityUnit) ||
          !_hasText(inventory.quantityUnit) ||
          inventory.quantityUnit == item.quantityUnit,
    );
    final available = sameUnitInventories.fold<double>(
      0,
      (sum, inventory) => sum + inventory.quantityValue,
    );

    return available < item.quantityValue!;
  }

  Map<String, int> _trackingCounts(List<Shipment> shipments) {
    final counts = <String, int>{};
    for (final shipment in shipments) {
      final trackingNo = shipment.trackingNo?.trim();
      if (trackingNo == null || trackingNo.isEmpty) {
        continue;
      }
      counts[trackingNo] = (counts[trackingNo] ?? 0) + 1;
    }
    return counts;
  }

  Map<String, int> _orderNoCounts(List<SalesOrder> orders) {
    final counts = <String, int>{};
    for (final order in orders) {
      counts[order.orderNo] = (counts[order.orderNo] ?? 0) + 1;
    }
    return counts;
  }

  Map<String, List<InventoryItem>> _inventoryByProduct(
    List<InventoryItem> inventories,
  ) {
    final grouped = <String, List<InventoryItem>>{};
    for (final inventory in inventories) {
      final productUuid = inventory.productUuid;
      if (!_hasText(productUuid)) {
        continue;
      }
      grouped.putIfAbsent(productUuid!, () => []).add(inventory);
    }
    return grouped;
  }

  bool _hasText(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}

const _terminalOrderStatuses = {'completed', 'cancelled', 'after_sales'};
