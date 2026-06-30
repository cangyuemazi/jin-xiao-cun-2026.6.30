import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/dictionaries.dart';
import '_repository_base.dart';

class DictionaryRepository extends RepositoryBase<Dictionaries, Dictionary> {
  DictionaryRepository(super.db);

  @override
  TableInfo<Dictionaries, Dictionary> get table => db.dictionaries;

  @override
  GeneratedColumn<String> get uuidColumn => db.dictionaries.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.dictionaries.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.dictionaries.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.dictionaries.deletedAt;

  @override
  Insertable<Dictionary> softDeleteCompanion(DateTime deletedAt) {
    return DictionariesCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one dictionary row for statuses, types, and categories.
  Future<int> create(DictionariesCompanion dictionary) {
    return createRow(dictionary);
  }

  Future<bool> update(String uuid, DictionariesCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<Dictionary>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.dictionaries.dictType,
        db.dictionaries.dictKey,
        db.dictionaries.dictLabel,
        db.dictionaries.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<Dictionary>> listByType(
    String dictType, {
    bool enabledOnly = true,
    bool includeDeleted = false,
  }) {
    final query = db.select(db.dictionaries)
      ..where((dictionary) {
        var filter = dictionary.dictType.equals(dictType);

        if (enabledOnly) {
          filter = filter & dictionary.isEnabled.equals(true);
        }

        if (!includeDeleted) {
          filter = filter & dictionary.deletedAt.isNull();
        }

        return filter;
      })
      ..orderBy([
        (dictionary) => OrderingTerm.asc(dictionary.sortOrder),
        (dictionary) => OrderingTerm.asc(dictionary.dictLabel),
      ]);

    return query.get();
  }

  Future<Dictionary?> getByTypeAndKey(
    String dictType,
    String dictKey, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.dictionaries)
      ..where((dictionary) {
        final byTypeAndKey =
            dictionary.dictType.equals(dictType) &
            dictionary.dictKey.equals(dictKey);
        return includeDeleted
            ? byTypeAndKey
            : byTypeAndKey & dictionary.deletedAt.isNull();
      });

    return query.getSingleOrNull();
  }
}
