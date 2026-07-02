import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/dashboard_service.dart';
import '../../../domain/services/data_quality_service.dart';

final dashboardViewModelProvider =
    AsyncNotifierProvider.autoDispose<DashboardViewModel, DashboardState>(
      DashboardViewModel.new,
    );

class DashboardState {
  const DashboardState({
    required this.monthLabel,
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

  final String monthLabel;
  final int monthOrderCount;
  final int monthSaleAmount;
  final int monthCostAmount;
  final int monthProfitAmount;
  final int pendingShipmentOrderCount;
  final int missingCostOrderCount;
  final int missingSaleAmountOrderCount;
  final int abnormalOrderCount;
  final List<DashboardQualitySummaryState> qualitySummaries;
  final List<DashboardQualityIssueState> recentQualityIssues;
  final List<DashboardRecentOrderState> recentOrders;
  final List<DashboardRecentShipmentState> recentShipments;

  factory DashboardState.fromOverview(DashboardOverview overview) {
    final now = DateTime.now();
    return DashboardState(
      monthLabel: '${now.year}年${now.month}月',
      monthOrderCount: overview.monthOrderCount,
      monthSaleAmount: overview.monthSaleAmount,
      monthCostAmount: overview.monthCostAmount,
      monthProfitAmount: overview.monthProfitAmount,
      pendingShipmentOrderCount: overview.pendingShipmentOrderCount,
      missingCostOrderCount: overview.missingCostOrderCount,
      missingSaleAmountOrderCount: overview.missingSaleAmountOrderCount,
      abnormalOrderCount: overview.abnormalOrderCount,
      qualitySummaries: overview.qualitySummaries
          .map(DashboardQualitySummaryState.fromModel)
          .toList(),
      recentQualityIssues: overview.recentQualityIssues
          .map(DashboardQualityIssueState.fromModel)
          .toList(),
      recentOrders: overview.recentOrders
          .map(DashboardRecentOrderState.fromModel)
          .toList(),
      recentShipments: overview.recentShipments
          .map(DashboardRecentShipmentState.fromModel)
          .toList(),
    );
  }
}

class DashboardQualitySummaryState {
  const DashboardQualitySummaryState({
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

  factory DashboardQualitySummaryState.fromModel(
    DataQualityRuleSummary summary,
  ) {
    return DashboardQualitySummaryState(
      code: summary.code,
      title: summary.title,
      severity: summary.severity,
      issueCount: summary.issueCount,
      orderCount: summary.orderCount,
    );
  }
}

class DashboardQualityIssueState {
  const DashboardQualityIssueState({
    required this.code,
    required this.title,
    required this.message,
    required this.severity,
    this.orderNo,
  });

  final String code;
  final String title;
  final String message;
  final DataQualitySeverity severity;
  final String? orderNo;

  factory DashboardQualityIssueState.fromModel(DataQualityIssue issue) {
    return DashboardQualityIssueState(
      code: issue.code,
      title: issue.title,
      message: issue.message,
      severity: issue.severity,
      orderNo: issue.orderNo,
    );
  }
}

class DashboardRecentOrderState {
  const DashboardRecentOrderState({
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

  factory DashboardRecentOrderState.fromModel(DashboardRecentOrder order) {
    return DashboardRecentOrderState(
      uuid: order.uuid,
      orderNo: order.orderNo,
      customerName: order.customerName,
      orderDate: order.orderDate,
      orderStatus: order.orderStatus,
      orderStatusLabel: order.orderStatusLabel,
      totalSaleAmount: order.totalSaleAmount,
      totalProfitAmount: order.totalProfitAmount,
    );
  }
}

class DashboardRecentShipmentState {
  const DashboardRecentShipmentState({
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

  factory DashboardRecentShipmentState.fromModel(
    DashboardRecentShipment shipment,
  ) {
    return DashboardRecentShipmentState(
      uuid: shipment.uuid,
      shipmentNo: shipment.shipmentNo,
      orderNo: shipment.orderNo,
      customerName: shipment.customerName,
      carrierLabel: shipment.carrierLabel,
      trackingNo: shipment.trackingNo,
      shipDate: shipment.shipDate,
      shippingFee: shipment.shippingFee,
      shipmentStatus: shipment.shipmentStatus,
      shipmentStatusLabel: shipment.shipmentStatusLabel,
    );
  }
}

class DashboardViewModel extends AsyncNotifier<DashboardState> {
  @override
  Future<DashboardState> build() {
    return _load();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_load);
  }

  Future<DashboardState> _load() async {
    final overview = await ref.read(dashboardServiceProvider).getOverview();
    return DashboardState.fromOverview(overview);
  }

  static String formatFenToYuan(int amount) {
    final sign = amount < 0 ? '-' : '';
    final absolute = amount.abs();
    final yuan = absolute ~/ 100;
    final fen = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$yuan.$fen';
  }

  static String formatDate(DateTime? value) {
    if (value == null) {
      return '-';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }
}
