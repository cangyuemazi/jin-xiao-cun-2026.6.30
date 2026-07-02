import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'data_quality_service.dart';
import 'dictionary_service.dart';
import 'shipment_service.dart';

class DashboardOverview {
  const DashboardOverview({
    required this.monthOrderCount,
    required this.monthSaleAmount,
    required this.monthCostAmount,
    required this.monthProfitAmount,
    required this.pendingShipmentOrderCount,
    required this.missingCostOrderCount,
    required this.missingSaleAmountOrderCount,
    required this.abnormalOrderCount,
    this.qualitySummaries = const [],
    this.recentQualityIssues = const [],
    this.recentOrders = const [],
    this.recentShipments = const [],
  });

  final int monthOrderCount;
  final int monthSaleAmount;
  final int monthCostAmount;
  final int monthProfitAmount;
  final int pendingShipmentOrderCount;
  final int missingCostOrderCount;
  final int missingSaleAmountOrderCount;
  final int abnormalOrderCount;
  final List<DataQualityRuleSummary> qualitySummaries;
  final List<DataQualityIssue> recentQualityIssues;
  final List<DashboardRecentOrder> recentOrders;
  final List<DashboardRecentShipment> recentShipments;
}

class DashboardRecentOrder {
  const DashboardRecentOrder({
    required this.uuid,
    required this.orderNo,
    required this.orderStatus,
    required this.orderStatusLabel,
    required this.totalSaleAmount,
    required this.totalProfitAmount,
    this.customerName,
    this.orderDate,
  });

  final String uuid;
  final String orderNo;
  final String? customerName;
  final DateTime? orderDate;
  final String orderStatus;
  final String orderStatusLabel;
  final int totalSaleAmount;
  final int totalProfitAmount;
}

class DashboardRecentShipment {
  const DashboardRecentShipment({
    required this.uuid,
    required this.shipmentNo,
    required this.shipmentStatus,
    required this.shipmentStatusLabel,
    required this.shippingFee,
    this.orderNo,
    this.customerName,
    this.carrierLabel,
    this.trackingNo,
    this.shipDate,
  });

  final String uuid;
  final String shipmentNo;
  final String? orderNo;
  final String? customerName;
  final String? carrierLabel;
  final String? trackingNo;
  final DateTime? shipDate;
  final int shippingFee;
  final String shipmentStatus;
  final String shipmentStatusLabel;
}

class DashboardService {
  DashboardService({
    required OrderRepository orderRepository,
    required ShipmentRepository shipmentRepository,
    CustomerRepository? customerRepository,
    DictionaryService? dictionaryService,
    ShipmentService? shipmentService,
    DataQualityService? dataQualityService,
  }) : _orderRepository = orderRepository,
       _shipmentRepository = shipmentRepository,
       _customerRepository = customerRepository,
       _dictionaryService = dictionaryService,
       _shipmentService = shipmentService,
       _dataQualityService = dataQualityService;

  static const _terminalShipmentExcludedOrderStatuses = {
    'completed',
    'cancelled',
    'after_sales',
  };

  final OrderRepository _orderRepository;
  final ShipmentRepository _shipmentRepository;
  final CustomerRepository? _customerRepository;
  final DictionaryService? _dictionaryService;
  final ShipmentService? _shipmentService;
  final DataQualityService? _dataQualityService;

  Future<DashboardOverview> getOverview({DateTime? now}) async {
    final current = now ?? DateTime.now();
    final monthStart = DateTime(current.year, current.month);
    final nextMonth = current.month == 12
        ? DateTime(current.year + 1)
        : DateTime(current.year, current.month + 1);
    final orders = await _orderRepository.list(limit: 1000);
    final qualityReport = await _dataQualityService?.analyze(now: current);
    final monthOrders = orders.where((order) {
      final date = order.orderDate ?? order.createdAt;
      return !date.isBefore(monthStart) && date.isBefore(nextMonth);
    }).toList();

    final pendingShipmentOrderCount =
        qualityReport?._orderCountForCodes({'ordered_not_shipped'}) ??
        await _fallbackPendingShipmentOrderCount(orders);
    final missingCostOrderCount =
        qualityReport?._orderCountForCodes({
          'shipped_missing_cost',
          'sale_without_cost',
        }) ??
        _fallbackMissingCostOrderCount(orders);
    final missingSaleAmountOrderCount =
        qualityReport?._orderCountForCodes({
          'shipped_missing_sale_amount',
          'cost_without_sale',
        }) ??
        _fallbackMissingSaleAmountOrderCount(orders);

    final abnormalOrderCount =
        qualityReport?.abnormalOrderCount ??
        _fallbackAbnormalOrderCount(orders);

    final orderStatusLabels = await _labelsByType('order_status');
    final shipmentStatusLabels = await _labelsByType('shipment_status');
    final carrierLabels = await _labelsByType('carrier');

    return DashboardOverview(
      monthOrderCount: monthOrders.length,
      monthSaleAmount: _sum(monthOrders, (order) => order.totalSaleAmount),
      monthCostAmount: _sum(monthOrders, (order) => order.totalCostAmount),
      monthProfitAmount: _sum(monthOrders, (order) => order.totalProfitAmount),
      pendingShipmentOrderCount: pendingShipmentOrderCount,
      missingCostOrderCount: missingCostOrderCount,
      missingSaleAmountOrderCount: missingSaleAmountOrderCount,
      abnormalOrderCount: abnormalOrderCount,
      qualitySummaries: qualityReport?.ruleSummaries ?? const [],
      recentQualityIssues: qualityReport?.issues.take(8).toList() ?? const [],
      recentOrders: await _recentOrders(orders, orderStatusLabels),
      recentShipments: await _recentShipments(
        shipmentStatusLabels,
        carrierLabels,
      ),
    );
  }

