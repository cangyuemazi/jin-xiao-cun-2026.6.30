import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/order_service.dart';

final orderListViewModelProvider =
    AsyncNotifierProvider.autoDispose<OrderListViewModel, OrderListState>(
      OrderListViewModel.new,
    );

final orderDetailProvider = FutureProvider.autoDispose
    .family<OrderDetailViewState?, String>((ref, orderUuid) async {
      final detail = await ref
          .watch(orderServiceProvider)
          .getOrderDetail(orderUuid);
      return detail == null ? null : OrderDetailViewState.fromDetail(detail);
    });

class OrderListState {
  const OrderListState({
    this.keyword = '',
    this.qualityFilterCode,
    this.qualityFilterLabel,
    this.qualityIssueCount = 0,
    this.orders = const [],
  });

  final String keyword;
  final String? qualityFilterCode;
  final String? qualityFilterLabel;
  final int qualityIssueCount;
  final List<OrderListRowState> orders;

  bool get hasQualityFilter => qualityFilterCode != null;

  OrderListState copyWith({
    String? keyword,
    String? qualityFilterCode,
    String? qualityFilterLabel,
    int? qualityIssueCount,
    List<OrderListRowState>? orders,
    bool clearQualityFilter = false,
  }) {
    return OrderListState(
      keyword: keyword ?? this.keyword,
      qualityFilterCode: clearQualityFilter
          ? null
          : qualityFilterCode ?? this.qualityFilterCode,
      qualityFilterLabel: clearQualityFilter
          ? null
          : qualityFilterLabel ?? this.qualityFilterLabel,
      qualityIssueCount: clearQualityFilter
          ? 0
          : qualityIssueCount ?? this.qualityIssueCount,
      orders: orders ?? this.orders,
    );
  }
}

class OrderListRowState {
  const OrderListRowState({
    required this.uuid,
    required this.orderNo,
    required this.productCount,
    required this.shipmentStatus,
    required this.orderStatus,
    required this.totalSaleAmount,
    required this.totalCostAmount,
    required this.totalProfitAmount,
    this.customerName,
    this.orderDate,
    this.supplierNames = const [],
    this.trackingNumbers = const [],
  });

  final String uuid;
  final String orderNo;
  final String? customerName;
  final int productCount;
  final DateTime? orderDate;
  final String shipmentStatus;
  final int totalSaleAmount;
  final int totalCostAmount;
  final int totalProfitAmount;
  final List<String> supplierNames;
  final List<String> trackingNumbers;
  final String orderStatus;

  factory OrderListRowState.fromEntry(OrderListEntry entry) {
    return OrderListRowState(
      uuid: entry.order.uuid,
      orderNo: entry.order.orderNo,
      customerName: entry.customerName,
      productCount: entry.productCount,
      orderDate: entry.order.orderDate,
      shipmentStatus: entry.shipmentStatus,
      totalSaleAmount: entry.order.totalSaleAmount,
      totalCostAmount: entry.order.totalCostAmount,
      totalProfitAmount: entry.order.totalProfitAmount,
      supplierNames: entry.supplierNames,
      trackingNumbers: entry.trackingNumbers,
      orderStatus: entry.order.orderStatus,
    );
  }
}

class OrderDetailViewState {
  const OrderDetailViewState({
    required this.uuid,
    required this.orderNo,
    required this.orderStatus,
    required this.totalSaleAmount,
    required this.totalCostAmount,
    required this.totalProfitAmount,
    this.customerName,
    this.orderDate,
    this.items = const [],
    this.shipments = const [],
  });

  final String uuid;
  final String orderNo;
  final String? customerName;
  final String orderStatus;
  final int totalSaleAmount;
  final int totalCostAmount;
  final int totalProfitAmount;
  final DateTime? orderDate;
  final List<OrderDetailItemState> items;
  final List<OrderShipmentState> shipments;

