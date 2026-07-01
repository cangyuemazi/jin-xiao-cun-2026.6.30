import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/products.dart';
import '_repository_base.dart';

class ProductRepository extends RepositoryBase<Products, Product> {
  ProductRepository(super.db);

  @override
  TableInfo<Products, Product> get table => db.products;

  @override
  GeneratedColumn<String> get uuidColumn => db.products.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.products.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.products.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.products.deletedAt;

  @override
  Insertable<Product> softDeleteCompanion(DateTime deletedAt) {
    return ProductsCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one product row. Product typing stays dictionary-driven.
  Future<int> create(ProductsCompanion product) {
    return createRow(product);
  }

  Future<bool> update(String uuid, ProductsCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<Product>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.products.productName,
        db.products.productCode,
        db.products.productType,
        db.products.specification,
        db.products.materialCategory,
        db.products.defaultSupplierUuid,
        db.products.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<ProductElement>> listElementsByProductUuid(
    String productUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.productElements)
      ..where((element) {
        final byProduct = element.productUuid.equals(productUuid);
        return includeDeleted
            ? byProduct
            : byProduct & element.deletedAt.isNull();
      })
      ..orderBy([(element) => OrderingTerm.asc(element.sortOrder)]);

    return query.get();
  }

  Future<int> createElement(ProductElementsCompanion element) {
    return db.into(db.productElements).insert(element);
  }

  Future<bool> updateElement(
    String uuid,
    ProductElementsCompanion changes,
  ) async {
    final affectedRows =
        await (db.update(db.productElements)..where(
              (element) =>
                  element.uuid.equals(uuid) & element.deletedAt.isNull(),
            ))
            .write(changes.copyWith(updatedAt: Value(DateTime.now())));

    return affectedRows > 0;
  }

  Future<bool> softDeleteElement(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.productElements)..where(
              (element) =>
                  element.uuid.equals(uuid) & element.deletedAt.isNull(),
            ))
            .write(
              ProductElementsCompanion(
                deletedAt: Value(now),
                updatedAt: Value(now),
              ),
            );

    return affectedRows > 0;
  }
}
