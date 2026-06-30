import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/audit_logs.dart';
import '_repository_base.dart';

class AuditLogRepository extends RepositoryBase<AuditLogs, AuditLog> {
  AuditLogRepository(super.db);

  @override
  TableInfo<AuditLogs, AuditLog> get table => db.auditLogs;

  @override
  GeneratedColumn<String> get uuidColumn => db.auditLogs.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.auditLogs.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.auditLogs.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.auditLogs.deletedAt;

  @override
  Insertable<AuditLog> softDeleteCompanion(DateTime deletedAt) {
    return AuditLogsCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Appends one audit log row. The caller decides which operation to log.
  Future<int> create(AuditLogsCompanion auditLog) {
    return createRow(auditLog);
  }

  Future<bool> update(String uuid, AuditLogsCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<AuditLog>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.auditLogs.entityType,
        db.auditLogs.entityUuid,
        db.auditLogs.actionType,
        db.auditLogs.operatorName,
        db.auditLogs.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<AuditLog>> listByEntity(
    String entityUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.auditLogs)
      ..where((log) {
        final byEntity = log.entityUuid.equals(entityUuid);
        return includeDeleted ? byEntity : byEntity & log.deletedAt.isNull();
      })
      ..orderBy([(log) => OrderingTerm.desc(log.operatedAt)]);

    return query.get();
  }
}
