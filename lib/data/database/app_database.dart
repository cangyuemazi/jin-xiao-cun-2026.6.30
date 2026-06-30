import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'database_paths.dart';
import 'tables/dictionaries.dart';
import 'tables/schema_migration_entries.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Dictionaries, SchemaMigrationEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forExecutor(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) async {
        await migrator.createAll();
      },
      onUpgrade: (migrator, from, to) async {
        await _runMigrations(migrator, from, to);
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        if (details.wasCreated) {
          await _recordSchemaMigration(
            version: schemaVersion,
            description: 'Initial schema',
          );
        }
      },
    );
  }

  Future<void> _runMigrations(Migrator migrator, int from, int to) async {
    // Future schema changes must be added here and kept incremental.
    await _recordSchemaMigration(
      version: to,
      description: 'Upgrade schema from $from to $to',
    );
  }

  Future<void> _recordSchemaMigration({
    required int version,
    required String description,
  }) {
    return into(schemaMigrationEntries).insert(
      SchemaMigrationEntriesCompanion.insert(
        version: version,
        description: Value(description),
        appliedAt: DateTime.now(),
      ),
    );
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    AppDatabasePaths.ensureRuntimeDirectories();
    return NativeDatabase.createInBackground(AppDatabasePaths.databaseFile);
  });
}
