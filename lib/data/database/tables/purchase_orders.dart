import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class PurchaseOrders extends Table with CoreTableColumns {
  @override
  String get tableName => 'purchase_orders';

  TextColumn get purchaseNo =>
      text().named('purchase_no').withLength(min: 1, max: 96).unique()();
  TextColumn get supplierUuid => text().named('supplier_uuid').nullable()();
  TextColumn get relatedOrderUuid =>
      text().named('related_order_uuid').nullable()();
  TextColumn get purchaseType =>
      text().named('purchase_type').withDefault(const Constant('purchase'))();
  TextColumn get purchaseStatus =>
      text().named('purchase_status').withDefault(const Constant('draft'))();
  DateTimeColumn get orderDate => dateTime().named('order_date').nullable()();
  IntColumn get totalAmount =>
      integer().named('total_amount').withDefault(const Constant(0))();
}

class PurchaseOrderItems extends Table with CoreTableColumns {
  @override
  String get tableName => 'purchase_order_items';

  TextColumn get purchaseOrderUuid => text().named('purchase_order_uuid')();
  TextColumn get salesOrderItemUuid =>
      text().named('sales_order_item_uuid').nullable()();
  TextColumn get productUuid => text().named('product_uuid').nullable()();
  TextColumn get productNameSnapshot => text().named('product_name_snapshot')();
  TextColumn get productCodeSnapshot =>
      text().named('product_code_snapshot').nullable()();
  TextColumn get specificationSnapshot =>
      text().named('specification_snapshot').nullable()();
  RealColumn get quantityValue => real().named('quantity_value').nullable()();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  IntColumn get unitCostAmount =>
      integer().named('unit_cost_amount').withDefault(const Constant(0))();
  IntColumn get totalCostAmount =>
      integer().named('total_cost_amount').withDefault(const Constant(0))();
  TextColumn get itemStatus =>
      text().named('item_status').withDefault(const Constant('draft'))();
}
