import 'package:drift/drift.dart';

mixin CoreTableColumns on Table {
  late final id = integer().autoIncrement()();
  late final uuid = text().withLength(min: 1, max: 64).unique()();
  late final createdAt = dateTime()
      .named('created_at')
      .withDefault(currentDateAndTime)();
  late final updatedAt = dateTime()
      .named('updated_at')
      .withDefault(currentDateAndTime)();
  late final deletedAt = dateTime().named('deleted_at').nullable()();
  late final syncStatus = text()
      .named('sync_status')
      .withLength(min: 1, max: 32)
      .withDefault(const Constant('local'))();
  late final deviceId = text().named('device_id').nullable()();
  late final version = integer().withDefault(const Constant(1))();
  late final remark = text().nullable()();
}
