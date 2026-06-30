import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class CustomFields extends Table with CoreTableColumns {
  @override
  String get tableName => 'custom_fields';

  TextColumn get entityType => text().named('entity_type')();
  TextColumn get fieldKey => text().named('field_key')();
  TextColumn get fieldLabel => text().named('field_label')();
  TextColumn get fieldType =>
      text().named('field_type').withDefault(const Constant('text'))();
  BoolColumn get isRequired =>
      boolean().named('is_required').withDefault(const Constant(false))();
  BoolColumn get isEnabled =>
      boolean().named('is_enabled').withDefault(const Constant(true))();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  TextColumn get optionsJson => text().named('options_json').nullable()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {entityType, fieldKey},
  ];
}

class CustomFieldValues extends Table with CoreTableColumns {
  @override
  String get tableName => 'custom_field_values';

  TextColumn get entityType => text().named('entity_type')();
  TextColumn get entityUuid => text().named('entity_uuid')();
  TextColumn get fieldUuid => text().named('field_uuid')();
  TextColumn get fieldKey => text().named('field_key')();
  TextColumn get fieldValue => text().named('field_value').nullable()();
}
