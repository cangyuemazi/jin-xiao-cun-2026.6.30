import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jin_xiao_cun_2026/data/database/app_database.dart';

void main() {
  test('AppDatabase initializes with schema version 1', () async {
    final database = AppDatabase.forExecutor(NativeDatabase.memory());
    addTearDown(database.close);

    expect(database.schemaVersion, 1);

    final migrations = await database
        .select(database.schemaMigrationEntries)
        .get();
    expect(migrations, hasLength(1));
    expect(migrations.single.version, 1);
  });
}
