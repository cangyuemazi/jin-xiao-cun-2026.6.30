import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/app_database.dart';
import '../data/repositories/audit_log_repository.dart';
import '../data/repositories/customer_repository.dart';
import '../data/repositories/dictionary_repository.dart';
import '../data/repositories/finance_repository.dart';
import '../data/repositories/inventory_repository.dart';
import '../data/repositories/order_repository.dart';
import '../data/repositories/product_repository.dart';
import '../data/repositories/shipment_repository.dart';
import '../data/repositories/supplier_repository.dart';
import '../domain/services/audit_log_service.dart';
import '../domain/services/backup_service.dart';
import '../domain/services/customer_service.dart';
import '../domain/services/dictionary_service.dart';
import '../domain/services/export_service.dart';
import '../domain/services/finance_service.dart';
import '../domain/services/import_service.dart';
import '../domain/services/inventory_service.dart';
import '../domain/services/order_service.dart';
import '../domain/services/product_service.dart';
import '../domain/services/shipment_service.dart';
import '../domain/services/supplier_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepository(ref.watch(appDatabaseProvider));
});

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepository(ref.watch(appDatabaseProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ref.watch(appDatabaseProvider));
});

final supplierRepositoryProvider = Provider<SupplierRepository>((ref) {
  return SupplierRepository(ref.watch(appDatabaseProvider));
});

final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
  return ShipmentRepository(ref.watch(appDatabaseProvider));
});

final financeRepositoryProvider = Provider<FinanceRepository>((ref) {
  return FinanceRepository(ref.watch(appDatabaseProvider));
});

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepository(ref.watch(appDatabaseProvider));
});

final dictionaryRepositoryProvider = Provider<DictionaryRepository>((ref) {
  return DictionaryRepository(ref.watch(appDatabaseProvider));
});

final auditLogRepositoryProvider = Provider<AuditLogRepository>((ref) {
  return AuditLogRepository(ref.watch(appDatabaseProvider));
});

final auditLogServiceProvider = Provider<AuditLogService>((ref) {
  return AuditLogService(
    auditLogRepository: ref.watch(auditLogRepositoryProvider),
  );
});

final financeServiceProvider = Provider<FinanceService>((ref) {
  return FinanceService(
    orderRepository: ref.watch(orderRepositoryProvider),
    financeRepository: ref.watch(financeRepositoryProvider),
  );
});

final shipmentServiceProvider = Provider<ShipmentService>((ref) {
  return ShipmentService(
    shipmentRepository: ref.watch(shipmentRepositoryProvider),
    orderRepository: ref.watch(orderRepositoryProvider),
    auditLogService: ref.watch(auditLogServiceProvider),
  );
});

final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderService(
    orderRepository: ref.watch(orderRepositoryProvider),
    customerRepository: ref.watch(customerRepositoryProvider),
    supplierRepository: ref.watch(supplierRepositoryProvider),
    shipmentRepository: ref.watch(shipmentRepositoryProvider),
    financeService: ref.watch(financeServiceProvider),
    shipmentService: ref.watch(shipmentServiceProvider),
    auditLogService: ref.watch(auditLogServiceProvider),
  );
});

final customerServiceProvider = Provider<CustomerService>((ref) {
  return CustomerService(
    customerRepository: ref.watch(customerRepositoryProvider),
    auditLogService: ref.watch(auditLogServiceProvider),
  );
});

final inventoryServiceProvider = Provider<InventoryService>((ref) {
  return InventoryService(
    inventoryRepository: ref.watch(inventoryRepositoryProvider),
  );
});

final dictionaryServiceProvider = Provider<DictionaryService>((ref) {
  return DictionaryService(
    dictionaryRepository: ref.watch(dictionaryRepositoryProvider),
  );
});

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService(
    productRepository: ref.watch(productRepositoryProvider),
    dictionaryService: ref.watch(dictionaryServiceProvider),
    auditLogService: ref.watch(auditLogServiceProvider),
  );
});

final supplierServiceProvider = Provider<SupplierService>((ref) {
  return SupplierService(
    supplierRepository: ref.watch(supplierRepositoryProvider),
    dictionaryService: ref.watch(dictionaryServiceProvider),
    auditLogService: ref.watch(auditLogServiceProvider),
  );
});

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(auditLogService: ref.watch(auditLogServiceProvider));
});

final importServiceProvider = Provider<ImportService>((ref) {
  return ImportService();
});

final exportServiceProvider = Provider<ExportService>((ref) {
  return ExportService(auditLogService: ref.watch(auditLogServiceProvider));
});
