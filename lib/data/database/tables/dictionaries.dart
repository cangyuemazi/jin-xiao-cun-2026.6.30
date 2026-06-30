import 'package:drift/drift.dart';

class Dictionaries extends Table {
  @override
  String get tableName => 'dictionaries';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().withLength(min: 1, max: 64).unique()();
  TextColumn get category => text().withLength(min: 1, max: 64)();
  TextColumn get code => text().withLength(min: 1, max: 96)();
  TextColumn get label => text().withLength(min: 1, max: 128)();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  BoolColumn get isActive =>
      boolean().named('is_active').withDefault(const Constant(true))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();
  TextColumn get syncStatus =>
      text().named('sync_status').withDefault(const Constant('local'))();
  TextColumn get deviceId => text().named('device_id').nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  TextColumn get remark => text().nullable()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {category, code},
  ];
}
