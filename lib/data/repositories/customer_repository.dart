import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/customers.dart';
import '_repository_base.dart';

class CustomerRepository extends RepositoryBase<Customers, Customer> {
  CustomerRepository(super.db);

  @override
  TableInfo<Customers, Customer> get table => db.customers;

  @override
  GeneratedColumn<String> get uuidColumn => db.customers.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.customers.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.customers.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.customers.deletedAt;

  @override
  Insertable<Customer> softDeleteCompanion(DateTime deletedAt) {
    return CustomersCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one customer row. Validation is handled by services.
  Future<int> create(CustomersCompanion customer) {
    return createRow(customer);
  }

  Future<bool> update(String uuid, CustomersCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<Customer>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.customers.customerName,
        db.customers.companyName,
        db.customers.contactName,
        db.customers.phone,
        db.customers.email,
        db.customers.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<CustomerAddressesData>> listAddressesByCustomerUuid(
    String customerUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.customerAddresses)
      ..where((address) {
        final byCustomer = address.customerUuid.equals(customerUuid);
        return includeDeleted
            ? byCustomer
            : byCustomer & address.deletedAt.isNull();
      })
      ..orderBy([(address) => OrderingTerm.desc(address.createdAt)]);

    return query.get();
  }

  Future<int> createAddress(CustomerAddressesCompanion address) {
    return db.into(db.customerAddresses).insert(address);
  }

  Future<bool> updateAddress(
    String uuid,
    CustomerAddressesCompanion changes,
  ) async {
    final affectedRows =
        await (db.update(db.customerAddresses)..where(
              (address) =>
                  address.uuid.equals(uuid) & address.deletedAt.isNull(),
            ))
            .write(changes.copyWith(updatedAt: Value(DateTime.now())));

    return affectedRows > 0;
  }

  Future<bool> softDeleteAddress(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.customerAddresses)..where(
              (address) =>
                  address.uuid.equals(uuid) & address.deletedAt.isNull(),
            ))
            .write(
              CustomerAddressesCompanion(
                deletedAt: Value(now),
                updatedAt: Value(now),
              ),
            );

    return affectedRows > 0;
  }
}
