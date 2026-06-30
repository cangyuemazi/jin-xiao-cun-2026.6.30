import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Dictionaries extends Table with CoreTableColumns {
  @override
  String get tableName => 'dictionaries';

  TextColumn get dictType =>
      text().named('dict_type').withLength(min: 1, max: 64)();
  TextColumn get dictKey =>
      text().named('dict_key').withLength(min: 1, max: 96)();
  TextColumn get dictLabel =>
      text().named('dict_label').withLength(min: 1, max: 128)();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  BoolColumn get isEnabled =>
      boolean().named('is_enabled').withDefault(const Constant(true))();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {dictType, dictKey},
  ];
}
