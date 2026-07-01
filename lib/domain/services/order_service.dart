import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import '../../data/repositories/supplier_repository.dart';
import 'audit_log_service.dart';
import 'finance_service.dart';
import 'shipment_service.dart';

class OrderListEntry {
  const OrderListEntry({
    required this.order,
    required this.productCount,
    required this.shipmentStatus,
    this.customerName,
    this.supplierNames = const [],
    this.trackingNumbers = const [],
  });

  final SalesOrder order;
  final int productCount;
  final String shipmentStatus;
  final String? customerName;
  final List<String> supplierNames;
  final List<String> trackingNumbers;
}

class OrderDetail {
  const OrderDetail({
    required this.order,
    required this.items,
    this.customerName,
    this.supplierNamesByUuid = const {},
    this.shipments = const [],
  });

  final SalesOrder order;
  final List<SalesOrderItem> items;
  final String? customerName;
  final Map<String, String> supplierNamesByUuid;
  final List<Shipment> shipments;
}

class CreateOrderItemInput {
  const CreateOrderItemInput({
    this.uuid,
    this.productUuid,
    required this.productNameSnapshot,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    this.quantityValue,
    this.quantityUnit,
    this.saleAmount = 0,
    this.costAmount = 0,
    this.itemStatus = 'draft',
    this.supplierUuid,
    this.remark,
  });

  final String? uuid;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double? quantityValue;
  final String? quantityUnit;
  final int saleAmount;
  final int costAmount;
  final String itemStatus;
  final String? supplierUuid;
  final String? remark;
}

