import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/shipments.dart';
import '_repository_base.dart';

class ShipmentRepository extends RepositoryBase<Shipments, Shipment> {
  ShipmentRepository(super.db);

  @override
  TableInfo<Shipments, Shipment> get table => db.shipments;

  @override
  GeneratedColumn<String> get uuidColumn => db.shipments.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.shipments.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.shipments.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.shipments.deletedAt;

  @override
  Insertable<Shipment> softDeleteCompanion(DateTime deletedAt) {
    return ShipmentsCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one shipment row. Shipment completion is calculated in services.
  Future<int> create(ShipmentsCompanion shipment) {
    return createRow(shipment);
  }

  Future<bool> update(String uuid, ShipmentsCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<Shipment>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.shipments.shipmentNo,
        db.shipments.orderUuid,
        db.shipments.customerUuid,
        db.shipments.carrier,
        db.shipments.trackingNo,
        db.shipments.shipmentStatus,
        db.shipments.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<Shipment>> listByOrderUuid(
    String orderUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.shipments)
      ..where((shipment) {
        final byOrder = shipment.orderUuid.equals(orderUuid);
        return includeDeleted ? byOrder : byOrder & shipment.deletedAt.isNull();
      })
      ..orderBy([(shipment) => OrderingTerm.desc(shipment.createdAt)]);

    return query.get();
  }

  Future<List<ShipmentItem>> listItemsByShipmentUuid(
    String shipmentUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.shipmentItems)
      ..where((item) {
        final byShipment = item.shipmentUuid.equals(shipmentUuid);
        return includeDeleted
            ? byShipment
            : byShipment & item.deletedAt.isNull();
      })
      ..orderBy([(item) => OrderingTerm.desc(item.createdAt)]);

    return query.get();
  }

  Future<List<ShipmentItem>> listItemsByOrderUuid(
    String orderUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.shipmentItems)
      ..where((item) {
        final byOrder = item.orderUuid.equals(orderUuid);
        return includeDeleted ? byOrder : byOrder & item.deletedAt.isNull();
      })
      ..orderBy([(item) => OrderingTerm.desc(item.createdAt)]);

    return query.get();
  }

  Future<int> createItem(ShipmentItemsCompanion item) {
    return db.into(db.shipmentItems).insert(item);
  }

  Future<bool> updateItem(String uuid, ShipmentItemsCompanion changes) async {
    final affectedRows =
        await (db.update(db.shipmentItems)..where(
              (item) => item.uuid.equals(uuid) & item.deletedAt.isNull(),
            ))
            .write(changes.copyWith(updatedAt: Value(DateTime.now())));

    return affectedRows > 0;
  }

  Future<bool> softDeleteItem(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.shipmentItems)..where(
              (item) => item.uuid.equals(uuid) & item.deletedAt.isNull(),
            ))
            .write(
              ShipmentItemsCompanion(
                deletedAt: Value(now),
                updatedAt: Value(now),
              ),
            );

    return affectedRows > 0;
  }
}
