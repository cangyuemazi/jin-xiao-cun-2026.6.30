import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Attachments extends Table with CoreTableColumns {
  @override
  String get tableName => 'attachments';

  TextColumn get relatedType => text().named('related_type')();
  TextColumn get relatedUuid => text().named('related_uuid')();
  TextColumn get fileName => text().named('file_name')();
  TextColumn get filePath => text().named('file_path')();
  TextColumn get fileType => text().named('file_type').nullable()();
  IntColumn get fileSize => integer().named('file_size').nullable()();
  DateTimeColumn get attachedAt =>
      dateTime().named('attached_at').withDefault(currentDateAndTime)();
}