class CreateOrderInput {
  const CreateOrderInput({
    this.uuid,
    required this.orderNo,
    this.customerUuid,
    this.orderDate,
    this.orderStatus = 'draft',
    this.paymentStatus = 'unpaid',
    this.invoiceStatus = 'none',
    this.remark,
    this.items = const [],
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String orderNo;
  final String? customerUuid;
  final DateTime? orderDate;
  final String orderStatus;
  final String paymentStatus;
  final String invoiceStatus;
  final String? remark;
  final List<CreateOrderItemInput> items;
  final String? operatorName;
  final String? deviceId;
}

class UpdateOrderInput {
  const UpdateOrderInput({
    this.customerUuid,
    this.orderDate,
    this.orderStatus,
    this.paymentStatus,
    this.invoiceStatus,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? customerUuid;
  final DateTime? orderDate;
  final String? orderStatus;
  final String? paymentStatus;
  final String? invoiceStatus;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class OrderService {
  OrderService({
    required OrderRepository orderRepository,
    CustomerRepository? customerRepository,
    SupplierRepository? supplierRepository,
    ShipmentRepository? shipmentRepository,
    required FinanceService financeService,
    ShipmentService? shipmentService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _orderRepository = orderRepository,
       _customerRepository = customerRepository,
       _supplierRepository = supplierRepository,
       _shipmentRepository = shipmentRepository,
       _financeService = financeService,
       _shipmentService = shipmentService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  static const _terminalStatuses = {'completed', 'cancelled', 'after_sales'};

  final OrderRepository _orderRepository;
  final CustomerRepository? _customerRepository;
  final SupplierRepository? _supplierRepository;
  final ShipmentRepository? _shipmentRepository;
  final FinanceService _financeService;
  final ShipmentService? _shipmentService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<OrderListEntry>> listOrders({
    String keyword = '',
    int limit = 50,
    int offset = 0,
  }) async {
    final orders = keyword.trim().isEmpty
        ? await _orderRepository.list(limit: limit, offset: offset)
        : await _orderRepository.search(keyword, limit: limit, offset: offset);

    return Future.wait(orders.map(_buildListEntry));
  }

  Future<OrderDetail?> getOrderDetail(String orderUuid) async {
    final order = await _orderRepository.getByUuid(orderUuid);
    if (order == null) {
      return null;
    }

    final items = await _orderRepository.listItemsByOrderUuid(orderUuid);
    final supplierNamesByUuid = <String, String>{};
    for (final item in items) {
      final supplierUuid = item.supplierUuid;
      if (supplierUuid == null ||
          supplierNamesByUuid.containsKey(supplierUuid)) {
        continue;
      }

      supplierNamesByUuid[supplierUuid] =
          await _resolveSupplierName(supplierUuid) ?? supplierUuid;
    }

    final shipments =
        await _shipmentRepository?.listByOrderUuid(orderUuid) ??
        const <Shipment>[];

    return OrderDetail(
      order: order,
      items: items,
      customerName: await _resolveCustomerName(order.customerUuid),
      supplierNamesByUuid: supplierNamesByUuid,
      shipments: shipments,
    );
  }

  Future<SalesOrder?> createOrder(CreateOrderInput input) async {
    final orderUuid = input.uuid ?? _uuid.v4();

    await _orderRepository.create(
      SalesOrdersCompanion.insert(
        uuid: orderUuid,
        orderNo: input.orderNo,
        customerUuid: Value(input.customerUuid),
        orderDate: Value(input.orderDate),
        orderStatus: Value(input.orderStatus),
        paymentStatus: Value(input.paymentStatus),
        invoiceStatus: Value(input.invoiceStatus),
        remark: Value(input.remark),
        deviceId: Value(input.deviceId),
      ),
    );

    for (final item in input.items) {
      await _orderRepository.createItem(
        SalesOrderItemsCompanion.insert(
          uuid: item.uuid ?? _uuid.v4(),
          orderUuid: orderUuid,
          productUuid: Value(item.productUuid),
          productNameSnapshot: item.productNameSnapshot,
          productCodeSnapshot: Value(item.productCodeSnapshot),
          specificationSnapshot: Value(item.specificationSnapshot),
          quantityValue: Value(item.quantityValue),
          quantityUnit: Value(item.quantityUnit),
          saleAmount: Value(item.saleAmount),
          costAmount: Value(item.costAmount),
          itemStatus: Value(item.itemStatus),
          supplierUuid: Value(item.supplierUuid),
          remark: Value(item.remark),
          deviceId: Value(input.deviceId),
        ),
      );
    }

    if (input.items.isNotEmpty) {
      await refreshOrderAmounts(orderUuid, recordAudit: false);
    }

    await _auditLogService?.recordCreate(
      entityType: 'sales_order',
      entityUuid: orderUuid,
      newValue: {'order_no': input.orderNo, 'item_count': input.items.length},
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create sales order',
    );

    return _orderRepository.getByUuid(orderUuid);
  }

  Future<bool> updateOrder(String orderUuid, UpdateOrderInput input) async {
    final oldOrder = await _orderRepository.getByUuid(orderUuid);
    final updated = await _orderRepository.update(
      orderUuid,
      SalesOrdersCompanion(
        customerUuid: _nullableValue(input.customerUuid),
        orderDate: _nullableValue(input.orderDate),
        orderStatus: _value(input.orderStatus),
        paymentStatus: _value(input.paymentStatus),
        invoiceStatus: _value(input.invoiceStatus),
        remark: _nullableValue(input.remark),
        deviceId: _nullableValue(input.deviceId),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'sales_order',
        entityUuid: orderUuid,
        oldValue: _orderSnapshot(oldOrder),
        newValue: _orderUpdateSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update sales order',
      );
    }

    return updated;
  }

  Future<void> replaceOrderItems(
    String orderUuid,
    List<CreateOrderItemInput> items, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldItems = await _orderRepository.listItemsByOrderUuid(orderUuid);
    for (final item in oldItems) {
      await _orderRepository.softDeleteItem(item.uuid);
    }

    for (final item in items) {
      await _orderRepository.createItem(
        SalesOrderItemsCompanion.insert(
          uuid: item.uuid ?? _uuid.v4(),
          orderUuid: orderUuid,
          productUuid: Value(item.productUuid),
          productNameSnapshot: item.productNameSnapshot,
          productCodeSnapshot: Value(item.productCodeSnapshot),
          specificationSnapshot: Value(item.specificationSnapshot),
          quantityValue: Value(item.quantityValue),
          quantityUnit: Value(item.quantityUnit),
          saleAmount: Value(item.saleAmount),
          costAmount: Value(item.costAmount),
          itemStatus: Value(item.itemStatus),
          supplierUuid: Value(item.supplierUuid),
          remark: Value(item.remark),
          deviceId: Value(deviceId),
        ),
      );
    }

    await refreshOrderAmounts(
      orderUuid,
      operatorName: operatorName,
      deviceId: deviceId,
      recordAudit: false,
    );

    await _auditLogService?.recordUpdate(
      entityType: 'sales_order',
      entityUuid: orderUuid,
      oldValue: {'item_count': oldItems.length},
      newValue: {'item_count': items.length},
      operatorName: operatorName,
      deviceId: deviceId,
      remark: 'Replace order items',
    );
  }

  Future<bool> softDeleteOrder(
    String orderUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldOrder = await _orderRepository.getByUuid(orderUuid);
    final deleted = await _orderRepository.softDelete(orderUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'sales_order',
        entityUuid: orderUuid,
        oldValue: _orderSnapshot(oldOrder),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete sales order',
      );
    }

    return deleted;
  }

  Future<OrderAmountSummary> refreshOrderAmounts(
    String orderUuid, {
    String? operatorName,
    String? deviceId,
    bool recordAudit = true,
  }) async {
    final summary = await _financeService.calculateOrderAmountSummary(
      orderUuid,
    );

    await _orderRepository.update(
      orderUuid,
      SalesOrdersCompanion(
        totalSaleAmount: Value(summary.totalSaleAmount),
        totalCostAmount: Value(summary.totalCostAmount),
        totalProfitAmount: Value(summary.totalProfitAmount),
      ),
    );

    if (recordAudit) {
      await _auditLogService?.recordUpdate(
        entityType: 'sales_order',
        entityUuid: orderUuid,
        newValue: {
          'total_sale_amount': summary.totalSaleAmount,
          'total_cost_amount': summary.totalCostAmount,
          'total_profit_amount': summary.totalProfitAmount,
        },
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Refresh order amounts',
      );
    }

    return summary;
  }

  Future<String?> refreshOrderStatus(
    String orderUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final order = await _orderRepository.getByUuid(orderUuid);
    if (order == null) {
      return null;
    }

    if (_terminalStatuses.contains(order.orderStatus)) {
      return order.orderStatus;
    }

    final shipmentStatus = await _shipmentService?.resolveOrderShipmentStatus(
      orderUuid,
    );
    final nextStatus = switch (shipmentStatus) {
      'shipped' => 'shipped',
      'partial_shipped' => 'partial_shipped',
      _ => order.orderStatus,
    };

    if (nextStatus != order.orderStatus) {
      await _orderRepository.update(
        orderUuid,
        SalesOrdersCompanion(orderStatus: Value(nextStatus)),
      );
      await _auditLogService?.recordUpdate(
        entityType: 'sales_order',
        entityUuid: orderUuid,
        oldValue: {'order_status': order.orderStatus},
        newValue: {'order_status': nextStatus},
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Refresh order status',
      );
    }

    return nextStatus;
  }

  Value<T> _value<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Value<T?> _nullableValue<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Map<String, Object?>? _orderSnapshot(SalesOrder? order) {
    if (order == null) {
      return null;
    }

    return {
      'uuid': order.uuid,
      'order_no': order.orderNo,
      'customer_uuid': order.customerUuid,
      'order_status': order.orderStatus,
      'total_sale_amount': order.totalSaleAmount,
      'total_cost_amount': order.totalCostAmount,
      'total_profit_amount': order.totalProfitAmount,
    };
  }

  Map<String, Object?> _orderUpdateSnapshot(UpdateOrderInput input) {
    return {
      if (input.customerUuid != null) 'customer_uuid': input.customerUuid,
      if (input.orderDate != null) 'order_date': input.orderDate,
      if (input.orderStatus != null) 'order_status': input.orderStatus,
      if (input.paymentStatus != null) 'payment_status': input.paymentStatus,
      if (input.invoiceStatus != null) 'invoice_status': input.invoiceStatus,
      if (input.remark != null) 'remark': input.remark,
    };
  }

  Future<OrderListEntry> _buildListEntry(SalesOrder order) async {
    final items = await _orderRepository.listItemsByOrderUuid(order.uuid);
    final shipments =
        await _shipmentRepository?.listByOrderUuid(order.uuid) ??
        const <Shipment>[];
    final shipmentStatus =
        await _shipmentService?.resolveOrderShipmentStatus(order.uuid) ??
        (shipments.isEmpty ? 'pending' : 'partial_shipped');

    final supplierNames = <String>{};
    for (final item in items) {
      final supplierUuid = item.supplierUuid;
      if (supplierUuid == null || supplierUuid.isEmpty) {
        continue;
      }

      supplierNames.add(
        await _resolveSupplierName(supplierUuid) ?? supplierUuid,
      );
    }

    return OrderListEntry(
      order: order,
      productCount: items.length,
      shipmentStatus: shipmentStatus,
      customerName: await _resolveCustomerName(order.customerUuid),
      supplierNames: supplierNames.toList(),
      trackingNumbers: shipments
          .map((shipment) => shipment.trackingNo)
          .whereType<String>()
          .where((trackingNo) => trackingNo.isNotEmpty)
          .toSet()
          .toList(),
    );
  }

  Future<String?> _resolveCustomerName(String? customerUuid) async {
    if (customerUuid == null || customerUuid.isEmpty) {
      return null;
    }

    final customer = await _customerRepository?.getByUuid(customerUuid);
    return customer?.customerName ?? customerUuid;
  }

  Future<String?> _resolveSupplierName(String supplierUuid) async {
    if (supplierUuid.isEmpty) {
      return null;
    }

    final supplier = await _supplierRepository?.getByUuid(supplierUuid);
    return supplier?.supplierName ?? supplierUuid;
  }
}
