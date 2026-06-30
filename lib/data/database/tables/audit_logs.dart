import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class AuditLogs extends Table with CoreTableColumns {
  @override
  String get tableName => 'audit_logs';

  TextColumn get entityType => text().named('entity_type')();
  TextColumn get entityUuid => text().named('entity_uuid')();
  TextColumn get actionType => text().named('action_type')();
  TextColumn get oldValue => text().named('old_value').nullable()();
  TextColumn get newValue => text().named('new_value').nullable()();
  TextColumn get operatorName => text().named('operator_name').nullable()();
  DateTimeColumn get operatedAt =>
      dateTime().named('operated_at').withDefault(currentDateAndTime)();
}
