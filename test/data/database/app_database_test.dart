import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jin_xiao_cun_2026/data/database/app_database.dart';

void main() {
  test('AppDatabase initializes with core schema version 2', () async {
    final database = AppDatabase.forExecutor(NativeDatabase.memory());
    addTearDown(database.close);

    expect(database.schemaVersion, 2);

    final migrations = await database
        .select(database.schemaMigrationEntries)
        .get();
    expect(migrations, hasLength(1));
    expect(migrations.single.version, 2);

    final tableNames = await database
        .customSelect(
          "SELECT name FROM sqlite_master WHERE type = 'table'",
          readsFrom: const {},
        )
        .get();
    final names = tableNames.map((row) => row.read<String>('name')).toSet();

    expect(
      names,
      containsAll({
        'customers',
        'customer_addresses',
        'products',
        'product_elements',
        'suppliers',
        'sales_orders',
        'sales_order_items',
        'purchase_orders',
        'purchase_order_items',
        'shipments',
        'shipment_items',
        'inventory_items',
        'inventory_logs',
        'expense_items',
        'payments',
        'attachments',
        'audit_logs',
        'dictionaries',
        'custom_fields',
        'custom_field_values',
        'schema_migrations',
      }),
    );

    final salesOrderColumns = await database
        .customSelect("PRAGMA table_info('sales_orders')")
        .get();
    final salesOrderColumnTypes = {
      for (final row in salesOrderColumns)
        row.read<String>('name'): row.read<String>('type'),
    };

    expect(salesOrderColumnTypes['total_sale_amount'], 'INTEGER');
    expect(salesOrderColumnTypes, contains('deleted_at'));
    expect(salesOrderColumnTypes, contains('sync_status'));
    expect(salesOrderColumnTypes, contains('device_id'));
    expect(salesOrderColumnTypes, contains('version'));
  });
}
