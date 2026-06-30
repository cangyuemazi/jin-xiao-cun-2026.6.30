import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Suppliers extends Table with CoreTableColumns {
  @override
  String get tableName => 'suppliers';

  TextColumn get supplierName =>
      text().named('supplier_name').withLength(min: 1, max: 160)();
  TextColumn get supplierType =>
      text().named('supplier_type').withDefault(const Constant('default'))();
  TextColumn get contactName => text().named('contact_name').nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
}
