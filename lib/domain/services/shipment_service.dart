import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'audit_log_service.dart';
import 'dictionary_service.dart';

class ShipmentDictionaryOption {
  const ShipmentDictionaryOption({required this.key, required this.label});

  final String key;
  final String label;
}

class ShipmentListEntry {
  const ShipmentListEntry({
    required this.shipment,
    required this.itemCount,
    required this.shipmentStatusLabel,
    this.orderNo,
    this.customerName,
    this.carrierLabel,
  });

  final Shipment shipment;
  final int itemCount;
  final String shipmentStatusLabel;
  final String? orderNo;
  final String? customerName;
  final String? carrierLabel;
}

class ShipmentDetail {
  const ShipmentDetail({
    required this.shipment,
    required this.items,
    required this.shipmentStatusLabel,
    this.orderNo,
    this.customerName,
    this.addressText,
    this.carrierLabel,
  });

  final Shipment shipment;
  final List<ShipmentItem> items;
  final String shipmentStatusLabel;
  final String? orderNo;
  final String? customerName;
  final String? addressText;
  final String? carrierLabel;
}

class ShipmentOrderOption {
  const ShipmentOrderOption({
    required this.orderUuid,
    required this.orderNo,
    this.customerName,
  });

  final String orderUuid;
  final String orderNo;
  final String? customerName;
}

class ShipmentAddressOption {
  const ShipmentAddressOption({required this.uuid, required this.label});

  final String uuid;
  final String label;
}

class ShipmentOrderItemOption {
  const ShipmentOrderItemOption({
    required this.orderItemUuid,
    required this.productNameSnapshot,
    required this.shippedQuantity,
    required this.remainingQuantity,
    required this.isFullyShipped,
    this.productUuid,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    this.quantityValue,
    this.quantityUnit,
  });

  final String orderItemUuid;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double? quantityValue;
  final String? quantityUnit;
  final double shippedQuantity;
  final double? remainingQuantity;
  final bool isFullyShipped;
}

class ShipmentOrderContext {
  const ShipmentOrderContext({
    required this.orderUuid,
    required this.orderNo,
    required this.items,
    this.customerUuid,
    this.customerName,
    this.addresses = const [],
  });

  final String orderUuid;
  final String orderNo;
  final String? customerUuid;
  final String? customerName;
  final List<ShipmentAddressOption> addresses;
  final List<ShipmentOrderItemOption> items;
}

class CreateShipmentItemInput {
  const CreateShipmentItemInput({
    this.uuid,
    this.orderUuid,
    required this.orderItemUuid,
    this.productUuid,
    this.productNameSnapshot,
    this.quantityValue,
    this.quantityUnit,
    this.isFullShipment = false,
    this.itemStatus = 'shipped',
    this.remark,
  });

  final String? uuid;
  final String? orderUuid;
  final String orderItemUuid;
  final String? productUuid;
  final String? productNameSnapshot;
  final double? quantityValue;
  final String? quantityUnit;
  final bool isFullShipment;
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
    this.shipmentStatus = 'pending',
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
    CustomerRepository? customerRepository,
    DictionaryService? dictionaryService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _shipmentRepository = shipmentRepository,
       _orderRepository = orderRepository,
       _customerRepository = customerRepository,
       _dictionaryService = dictionaryService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  static const _terminalOrderStatuses = {
    'completed',
    'cancelled',
    'after_sales',
  };

  final ShipmentRepository _shipmentRepository;
  final OrderRepository? _orderRepository;
  final CustomerRepository? _customerRepository;
  final DictionaryService? _dictionaryService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<ShipmentListEntry>> listShipments({
    String keyword = '',
    int limit = 50,
    int offset = 0,
  }) async {
    final shipments = keyword.trim().isEmpty
        ? await _shipmentRepository.list(limit: limit, offset: offset)
        : await _shipmentRepository.search(
            keyword,
            limit: limit,
            offset: offset,
          );
    final statusLabels = await _labelsByType('shipment_status');
    final carrierLabels = await _labelsByType('carrier');

    return Future.wait(
      shipments.map(
        (shipment) => _buildListEntry(
          shipment,
          statusLabels: statusLabels,
          carrierLabels: carrierLabels,
        ),
      ),
    );
  }