  factory OrderDetailViewState.fromDetail(OrderDetail detail) {
    return OrderDetailViewState(
      uuid: detail.order.uuid,
      orderNo: detail.order.orderNo,
      customerName: detail.customerName,
      orderStatus: detail.order.orderStatus,
      totalSaleAmount: detail.order.totalSaleAmount,
      totalCostAmount: detail.order.totalCostAmount,
      totalProfitAmount: detail.order.totalProfitAmount,
      orderDate: detail.order.orderDate,
      items: detail.items
          .map(
            (item) => OrderDetailItemState(
              productName: item.productNameSnapshot,
              productCode: item.productCodeSnapshot,
              specification: item.specificationSnapshot,
              quantityValue: item.quantityValue,
              quantityUnit: item.quantityUnit,
              saleAmount: item.saleAmount,
              costAmount: item.costAmount,
              supplierName:
                  detail.supplierNamesByUuid[item.supplierUuid] ??
                  item.supplierUuid,
            ),
          )
          .toList(),
      shipments: detail.shipments
          .map(
            (shipment) => OrderShipmentState(
              shipmentNo: shipment.shipmentNo,
              carrier: shipment.carrier,
              trackingNo: shipment.trackingNo,
              shipmentStatus: shipment.shipmentStatus,
              shippingFee: shipment.shippingFee,
            ),
          )
          .toList(),
    );
  }
}

class OrderDetailItemState {
  const OrderDetailItemState({
    required this.productName,
    required this.saleAmount,
    required this.costAmount,
    this.productCode,
    this.specification,
    this.quantityValue,
    this.quantityUnit,
    this.supplierName,
  });

  final String productName;
  final String? productCode;
  final String? specification;
  final double? quantityValue;
  final String? quantityUnit;
  final int saleAmount;
  final int costAmount;
  final String? supplierName;
}

class OrderShipmentState {
  const OrderShipmentState({
    required this.shipmentNo,
    required this.shipmentStatus,
    required this.shippingFee,
    this.carrier,
    this.trackingNo,
  });

  final String shipmentNo;
  final String? carrier;
  final String? trackingNo;
  final String shipmentStatus;
  final int shippingFee;
}

class OrderListViewModel extends AsyncNotifier<OrderListState> {
  @override
  Future<OrderListState> build() async {
    return _load();
  }

  Future<void> setSearchKeyword(String keyword) async {
    final qualityFilterCode = state.value?.qualityFilterCode;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(keyword: keyword, qualityFilterCode: qualityFilterCode),
    );
  }

  Future<void> setQualityFilter(String? code) async {
    final keyword = state.value?.keyword ?? '';
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(keyword: keyword, qualityFilterCode: code),
    );
  }

  Future<void> clearQualityFilter() {
    return setQualityFilter(null);
  }

  Future<void> refresh() async {
    final keyword = state.value?.keyword ?? '';
    final qualityFilterCode = state.value?.qualityFilterCode;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(keyword: keyword, qualityFilterCode: qualityFilterCode),
    );
  }

  Future<void> softDeleteOrder(String orderUuid) async {
    final keyword = state.value?.keyword ?? '';
    final qualityFilterCode = state.value?.qualityFilterCode;
    await ref.read(orderServiceProvider).softDeleteOrder(orderUuid);
    state = await AsyncValue.guard(
      () => _load(keyword: keyword, qualityFilterCode: qualityFilterCode),
    );
  }

  Future<OrderListState> _load({
    String keyword = '',
    String? qualityFilterCode,
  }) async {
    if (qualityFilterCode != null) {
      final report = await ref.read(dataQualityServiceProvider).analyze();
      final issues = report.issuesForCode(qualityFilterCode);
      final orderUuids = issues
          .map((issue) => issue.orderUuid)
          .whereType<String>()
          .toSet();
      final entries = await ref
          .read(orderServiceProvider)
          .listOrdersByUuids(orderUuids);
      final filteredEntries = _filterEntriesByKeyword(entries, keyword);

      return OrderListState(
        keyword: keyword,
        qualityFilterCode: qualityFilterCode,
        qualityFilterLabel: ref
            .read(dataQualityServiceProvider)
            .ruleTitle(qualityFilterCode),
        qualityIssueCount: issues.length,
        orders: filteredEntries.map(OrderListRowState.fromEntry).toList(),
      );
    }

    final orders = await ref
        .read(orderServiceProvider)
        .listOrders(keyword: keyword, limit: 100);

    return OrderListState(
      keyword: keyword,
      orders: orders.map(OrderListRowState.fromEntry).toList(),
    );
  }

  List<OrderListEntry> _filterEntriesByKeyword(
    List<OrderListEntry> entries,
    String keyword,
  ) {
    final normalized = keyword.trim().toLowerCase();
    if (normalized.isEmpty) {
      return entries;
    }

    return entries.where((entry) {
      return entry.order.orderNo.toLowerCase().contains(normalized) ||
          (entry.customerName ?? '').toLowerCase().contains(normalized) ||
          entry.order.orderStatus.toLowerCase().contains(normalized);
    }).toList();
  }
}
