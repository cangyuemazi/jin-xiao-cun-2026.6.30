import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Shipments extends Table with CoreTableColumns {
  @override
  String get tableName => 'shipments';

  TextColumn get shipmentNo =>
      text().named('shipment_no').withLength(min: 1, max: 96).unique()();
  TextColumn get orderUuid => text().named('order_uuid').nullable()();
  TextColumn get customerUuid => text().named('customer_uuid').nullable()();
  TextColumn get addressUuid => text().named('address_uuid').nullable()();
  TextColumn get carrier => text().nullable()();
  TextColumn get trackingNo => text().named('tracking_no').nullable()();
  DateTimeColumn get shipDate => dateTime().named('ship_date').nullable()();
  IntColumn get shippingFee =>
      integer().named('shipping_fee').withDefault(const Constant(0))();
  TextColumn get shipmentStatus =>
      text().named('shipment_status').withDefault(const Constant('draft'))();
}

class ShipmentItems extends Table with CoreTableColumns {
  @override
  String get tableName => 'shipment_items';

  TextColumn get shipmentUuid => text().named('shipment_uuid')();
  TextColumn get orderUuid => text().named('order_uuid').nullable()();
  TextColumn get orderItemUuid => text().named('order_item_uuid')();
  TextColumn get productUuid => text().named('product_uuid').nullable()();
  RealColumn get quantityValue => real().named('quantity_value').nullable()();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  TextColumn get itemStatus =>
      text().named('item_status').withDefault(const Constant('draft'))();
}
