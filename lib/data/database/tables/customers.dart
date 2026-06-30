import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Customers extends Table with CoreTableColumns {
  @override
  String get tableName => 'customers';

  TextColumn get customerName =>
      text().named('customer_name').withLength(min: 1, max: 128)();
  TextColumn get companyName => text().named('company_name').nullable()();
  TextColumn get contactName => text().named('contact_name').nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get customerType =>
      text().named('customer_type').withDefault(const Constant('default'))();
  TextColumn get taxNo => text().named('tax_no').nullable()();
}

class CustomerAddresses extends Table with CoreTableColumns {
  @override
  String get tableName => 'customer_addresses';

  TextColumn get customerUuid => text().named('customer_uuid')();
  TextColumn get recipientName => text().named('recipient_name').nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get province => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get district => text().nullable()();
  TextColumn get detailAddress => text().named('detail_address').nullable()();
  TextColumn get fullAddress => text().named('full_address').nullable()();
  BoolColumn get isDefault =>
      boolean().named('is_default').withDefault(const Constant(false))();
}