  Future<List<DashboardRecentOrder>> _recentOrders(
    List<SalesOrder> orders,
    Map<String, String> orderStatusLabels,
  ) async {
    final recent = orders.take(8).toList();

    return [
      for (final order in recent)
        DashboardRecentOrder(
          uuid: order.uuid,
          orderNo: order.orderNo,
          customerName: await _resolveCustomerName(order.customerUuid),
          orderDate: order.orderDate,
          orderStatus: order.orderStatus,
          orderStatusLabel:
              orderStatusLabels[order.orderStatus] ?? order.orderStatus,
          totalSaleAmount: order.totalSaleAmount,
          totalProfitAmount: order.totalProfitAmount,
        ),
    ];
  }

  Future<List<DashboardRecentShipment>> _recentShipments(
    Map<String, String> shipmentStatusLabels,
    Map<String, String> carrierLabels,
  ) async {
    final shipments = await _shipmentRepository.list(limit: 8);

    return [
      for (final shipment in shipments)
        await _buildRecentShipment(
          shipment,
          shipmentStatusLabels: shipmentStatusLabels,
          carrierLabels: carrierLabels,
        ),
    ];
  }

  Future<DashboardRecentShipment> _buildRecentShipment(
    Shipment shipment, {
    required Map<String, String> shipmentStatusLabels,
    required Map<String, String> carrierLabels,
  }) async {
    final order = await _resolveOrder(shipment.orderUuid);
    final customerName = await _resolveCustomerName(
      shipment.customerUuid ?? order?.customerUuid,
    );

    return DashboardRecentShipment(
      uuid: shipment.uuid,
      shipmentNo: shipment.shipmentNo,
      orderNo: order?.orderNo,
      customerName: customerName,
      carrierLabel: carrierLabels[shipment.carrier] ?? shipment.carrier,
      trackingNo: shipment.trackingNo,
      shipDate: shipment.shipDate,
      shippingFee: shipment.shippingFee,
      shipmentStatus: shipment.shipmentStatus,
      shipmentStatusLabel:
          shipmentStatusLabels[shipment.shipmentStatus] ??
          shipment.shipmentStatus,
    );
  }

  Future<Map<String, String>> _labelsByType(String dictType) async {
    await _dictionaryService?.initializeDefaultDictionaries();
    final dictionaries =
        await _dictionaryService?.listEnabledByType(dictType) ??
        const <Dictionary>[];

    return {
      for (final dictionary in dictionaries)
        dictionary.dictKey: dictionary.dictLabel,
    };
  }

  Future<SalesOrder?> _resolveOrder(String? orderUuid) async {
    if (orderUuid == null || orderUuid.isEmpty) {
      return null;
    }

    return _orderRepository.getByUuid(orderUuid);
  }

  Future<String?> _resolveCustomerName(String? customerUuid) async {
    if (customerUuid == null || customerUuid.isEmpty) {
      return null;
    }

    final customer = await _customerRepository?.getByUuid(customerUuid);
    return customer?.customerName ?? customerUuid;
  }

  int _sum(List<SalesOrder> orders, int Function(SalesOrder order) value) {
    return orders.fold<int>(0, (sum, order) => sum + value(order));
  }

  Future<int> _fallbackPendingShipmentOrderCount(
    List<SalesOrder> orders,
  ) async {
    var count = 0;
    for (final order in orders) {
      if (_terminalShipmentExcludedOrderStatuses.contains(order.orderStatus)) {
        continue;
      }

      final shipmentStatus =
          await _shipmentService?.resolveOrderShipmentStatus(order.uuid) ??
          (order.orderStatus == 'shipped' ? 'shipped' : 'pending');
      if (shipmentStatus != 'shipped') {
        count += 1;
      }
    }
    return count;
  }

  int _fallbackMissingCostOrderCount(List<SalesOrder> orders) {
    return orders
        .where(
          (order) =>
              order.orderStatus != 'cancelled' && order.totalCostAmount <= 0,
        )
        .length;
  }

  int _fallbackMissingSaleAmountOrderCount(List<SalesOrder> orders) {
    return orders
        .where(
          (order) =>
              order.orderStatus != 'cancelled' && order.totalSaleAmount <= 0,
        )
        .length;
  }

  int _fallbackAbnormalOrderCount(List<SalesOrder> orders) {
    return orders
        .where(
          (order) =>
              order.orderStatus != 'cancelled' &&
              (order.totalSaleAmount <= 0 ||
                  order.totalCostAmount <= 0 ||
                  order.totalProfitAmount < 0),
        )
        .length;
  }
}

extension on DataQualityReport {
  int _orderCountForCodes(Set<String> codes) {
    return issues
        .where((issue) => codes.contains(issue.code))
        .map((issue) => issue.orderUuid)
        .whereType<String>()
        .toSet()
        .length;
  }
}
