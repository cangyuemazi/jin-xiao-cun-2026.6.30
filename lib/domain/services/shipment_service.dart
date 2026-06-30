import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'audit_log_service.dart';

class CreateShipmentItemInput {
  const CreateShipmentItemInput({
    this.uuid,
    this.orderUuid,
    required this.orderItemUuid,
    this.productUuid,
    this.quantityValue,
    this.quantityUnit,
    this.itemStatus = 'draft',
    this.remark,
  });

  final String? uuid;
  final String? orderUuid;
  final String orderItemUuid;
  final String? productUuid;
  final double? quantityValue;
  final String? quantityUnit;
  final String itemStatus;
  final String? remark;
}

class CreateShipmentInput {
  const CreateShipmentInput({
    this.uuid,
    required this.shipmentNo,
    this.orderUuid,
    this.customerUuid,
    this.addressUuid,
    this.carrier,
    this.trackingNo,
    this.shipDate,
    this.shippingFee = 0,
    this.shipmentStatus = 'draft',
    this.remark,
    this.items = const [],
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String shipmentNo;
  final String? orderUuid;
  final String? customerUuid;
  final String? addressUuid;
  final String? carrier;
  final String? trackingNo;
  final DateTime? shipDate;
  final int shippingFee;
  final String shipmentStatus;
  final String? remark;
  final List<CreateShipmentItemInput> items;
  final String? operatorName;
  final String? deviceId;
}

class UpdateShipmentInput {
  const UpdateShipmentInput({
    this.customerUuid,
    this.addressUuid,
    this.carrier,
    this.trackingNo,
    this.shipDate,
    this.shippingFee,
    this.shipmentStatus,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? customerUuid;
  final String? addressUuid;
  final String? carrier;
  final String? trackingNo;
  final DateTime? shipDate;
  final int? shippingFee;
  final String? shipmentStatus;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class ShipmentService {
  ShipmentService({
    required ShipmentRepository shipmentRepository,
    OrderRepository? orderRepository,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _shipmentRepository = shipmentRepository,
       _orderRepository = orderRepository,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  final ShipmentRepository _shipmentRepository;
  final OrderRepository? _orderRepository;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<Shipment?> createShipment(CreateShipmentInput input) async {
    final shipmentUuid = input.uuid ?? _uuid.v4();

    await _shipmentRepository.create(
      ShipmentsCompanion.insert(
        uuid: shipmentUuid,
        shipmentNo: input.shipmentNo,
        orderUuid: Value(input.orderUuid),
        customerUuid: Value(input.customerUuid),
        addressUuid: Value(input.addressUuid),
        carrier: Value(input.carrier),
        trackingNo: Value(input.trackingNo),
        shipDate: Value(input.shipDate),
        shippingFee: Value(input.shippingFee),
        shipmentStatus: Value(input.shipmentStatus),
        remark: Value(input.remark),
        deviceId: Value(input.deviceId),
      ),
    );

    for (final item in input.items) {
      await _shipmentRepository.createItem(
        ShipmentItemsCompanion.insert(
          uuid: item.uuid ?? _uuid.v4(),
          shipmentUuid: shipmentUuid,
          orderUuid: Value(item.orderUuid ?? input.orderUuid),
          orderItemUuid: item.orderItemUuid,
          productUuid: Value(item.productUuid),
          quantityValue: Value(item.quantityValue),
          quantityUnit: Value(item.quantityUnit),
          itemStatus: Value(item.itemStatus),
          remark: Value(item.remark),
          deviceId: Value(input.deviceId),
        ),
      );
    }

    if (input.items.isNotEmpty) {
      await refreshShipmentStatus(shipmentUuid, recordAudit: false);
    }

    await _auditLogService?.recordCreate(
      entityType: 'shipment',
      entityUuid: shipmentUuid,
      newValue: {
        'shipment_no': input.shipmentNo,
        'tracking_no': input.trackingNo,
        'item_count': input.items.length,
      },
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create shipment',
    );

    return _shipmentRepository.getByUuid(shipmentUuid);
  }

  Future<bool> updateShipment(
    String shipmentUuid,
    UpdateShipmentInput input,
  ) async {
    final oldShipment = await _shipmentRepository.getByUuid(shipmentUuid);
    final updated = await _shipmentRepository.update(
      shipmentUuid,
      ShipmentsCompanion(
        customerUuid: _nullableValue(input.customerUuid),
        addressUuid: _nullableValue(input.addressUuid),
        carrier: _nullableValue(input.carrier),
        trackingNo: _nullableValue(input.trackingNo),
        shipDate: _nullableValue(input.shipDate),
        shippingFee: _value(input.shippingFee),
        shipmentStatus: _value(input.shipmentStatus),
        remark: _nullableValue(input.remark),
        deviceId: _nullableValue(input.deviceId),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'shipment',
        entityUuid: shipmentUuid,
        oldValue: _shipmentSnapshot(oldShipment),
        newValue: {
          if (input.trackingNo != null) 'tracking_no': input.trackingNo,
          if (input.shipDate != null) 'ship_date': input.shipDate,
          if (input.shippingFee != null) 'shipping_fee': input.shippingFee,
          if (input.shipmentStatus != null)
            'shipment_status': input.shipmentStatus,
        },
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update shipment',
      );
    }

    return updated;
  }

  Future<bool> softDeleteShipment(
    String shipmentUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldShipment = await _shipmentRepository.getByUuid(shipmentUuid);
    final deleted = await _shipmentRepository.softDelete(shipmentUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'shipment',
        entityUuid: shipmentUuid,
        oldValue: _shipmentSnapshot(oldShipment),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete shipment',
      );
    }

    return deleted;
  }

  Future<String?> refreshShipmentStatus(
    String shipmentUuid, {
    String? operatorName,
    String? deviceId,
    bool recordAudit = true,
  }) async {
    final shipment = await _shipmentRepository.getByUuid(shipmentUuid);
    if (shipment == null) {
      return null;
    }

    final items = await _shipmentRepository.listItemsByShipmentUuid(
      shipmentUuid,
    );
    final nextStatus = _resolveShipmentStatus(shipment, items);

    if (nextStatus != shipment.shipmentStatus) {
      await _shipmentRepository.update(
        shipmentUuid,
        ShipmentsCompanion(shipmentStatus: Value(nextStatus)),
      );

      if (recordAudit) {
        await _auditLogService?.recordUpdate(
          entityType: 'shipment',
          entityUuid: shipmentUuid,
          oldValue: {'shipment_status': shipment.shipmentStatus},
          newValue: {'shipment_status': nextStatus},
          operatorName: operatorName,
          deviceId: deviceId,
          remark: 'Refresh shipment status',
        );
      }
    }

    return nextStatus;
  }

  Future<String> resolveOrderShipmentStatus(String orderUuid) async {
    final shipmentItems = await _shipmentRepository.listItemsByOrderUuid(
      orderUuid,
    );
    if (shipmentItems.isEmpty) {
      return 'pending';
    }

    final orderItems = await _orderRepository?.listItemsByOrderUuid(orderUuid);
    if (orderItems == null || orderItems.isEmpty) {
      return 'partial_shipped';
    }

    var shippedCount = 0;
    for (final orderItem in orderItems) {
      final itemShipmentQuantity = shipmentItems
          .where(
            (shipmentItem) =>
                shipmentItem.orderItemUuid == orderItem.uuid &&
                shipmentItem.itemStatus != 'cancelled',
          )
          .fold<double>(
            0,
            (sum, shipmentItem) => sum + (shipmentItem.quantityValue ?? 0),
          );

      final requiredQuantity = orderItem.quantityValue;
      final shipped = requiredQuantity == null || requiredQuantity <= 0
          ? shipmentItems.any(
              (shipmentItem) =>
                  shipmentItem.orderItemUuid == orderItem.uuid &&
                  shipmentItem.itemStatus != 'cancelled',
            )
          : itemShipmentQuantity >= requiredQuantity;

      if (shipped) {
        shippedCount += 1;
      }
    }

    if (shippedCount == 0) {
      return 'pending';
    }

    return shippedCount == orderItems.length ? 'shipped' : 'partial_shipped';
  }

  String _resolveShipmentStatus(Shipment shipment, List<ShipmentItem> items) {
    if (items.isEmpty) {
      return shipment.trackingNo == null && shipment.shipDate == null
          ? 'draft'
          : 'pending';
    }

    final activeItems = items
        .where((item) => item.itemStatus != 'cancelled')
        .toList();
    if (activeItems.isEmpty) {
      return 'cancelled';
    }

    final shippedCount = activeItems
        .where(
          (item) =>
              item.itemStatus == 'shipped' ||
              item.itemStatus == 'completed' ||
              shipment.shipDate != null,
        )
        .length;

    if (shippedCount == 0) {
      return 'pending';
    }

    return shippedCount == activeItems.length ? 'shipped' : 'partial_shipped';
  }

  Value<T> _value<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Value<T?> _nullableValue<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Map<String, Object?>? _shipmentSnapshot(Shipment? shipment) {
    if (shipment == null) {
      return null;
    }

    return {
      'uuid': shipment.uuid,
      'shipment_no': shipment.shipmentNo,
      'order_uuid': shipment.orderUuid,
      'tracking_no': shipment.trackingNo,
      'shipment_status': shipment.shipmentStatus,
      'shipping_fee': shipment.shippingFee,
    };
  }
}