  Future<ShipmentDetail?> getShipmentDetail(String shipmentUuid) async {
    final shipment = await _shipmentRepository.getByUuid(shipmentUuid);
    if (shipment == null) {
      return null;
    }

    final statusLabels = await _labelsByType('shipment_status');
    final carrierLabels = await _labelsByType('carrier');
    final items = await _shipmentRepository.listItemsByShipmentUuid(
      shipmentUuid,
    );

    return ShipmentDetail(
      shipment: shipment,
      items: items,
      orderNo: await _resolveOrderNo(shipment.orderUuid),
      customerName: await _resolveCustomerName(shipment.customerUuid),
      addressText: await _resolveAddressText(shipment.addressUuid),
      carrierLabel: carrierLabels[shipment.carrier] ?? shipment.carrier,
      shipmentStatusLabel:
          statusLabels[shipment.shipmentStatus] ?? shipment.shipmentStatus,
    );
  }

  Future<List<ShipmentOrderOption>> listOrderOptions({
    String keyword = '',
    int limit = 100,
  }) async {
    final orders = keyword.trim().isEmpty
        ? await _orderRepository?.list(limit: limit)
        : await _orderRepository?.search(keyword, limit: limit);

    return [
      for (final order in orders ?? const <SalesOrder>[])
        ShipmentOrderOption(
          orderUuid: order.uuid,
          orderNo: order.orderNo,
          customerName: await _resolveCustomerName(order.customerUuid),
        ),
    ];
  }

  Future<ShipmentOrderContext?> getOrderContext(String orderUuid) async {
    final order = await _orderRepository?.getByUuid(orderUuid);
    if (order == null) {
      return null;
    }

    final orderItems =
        await _orderRepository?.listItemsByOrderUuid(orderUuid) ??
        const <SalesOrderItem>[];

    return ShipmentOrderContext(
      orderUuid: order.uuid,
      orderNo: order.orderNo,
      customerUuid: order.customerUuid,
      customerName: await _resolveCustomerName(order.customerUuid),
      addresses: await _listAddressOptions(order.customerUuid),
      items: [for (final item in orderItems) await _buildOrderItemOption(item)],
    );
  }

  Future<List<ShipmentDictionaryOption>> listCarrierOptions() {
    return _dictionaryOptions('carrier');
  }

  Future<List<ShipmentDictionaryOption>> listShipmentStatusOptions() {
    return _dictionaryOptions('shipment_status');
  }

