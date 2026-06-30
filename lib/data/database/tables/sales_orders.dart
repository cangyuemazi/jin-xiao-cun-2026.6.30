import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class SalesOrders extends Table with CoreTableColumns {
  @override
  String get tableName => 'sales_orders';

  TextColumn get orderNo =>
      text().named('order_no').withLength(min: 1, max: 96).unique()();
  TextColumn get customerUuid => text().named('customer_uuid').nullable()();
  DateTimeColumn get orderDate => dateTime().named('order_date').nullable()();
  TextColumn get orderStatus =>
      text().named('order_status').withDefault(const Constant('draft'))();
  TextColumn get paymentStatus =>
      text().named('payment_status').withDefault(const Constant('unpaid'))();
  TextColumn get invoiceStatus =>
      text().named('invoice_status').withDefault(const Constant('none'))();
  IntColumn get totalSaleAmount =>
      integer().named('total_sale_amount').withDefault(const Constant(0))();
  IntColumn get totalCostAmount =>
      integer().named('total_cost_amount').withDefault(const Constant(0))();
  IntColumn get totalProfitAmount =>
      integer().named('total_profit_amount').withDefault(const Constant(0))();
}

class SalesOrderItems extends Table with CoreTableColumns {
  @override
  String get tableName => 'sales_order_items';

  TextColumn get orderUuid => text().named('order_uuid')();
  TextColumn get productUuid => text().named('product_uuid').nullable()();
  TextColumn get productNameSnapshot => text().named('product_name_snapshot')();
  TextColumn get productCodeSnapshot =>
      text().named('product_code_snapshot').nullable()();
  TextColumn get specificationSnapshot =>
      text().named('specification_snapshot').nullable()();
  RealColumn get quantityValue => real().named('quantity_value').nullable()();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  IntColumn get saleAmount =>
      integer().named('sale_amount').withDefault(const Constant(0))();
  IntColumn get costAmount =>
      integer().named('cost_amount').withDefault(const Constant(0))();
  TextColumn get itemStatus =>
      text().named('item_status').withDefault(const Constant('draft'))();
  TextColumn get supplierUuid => text().named('supplier_uuid').nullable()();
}
