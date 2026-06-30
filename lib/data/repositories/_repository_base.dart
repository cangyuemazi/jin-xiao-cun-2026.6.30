import 'package:drift/drift.dart';

import '../database/app_database.dart';

abstract class RepositoryBase<T extends Table, D> {
  RepositoryBase(this.db);

  final AppDatabase db;

  TableInfo<T, D> get table;
  GeneratedColumn<String> get uuidColumn;
  GeneratedColumn<DateTime> get createdAtColumn;
  GeneratedColumn<DateTime> get updatedAtColumn;
  GeneratedColumn<DateTime> get deletedAtColumn;

  Insertable<D> softDeleteCompanion(DateTime deletedAt);

  /// Lists records, excluding soft-deleted rows by default.
  Future<List<D>> list({
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    final query = db.select(table);

    if (!includeDeleted) {
      query.where((_) => deletedAtColumn.isNull());
    }

    query
      ..orderBy([(table) => OrderingTerm.desc(createdAtColumn)])
      ..limit(limit, offset: offset);

    return query.get();
  }

  /// Finds one record by business uuid, not by local auto-increment id.
  Future<D?> getByUuid(String uuid, {bool includeDeleted = false}) {
    final query = db.select(table)
      ..where((_) {
        final byUuid = uuidColumn.equals(uuid);
        return includeDeleted ? byUuid : byUuid & deletedAtColumn.isNull();
      });

    return query.getSingleOrNull();
  }

  Future<int> createRow(Insertable<D> row) {
    return db.into(table).insert(row);
  }

  /// Writes a partial update by uuid and ignores already deleted records.
  Future<bool> writeByUuid(String uuid, Insertable<D> changes) async {
    final affectedRows =
        await (db.update(
              table,
            )..where((_) => uuidColumn.equals(uuid) & deletedAtColumn.isNull()))
            .write(changes);

    return affectedRows > 0;
  }

  /// Marks a record as deleted without physically removing it.
  Future<bool> softDeleteByUuid(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(
              table,
            )..where((_) => uuidColumn.equals(uuid) & deletedAtColumn.isNull()))
            .write(softDeleteCompanion(now));

    return affectedRows > 0;
  }

  /// Searches text columns while keeping soft-deleted rows hidden by default.
  Future<List<D>> searchByTextColumns(
    String keyword,
    List<GeneratedColumn<String>> columns, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    final trimmed = keyword.trim();
    final query = db.select(table)
      ..where((_) {
        final visible = includeDeleted
            ? const Constant(true)
            : deletedAtColumn.isNull();

        if (trimmed.isEmpty || columns.isEmpty) {
          return visible;
        }

        final pattern = '%$trimmed%';
        final textFilter = columns
            .map((column) => column.like(pattern))
            .reduce((value, element) => value | element);

        return visible & textFilter;
      });

    query
      ..orderBy([(table) => OrderingTerm.desc(updatedAtColumn)])
      ..limit(limit, offset: offset);

    return query.get();
  }
}