  Future<Shipment?> createShipment(CreateShipmentInput input) async {
    if (input.items.isEmpty) {
      throw ArgumentError('Shipment must include at least one item.');
    }

    await _validateShipmentItems(input);
    final shipmentUuid = input.uuid ?? _uuid.v4();

    await _shipmentRepository.create(
      ShipmentsCompanion.insert(
        uuid: shipmentUuid,
        shipmentNo: input.shipmentNo.trim(),
        orderUuid: Value(_blankToNull(input.orderUuid)),
        customerUuid: Value(_blankToNull(input.customerUuid)),
        addressUuid: Value(_blankToNull(input.addressUuid)),
        carrier: Value(_blankToNull(input.carrier)),
        trackingNo: Value(_blankToNull(input.trackingNo)),
        shipDate: Value(input.shipDate),
        shippingFee: Value(input.shippingFee),
        shipmentStatus: Value(_normalShipmentStatus(input.shipmentStatus)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    for (final item in input.items) {
      final orderItem = await _orderRepository?.getItemByUuid(
        item.orderItemUuid,
      );
      await _shipmentRepository.createItem(
        ShipmentItemsCompanion.insert(
          uuid: item.uuid ?? _uuid.v4(),
          shipmentUuid: shipmentUuid,
          orderUuid: Value(_blankToNull(item.orderUuid ?? input.orderUuid)),
          orderItemUuid: item.orderItemUuid,
          productUuid: Value(item.productUuid ?? orderItem?.productUuid),
          productNameSnapshot: Value(
            _blankToNull(item.productNameSnapshot) ??
                orderItem?.productNameSnapshot,
          ),
          quantityValue: Value(item.quantityValue),
          quantityUnit: Value(item.quantityUnit ?? orderItem?.quantityUnit),
          isFullShipment: Value(item.isFullShipment),
          itemStatus: Value(_normalShipmentItemStatus(item.itemStatus)),
          remark: Value(_blankToNull(item.remark)),
          deviceId: Value(_blankToNull(input.deviceId)),
        ),
      );
    }

    if (input.items.isNotEmpty) {
      await refreshShipmentStatus(shipmentUuid, recordAudit: false);
      await refreshOrderShipmentStatus(input.orderUuid, recordAudit: true);
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
      await refreshShipmentStatus(shipmentUuid, recordAudit: false);
      await refreshOrderShipmentStatus(
        oldShipment?.orderUuid,
        recordAudit: true,
      );

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
      await _shipmentRepository.softDeleteItemsByShipmentUuid(shipmentUuid);
      await refreshOrderShipmentStatus(
        oldShipment?.orderUuid,
        recordAudit: true,
      );

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

  Future<String?> refreshOrderShipmentStatus(
    String? orderUuid, {
    String? operatorName,
    String? deviceId,
    bool recordAudit = false,
  }) async {
    if (orderUuid == null || orderUuid.isEmpty || _orderRepository == null) {
      return null;
    }

    final order = await _orderRepository.getByUuid(orderUuid);
    if (order == null || _terminalOrderStatuses.contains(order.orderStatus)) {
      return order?.orderStatus;
    }

    final shipmentStatus = await resolveOrderShipmentStatus(orderUuid);
    final nextStatus = switch (shipmentStatus) {
      'shipped' => 'shipped',
      'partial_shipped' => 'partial_shipped',
      'pending'
          when {'shipped', 'partial_shipped'}.contains(order.orderStatus) =>
        'ready_to_ship',
      _ => order.orderStatus,
    };

    if (nextStatus != order.orderStatus) {
      await _orderRepository.update(
        orderUuid,
        SalesOrdersCompanion(orderStatus: Value(nextStatus)),
      );

      if (recordAudit) {
        await _auditLogService?.recordUpdate(
          entityType: 'sales_order',
          entityUuid: orderUuid,
          oldValue: {'order_status': order.orderStatus},
          newValue: {'order_status': nextStatus},
          operatorName: operatorName,
          deviceId: deviceId,
          remark: 'Refresh order shipment status',
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
      if (_isOrderItemShipped(orderItem, shipmentItems)) {
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

    final hasDispatchInfo =
        shipment.shipDate != null ||
        (shipment.trackingNo != null && shipment.trackingNo!.isNotEmpty);
    final shippedCount = activeItems
        .where(
          (item) =>
              item.itemStatus == 'shipped' ||
              item.itemStatus == 'completed' ||
              hasDispatchInfo,
        )
        .length;

    if (shippedCount == 0) {
      return 'pending';
    }

    return shippedCount == activeItems.length ? 'shipped' : 'partial_shipped';
  }

  Future<void> _validateShipmentItems(CreateShipmentInput input) async {
    for (final item in input.items) {
      final orderItem = await _orderRepository?.getItemByUuid(
        item.orderItemUuid,
      );
      if (orderItem == null) {
        throw ArgumentError('Order item does not exist: ${item.orderItemUuid}');
      }

      final quantity = item.quantityValue;
      if (!item.isFullShipment && (quantity == null || quantity <= 0)) {
        throw ArgumentError('Shipment item quantity must be greater than 0.');
      }

      final requiredQuantity = orderItem.quantityValue;
      if (requiredQuantity == null || requiredQuantity <= 0) {
        continue;
      }

      final existingItems = await _shipmentRepository.listItemsByOrderItemUuid(
        item.orderItemUuid,
      );
      final nextShipped = _shippedQuantity(existingItems) + (quantity ?? 0);

      if (!item.isFullShipment && nextShipped > requiredQuantity + 0.000001) {
        throw ArgumentError('Shipment quantity exceeds order item quantity.');
      }
    }
  }

  Future<ShipmentListEntry> _buildListEntry(
    Shipment shipment, {
    required Map<String, String> statusLabels,
    required Map<String, String> carrierLabels,
  }) async {
    final items = await _shipmentRepository.listItemsByShipmentUuid(
      shipment.uuid,
    );

    return ShipmentListEntry(
      shipment: shipment,
      itemCount: items.length,
      orderNo: await _resolveOrderNo(shipment.orderUuid),
      customerName: await _resolveCustomerName(shipment.customerUuid),
      carrierLabel: carrierLabels[shipment.carrier] ?? shipment.carrier,
      shipmentStatusLabel:
          statusLabels[shipment.shipmentStatus] ?? shipment.shipmentStatus,
    );
  }

  Future<ShipmentOrderItemOption> _buildOrderItemOption(
    SalesOrderItem item,
  ) async {
    final shipmentItems = await _shipmentRepository.listItemsByOrderItemUuid(
      item.uuid,
    );
    final shippedQuantity = _shippedQuantity(shipmentItems);
    final requiredQuantity = item.quantityValue;
    final remaining = requiredQuantity == null
        ? null
        : (requiredQuantity - shippedQuantity).clamp(0, requiredQuantity);

    return ShipmentOrderItemOption(
      orderItemUuid: item.uuid,
      productUuid: item.productUuid,
      productNameSnapshot: item.productNameSnapshot,
      productCodeSnapshot: item.productCodeSnapshot,
      specificationSnapshot: item.specificationSnapshot,
      quantityValue: item.quantityValue,
      quantityUnit: item.quantityUnit,
      shippedQuantity: shippedQuantity,
      remainingQuantity: remaining?.toDouble(),
      isFullyShipped: _isOrderItemShipped(item, shipmentItems),
    );
  }

  bool _isOrderItemShipped(
    SalesOrderItem orderItem,
    List<ShipmentItem> shipmentItems,
  ) {
    final activeItems = shipmentItems
        .where(
          (shipmentItem) =>
              shipmentItem.orderItemUuid == orderItem.uuid &&
              shipmentItem.itemStatus != 'cancelled',
        )
        .toList();

    if (activeItems.any((shipmentItem) => shipmentItem.isFullShipment)) {
      return true;
    }

    final requiredQuantity = orderItem.quantityValue;
    if (requiredQuantity == null || requiredQuantity <= 0) {
      return activeItems.isNotEmpty;
    }

    return _shippedQuantity(activeItems) >= requiredQuantity;
  }

  double _shippedQuantity(List<ShipmentItem> shipmentItems) {
    return shipmentItems
        .where((item) => item.itemStatus != 'cancelled')
        .fold<double>(0, (sum, item) => sum + (item.quantityValue ?? 0));
  }

  Future<List<ShipmentAddressOption>> _listAddressOptions(
    String? customerUuid,
  ) async {
    if (customerUuid == null || customerUuid.isEmpty) {
      return const [];
    }

    final addresses =
        await _customerRepository?.listAddressesByCustomerUuid(customerUuid) ??
        const <CustomerAddressesData>[];

    return [
      for (final address in addresses)
        ShipmentAddressOption(
          uuid: address.uuid,
          label: _addressLabel(address),
        ),
    ];
  }

  Future<List<ShipmentDictionaryOption>> _dictionaryOptions(
    String dictType,
  ) async {
    await _dictionaryService?.initializeDefaultDictionaries();
    final dictionaries =
        await _dictionaryService?.listEnabledByType(dictType) ??
        const <Dictionary>[];

    return [
      for (final dictionary in dictionaries)
        ShipmentDictionaryOption(
          key: dictionary.dictKey,
          label: dictionary.dictLabel,
        ),
    ];
  }

  Future<Map<String, String>> _labelsByType(String dictType) async {
    final options = await _dictionaryOptions(dictType);
    return {for (final option in options) option.key: option.label};
  }

  Future<String?> _resolveOrderNo(String? orderUuid) async {
    if (orderUuid == null || orderUuid.isEmpty) {
      return null;
    }

    final order = await _orderRepository?.getByUuid(orderUuid);
    return order?.orderNo ?? orderUuid;
  }

  Future<String?> _resolveCustomerName(String? customerUuid) async {
    if (customerUuid == null || customerUuid.isEmpty) {
      return null;
    }

    final customer = await _customerRepository?.getByUuid(customerUuid);
    return customer?.customerName ?? customerUuid;
  }

  Future<String?> _resolveAddressText(String? addressUuid) async {
    if (addressUuid == null || addressUuid.isEmpty) {
      return null;
    }

    final address = await _customerRepository?.getAddressByUuid(addressUuid);
    return address == null ? addressUuid : _addressLabel(address);
  }

  String _addressLabel(CustomerAddressesData address) {
    final parts = [
      _blankToNull(address.recipientName),
      _blankToNull(address.phone),
      _blankToNull(address.fullAddress),
    ].whereType<String>().toList();

    return parts.isEmpty ? address.uuid : parts.join(' / ');
  }

  String _normalShipmentStatus(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'pending' : trimmed;
  }

  String _normalShipmentItemStatus(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'shipped' : trimmed;
  }

  Value<T> _value<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Value<T?> _nullableValue<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
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
