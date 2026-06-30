import 'package:drift/drift.dart';

class SchemaMigrationEntries extends Table {
  @override
  String get tableName => 'schema_migrations';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get version => integer()();
  TextColumn get description => text().withDefault(const Constant(''))();
  DateTimeColumn get appliedAt => dateTime().named('applied_at')();
}
