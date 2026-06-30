import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/inventory.dart';
import '_repository_base.dart';

class InventoryRepository
    extends RepositoryBase<InventoryItems, InventoryItem> {
  InventoryRepository(super.db);

  @override
  TableInfo<InventoryItems, InventoryItem> get table => db.inventoryItems;

  @override
  GeneratedColumn<String> get uuidColumn => db.inventoryItems.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.inventoryItems.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.inventoryItems.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.inventoryItems.deletedAt;

  @override
  Insertable<InventoryItem> softDeleteCompanion(DateTime deletedAt) {
    return InventoryItemsCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one inventory row. Quantity deduction is handled in services.
  Future<int> create(InventoryItemsCompanion item) {
    return createRow(item);
  }

  Future<bool> update(String uuid, InventoryItemsCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<InventoryItem>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.inventoryItems.productUuid,
        db.inventoryItems.productNameSnapshot,
        db.inventoryItems.productCodeSnapshot,
        db.inventoryItems.specificationSnapshot,
        db.inventoryItems.warehouseName,
        db.inventoryItems.inventoryStatus,
        db.inventoryItems.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<int> createLog(InventoryLogsCompanion log) {
    return db.into(db.inventoryLogs).insert(log);
  }

  Future<List<InventoryLog>> listLogsByInventoryItemUuid(
    String inventoryItemUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.inventoryLogs)
      ..where((log) {
        final byInventory = log.inventoryItemUuid.equals(inventoryItemUuid);
        return includeDeleted
            ? byInventory
            : byInventory & log.deletedAt.isNull();
      })
      ..orderBy([(log) => OrderingTerm.desc(log.operatedAt)]);

    return query.get();
  }

  Future<bool> softDeleteLog(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.inventoryLogs)
              ..where((log) => log.uuid.equals(uuid) & log.deletedAt.isNull()))
            .write(
              InventoryLogsCompanion(
                deletedAt: Value(now),
                updatedAt: Value(now),
              ),
            );

    return affectedRows > 0;
  }
}
