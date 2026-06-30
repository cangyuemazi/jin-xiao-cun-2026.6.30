import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/sales_orders.dart';
import '_repository_base.dart';

class OrderRepository extends RepositoryBase<SalesOrders, SalesOrder> {
  OrderRepository(super.db);

  @override
  TableInfo<SalesOrders, SalesOrder> get table => db.salesOrders;

  @override
  GeneratedColumn<String> get uuidColumn => db.salesOrders.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.salesOrders.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.salesOrders.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.salesOrders.deletedAt;

  @override
  Insertable<SalesOrder> softDeleteCompanion(DateTime deletedAt) {
    return SalesOrdersCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one sales order row. Business defaults belong in services.
  Future<int> create(SalesOrdersCompanion order) {
    return createRow(order);
  }

  Future<bool> update(String uuid, SalesOrdersCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<SalesOrder>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.salesOrders.orderNo,
        db.salesOrders.customerUuid,
        db.salesOrders.orderStatus,
        db.salesOrders.paymentStatus,
        db.salesOrders.invoiceStatus,
        db.salesOrders.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<SalesOrderItem>> listItemsByOrderUuid(
    String orderUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.salesOrderItems)
      ..where((item) {
        final byOrder = item.orderUuid.equals(orderUuid);
        return includeDeleted ? byOrder : byOrder & item.deletedAt.isNull();
      })
      ..orderBy([(item) => OrderingTerm.desc(item.createdAt)]);

    return query.get();
  }

  Future<SalesOrderItem?> getItemByUuid(
    String uuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.salesOrderItems)
      ..where((item) {
        final byUuid = item.uuid.equals(uuid);
        return includeDeleted ? byUuid : byUuid & item.deletedAt.isNull();
      });

    return query.getSingleOrNull();
  }

  Future<int> createItem(SalesOrderItemsCompanion item) {
    return db.into(db.salesOrderItems).insert(item);
  }

  Future<bool> updateItem(String uuid, SalesOrderItemsCompanion changes) async {
    final affectedRows =
        await (db.update(db.salesOrderItems)..where(
              (item) => item.uuid.equals(uuid) & item.deletedAt.isNull(),
            ))
            .write(changes.copyWith(updatedAt: Value(DateTime.now())));

    return affectedRows > 0;
  }

  Future<bool> softDeleteItem(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.salesOrderItems)..where(
              (item) => item.uuid.equals(uuid) & item.deletedAt.isNull(),
            ))
            .write(
              SalesOrderItemsCompanion(
                deletedAt: Value(now),
                updatedAt: Value(now),
              ),
            );

    return affectedRows > 0;
  }
}
