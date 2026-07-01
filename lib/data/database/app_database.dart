import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'database_paths.dart';
import 'tables/attachments.dart';
import 'tables/audit_logs.dart';
import 'tables/custom_fields.dart';
import 'tables/customers.dart';
import 'tables/dictionaries.dart';
import 'tables/finance.dart';
import 'tables/inventory.dart';
import 'tables/products.dart';
import 'tables/purchase_orders.dart';
import 'tables/sales_orders.dart';
import 'tables/schema_migration_entries.dart';
import 'tables/shipments.dart';
import 'tables/suppliers.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Customers,
    CustomerAddresses,
    Products,
    ProductElements,
    Suppliers,
    SalesOrders,
    SalesOrderItems,
    PurchaseOrders,
    PurchaseOrderItems,
    Shipments,
    ShipmentItems,
    InventoryItems,
    InventoryLogs,
    ExpenseItems,
    Payments,
    Attachments,
    AuditLogs,
    Dictionaries,
    CustomFields,
    CustomFieldValues,
    SchemaMigrationEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forExecutor(super.executor);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) async {
        await migrator.createAll();
        await _createIndexes();
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
    if (from < 2) {
      await _upgradeFromV1ToV2(migrator);
    }

    if (from >= 2 && from < 3) {
      await _upgradeFromV2ToV3(migrator);
    }

    if (from >= 2 && from < 4) {
      await _upgradeFromV3ToV4(migrator);
    }

    await _createIndexes();

    await _recordSchemaMigration(
      version: to,
      description: 'Upgrade schema from $from to $to',
    );
  }

  Future<void> _upgradeFromV1ToV2(Migrator migrator) async {
    await customStatement('ALTER TABLE dictionaries RENAME TO dictionaries_v1');
    await migrator.createTable(dictionaries);
    await customStatement('''
      INSERT INTO dictionaries (
        id,
        uuid,
        dict_type,
        dict_key,
        dict_label,
        sort_order,
        is_enabled,
        created_at,
        updated_at,
        deleted_at,
        sync_status,
        device_id,
        version,
        remark
      )
      SELECT
        id,
        uuid,
        category,
        code,
        label,
        sort_order,
        is_active,
        created_at,
        updated_at,
        deleted_at,
        sync_status,
        device_id,
        version,
        remark
      FROM dictionaries_v1
    ''');
    await customStatement('DROP TABLE dictionaries_v1');

    await migrator.createTable(customers);
    await migrator.createTable(customerAddresses);
    await migrator.createTable(products);
    await migrator.createTable(productElements);
    await migrator.createTable(suppliers);
    await migrator.createTable(salesOrders);
    await migrator.createTable(salesOrderItems);
    await migrator.createTable(purchaseOrders);
    await migrator.createTable(purchaseOrderItems);
    await migrator.createTable(shipments);
    await migrator.createTable(shipmentItems);
    await migrator.createTable(inventoryItems);
    await migrator.createTable(inventoryLogs);
    await migrator.createTable(expenseItems);
    await migrator.createTable(payments);
    await migrator.createTable(attachments);
    await migrator.createTable(auditLogs);
    await migrator.createTable(customFields);
    await migrator.createTable(customFieldValues);
  }

  Future<void> _upgradeFromV2ToV3(Migrator migrator) async {
    await migrator.addColumn(customers, customers.department);
    await migrator.addColumn(customers, customers.wechat);
    await migrator.addColumn(
      customerAddresses,
      customerAddresses.recipientCompany,
    );
  }

  Future<void> _upgradeFromV3ToV4(Migrator migrator) async {
    await migrator.addColumn(products, products.defaultSupplierUuid);
    await migrator.addColumn(products, products.isCustomProduct);
    await migrator.addColumn(products, products.trackInventory);
  }

  Future<void> _createIndexes() async {
    for (final tableName in _coreTableNames) {
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_${tableName}_uuid ON $tableName(uuid)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_${tableName}_deleted_at '
        'ON $tableName(deleted_at)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_${tableName}_created_at '
        'ON $tableName(created_at)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_${tableName}_updated_at '
        'ON $tableName(updated_at)',
      );
    }

    for (final index in _domainIndexes) {
      await customStatement(index);
    }
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

const _coreTableNames = [
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
];

const _domainIndexes = [
  'CREATE INDEX IF NOT EXISTS idx_customer_addresses_customer_uuid '
      'ON customer_addresses(customer_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_product_elements_product_uuid '
      'ON product_elements(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_sales_orders_order_no '
      'ON sales_orders(order_no)',
  'CREATE INDEX IF NOT EXISTS idx_sales_orders_customer_uuid '
      'ON sales_orders(customer_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_sales_order_items_order_uuid '
      'ON sales_order_items(order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_sales_order_items_product_uuid '
      'ON sales_order_items(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_sales_order_items_supplier_uuid '
      'ON sales_order_items(supplier_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_purchase_orders_supplier_uuid '
      'ON purchase_orders(supplier_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_purchase_orders_related_order_uuid '
      'ON purchase_orders(related_order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_purchase_order_items_purchase_order_uuid '
      'ON purchase_order_items(purchase_order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_purchase_order_items_product_uuid '
      'ON purchase_order_items(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipments_order_uuid '
      'ON shipments(order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipments_customer_uuid '
      'ON shipments(customer_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipments_tracking_no '
      'ON shipments(tracking_no)',
  'CREATE INDEX IF NOT EXISTS idx_shipment_items_shipment_uuid '
      'ON shipment_items(shipment_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipment_items_order_uuid '
      'ON shipment_items(order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipment_items_order_item_uuid '
      'ON shipment_items(order_item_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_shipment_items_product_uuid '
      'ON shipment_items(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_inventory_items_product_uuid '
      'ON inventory_items(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_inventory_logs_inventory_item_uuid '
      'ON inventory_logs(inventory_item_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_inventory_logs_product_uuid '
      'ON inventory_logs(product_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_inventory_logs_related_uuid '
      'ON inventory_logs(related_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_expense_items_related_uuid '
      'ON expense_items(related_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_expense_items_order_uuid '
      'ON expense_items(order_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_expense_items_supplier_uuid '
      'ON expense_items(supplier_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_payments_related_uuid '
      'ON payments(related_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_attachments_related_uuid '
      'ON attachments(related_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_audit_logs_entity_uuid '
      'ON audit_logs(entity_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_dictionaries_type_key '
      'ON dictionaries(dict_type, dict_key)',
  'CREATE INDEX IF NOT EXISTS idx_custom_fields_entity_type '
      'ON custom_fields(entity_type)',
  'CREATE INDEX IF NOT EXISTS idx_custom_field_values_entity_uuid '
      'ON custom_field_values(entity_uuid)',
  'CREATE INDEX IF NOT EXISTS idx_custom_field_values_field_uuid '
      'ON custom_field_values(field_uuid)',
];
