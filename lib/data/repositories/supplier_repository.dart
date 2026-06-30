import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/suppliers.dart';
import '_repository_base.dart';

class SupplierRepository extends RepositoryBase<Suppliers, Supplier> {
  SupplierRepository(super.db);

  @override
  TableInfo<Suppliers, Supplier> get table => db.suppliers;

  @override
  GeneratedColumn<String> get uuidColumn => db.suppliers.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.suppliers.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.suppliers.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.suppliers.deletedAt;

  @override
  Insertable<Supplier> softDeleteCompanion(DateTime deletedAt) {
    return SuppliersCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one supplier row. Supplier categorization belongs to dictionaries.
  Future<int> create(SuppliersCompanion supplier) {
    return createRow(supplier);
  }

  Future<bool> update(String uuid, SuppliersCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<Supplier>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.suppliers.supplierName,
        db.suppliers.supplierType,
        db.suppliers.contactName,
        db.suppliers.phone,
        db.suppliers.email,
        db.suppliers.address,
        db.suppliers.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }
}
