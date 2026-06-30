import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class ExpenseItems extends Table with CoreTableColumns {
  @override
  String get tableName => 'expense_items';

  TextColumn get relatedType => text().named('related_type')();
  TextColumn get relatedUuid => text().named('related_uuid')();
  TextColumn get expenseType => text().named('expense_type')();
  IntColumn get amount => integer()();
  DateTimeColumn get expenseDate =>
      dateTime().named('expense_date').nullable()();
  TextColumn get orderUuid => text().named('order_uuid').nullable()();
  TextColumn get supplierUuid => text().named('supplier_uuid').nullable()();
}

class Payments extends Table with CoreTableColumns {
  @override
  String get tableName => 'payments';

  TextColumn get relatedType => text().named('related_type')();
  TextColumn get relatedUuid => text().named('related_uuid')();
  TextColumn get paymentType =>
      text().named('payment_type').withDefault(const Constant('unknown'))();
  IntColumn get amount => integer()();
  DateTimeColumn get paymentDate =>
      dateTime().named('payment_date').nullable()();
  TextColumn get paymentStatus =>
      text().named('payment_status').withDefault(const Constant('pending'))();
  TextColumn get accountName => text().named('account_name').nullable()();
}
