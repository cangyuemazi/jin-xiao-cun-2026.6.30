import 'package:drift/drift.dart';

import 'core_table_columns.dart';

class Products extends Table with CoreTableColumns {
  @override
  String get tableName => 'products';

  TextColumn get productName =>
      text().named('product_name').withLength(min: 1, max: 160)();
  TextColumn get productCode => text().named('product_code').nullable()();
  TextColumn get productType =>
      text().named('product_type').withDefault(const Constant('material'))();
  TextColumn get specification => text().nullable()();
  TextColumn get quantityUnit => text().named('quantity_unit').nullable()();
  TextColumn get materialCategory =>
      text().named('material_category').nullable()();
}

class ProductElements extends Table with CoreTableColumns {
  @override
  String get tableName => 'product_elements';

  TextColumn get productUuid => text().named('product_uuid')();
  TextColumn get elementSymbol => text().named('element_symbol').nullable()();
  TextColumn get elementName => text().named('element_name').nullable()();
  TextColumn get ratioText => text().named('ratio_text').nullable()();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
}
