import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/services/shipment_service.dart';

final shipmentListViewModelProvider =
    AsyncNotifierProvider.autoDispose<ShipmentListViewModel, ShipmentListState>(
      ShipmentListViewModel.new,
    );

final shipmentDetailProvider = FutureProvider.autoDispose
    .family<ShipmentDetailViewState?, String>((ref, shipmentUuid) async {
      final detail = await ref
          .watch(shipmentServiceProvider)
          .getShipmentDetail(shipmentUuid);
      return detail == null ? null : ShipmentDetailViewState.fromDetail(detail);
    });

class ShipmentListState {
  const ShipmentListState({this.keyword = '', this.shipments = const []});

  final String keyword;
  final List<ShipmentListRowState> shipments;
}

class ShipmentListRowState {
  const ShipmentListRowState({
    required this.uuid,
    required this.shipmentNo,
    required this.shippingFee,
    required this.shipmentStatus,
    required this.shipmentStatusLabel,
    required this.itemCount,
    this.orderNo,
    this.customerName,
    this.carrier,
    this.carrierLabel,
    this.trackingNo,
    this.shipDate,
    this.remark,
  });

  final String uuid;
  final String shipmentNo;
  final String? orderNo;
  final String? customerName;
  final String? carrier;
  final String? carrierLabel;
  final String? trackingNo;
  final DateTime? shipDate;
  final int shippingFee;
  final String shipmentStatus;
  final String shipmentStatusLabel;
  final int itemCount;
  final String? remark;

  factory ShipmentListRowState.fromEntry(ShipmentListEntry entry) {
    return ShipmentListRowState(
      uuid: entry.shipment.uuid,
      shipmentNo: entry.shipment.shipmentNo,
      orderNo: entry.orderNo,
      customerName: entry.customerName,
      carrier: entry.shipment.carrier,
      carrierLabel: entry.carrierLabel,
      trackingNo: entry.shipment.trackingNo,
      shipDate: entry.shipment.shipDate,
      shippingFee: entry.shipment.shippingFee,
      shipmentStatus: entry.shipment.shipmentStatus,
      shipmentStatusLabel: entry.shipmentStatusLabel,
      itemCount: entry.itemCount,
      remark: entry.shipment.remark,
    );
  }
}

class ShipmentDetailViewState {
  const ShipmentDetailViewState({
    required this.uuid,
    required this.shipmentNo,
    required this.shippingFee,
    required this.shipmentStatus,
    required this.shipmentStatusLabel,
    this.orderNo,
    this.customerName,
    this.addressText,
    this.carrier,
    this.carrierLabel,
    this.trackingNo,
    this.shipDate,
    this.remark,
    this.items = const [],
  });

  final String uuid;
  final String shipmentNo;
  final String? orderNo;
  final String? customerName;
  final String? addressText;
  final String? carrier;
  final String? carrierLabel;
  final String? trackingNo;
  final DateTime? shipDate;
  final int shippingFee;
  final String shipmentStatus;
  final String shipmentStatusLabel;
  final String? remark;
  final List<ShipmentDetailItemState> items;

  factory ShipmentDetailViewState.fromDetail(ShipmentDetail detail) {
    return ShipmentDetailViewState(
      uuid: detail.shipment.uuid,
      shipmentNo: detail.shipment.shipmentNo,
      orderNo: detail.orderNo,
      customerName: detail.customerName,
      addressText: detail.addressText,
      carrier: detail.shipment.carrier,
      carrierLabel: detail.carrierLabel,
      trackingNo: detail.shipment.trackingNo,
      shipDate: detail.shipment.shipDate,
      shippingFee: detail.shipment.shippingFee,
      shipmentStatus: detail.shipment.shipmentStatus,
      shipmentStatusLabel: detail.shipmentStatusLabel,
      remark: detail.shipment.remark,
      items: detail.items.map(ShipmentDetailItemState.fromItem).toList(),
    );
  }
}

class ShipmentDetailItemState {
  const ShipmentDetailItemState({
    required this.uuid,
    required this.orderItemUuid,
    required this.productName,
    required this.isFullShipment,
    this.productUuid,
    this.quantityValue,
    this.quantityUnit,
    this.remark,
  });

  final String uuid;
  final String orderItemUuid;
  final String? productUuid;
  final String productName;
  final double? quantityValue;
  final String? quantityUnit;
  final bool isFullShipment;
  final String? remark;

  factory ShipmentDetailItemState.fromItem(ShipmentItem item) {
    return ShipmentDetailItemState(
      uuid: item.uuid,
      orderItemUuid: item.orderItemUuid,
      productUuid: item.productUuid,
      productName: item.productNameSnapshot ?? item.productUuid ?? '-',
      quantityValue: item.quantityValue,
      quantityUnit: item.quantityUnit,
      isFullShipment: item.isFullShipment,
      remark: item.remark,
    );
  }
}

class ShipmentListViewModel extends AsyncNotifier<ShipmentListState> {
  @override
  Future<ShipmentListState> build() {
    return _load();
  }

  Future<void> setSearchKeyword(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<void> refresh() async {
    final keyword = state.value?.keyword ?? '';
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<void> softDeleteShipment(String shipmentUuid) async {
    final keyword = state.value?.keyword ?? '';
    await ref.read(shipmentServiceProvider).softDeleteShipment(shipmentUuid);
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<ShipmentListState> _load({String keyword = ''}) async {
    final shipments = await ref
        .read(shipmentServiceProvider)
        .listShipments(keyword: keyword, limit: 100);

    return ShipmentListState(
      keyword: keyword,
      shipments: shipments.map(ShipmentListRowState.fromEntry).toList(),
    );
  }
}
