import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class InventoryItems extends Table with CoreTableColumns {
  @override
  String get tableName => 'inventory_items';

  TextColumn get productUuid => text().named('product_uuid').nullable()();
  TextColumn get productNameSnapshot => text().named('product_name_snapshot')();
  TextColumn get productCodeSnapshot =>
      text().named('product_code_snapshot').nullable()();
  TextColumn get specificationSnapshot =>
      text().named('specification_snapshot').nullable()();
  RealColumn get quantityValue =>
      real().named('quantity_value').withDefault(const Constant(0))();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  TextColumn get warehouseName => text().named('warehouse_name').nullable()();
  TextColumn get inventoryStatus =>
      text().named('inventory_status').withDefault(const Constant('active'))();
}

class InventoryLogs extends Table with CoreTableColumns {
  @override
  String get tableName => 'inventory_logs';

  TextColumn get inventoryItemUuid =>
      text().named('inventory_item_uuid').nullable()();
  TextColumn get productUuid => text().named('product_uuid').nullable()();
  TextColumn get relatedType => text().named('related_type').nullable()();
  TextColumn get relatedUuid => text().named('related_uuid').nullable()();
  TextColumn get changeType => text().named('change_type')();
  RealColumn get quantityChangeValue => real().named('quantity_change_value')();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  RealColumn get beforeQuantityValue =>
      real().named('before_quantity_value').nullable()();
  RealColumn get afterQuantityValue =>
      real().named('after_quantity_value').nullable()();
  DateTimeColumn get operatedAt =>
      dateTime().named('operated_at').withDefault(currentDateAndTime)();
  TextColumn get operatorName => text().named('operator_name').nullable()();
}
