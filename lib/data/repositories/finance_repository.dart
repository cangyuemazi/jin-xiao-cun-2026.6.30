import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/finance.dart';
import '_repository_base.dart';

class FinanceRepository extends RepositoryBase<ExpenseItems, ExpenseItem> {
  FinanceRepository(super.db);

  @override
  TableInfo<ExpenseItems, ExpenseItem> get table => db.expenseItems;

  @override
  GeneratedColumn<String> get uuidColumn => db.expenseItems.uuid;

  @override
  GeneratedColumn<DateTime> get createdAtColumn => db.expenseItems.createdAt;

  @override
  GeneratedColumn<DateTime> get updatedAtColumn => db.expenseItems.updatedAt;

  @override
  GeneratedColumn<DateTime> get deletedAtColumn => db.expenseItems.deletedAt;

  @override
  Insertable<ExpenseItem> softDeleteCompanion(DateTime deletedAt) {
    return ExpenseItemsCompanion(
      deletedAt: Value(deletedAt),
      updatedAt: Value(deletedAt),
    );
  }

  /// Creates one expense row. Profit calculations stay in services.
  Future<int> create(ExpenseItemsCompanion expense) {
    return createRow(expense);
  }

  Future<bool> update(String uuid, ExpenseItemsCompanion changes) {
    return writeByUuid(
      uuid,
      changes.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<bool> softDelete(String uuid) {
    return softDeleteByUuid(uuid);
  }

  Future<List<ExpenseItem>> search(
    String keyword, {
    int limit = 50,
    int offset = 0,
    bool includeDeleted = false,
  }) {
    return searchByTextColumns(
      keyword,
      [
        db.expenseItems.relatedType,
        db.expenseItems.relatedUuid,
        db.expenseItems.expenseType,
        db.expenseItems.orderUuid,
        db.expenseItems.supplierUuid,
        db.expenseItems.remark,
      ],
      limit: limit,
      offset: offset,
      includeDeleted: includeDeleted,
    );
  }

  Future<List<ExpenseItem>> listExpensesByRelatedUuid(
    String relatedUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.expenseItems)
      ..where((expense) {
        final byRelated = expense.relatedUuid.equals(relatedUuid);
        return includeDeleted
            ? byRelated
            : byRelated & expense.deletedAt.isNull();
      })
      ..orderBy([(expense) => OrderingTerm.desc(expense.createdAt)]);

    return query.get();
  }

  Future<int> createPayment(PaymentsCompanion payment) {
    return db.into(db.payments).insert(payment);
  }

  Future<List<Payment>> listPaymentsByRelatedUuid(
    String relatedUuid, {
    bool includeDeleted = false,
  }) {
    final query = db.select(db.payments)
      ..where((payment) {
        final byRelated = payment.relatedUuid.equals(relatedUuid);
        return includeDeleted
            ? byRelated
            : byRelated & payment.deletedAt.isNull();
      })
      ..orderBy([(payment) => OrderingTerm.desc(payment.createdAt)]);

    return query.get();
  }

  Future<bool> updatePayment(String uuid, PaymentsCompanion changes) async {
    final affectedRows =
        await (db.update(db.payments)..where(
              (payment) =>
                  payment.uuid.equals(uuid) & payment.deletedAt.isNull(),
            ))
            .write(changes.copyWith(updatedAt: Value(DateTime.now())));

    return affectedRows > 0;
  }

  Future<bool> softDeletePayment(String uuid) async {
    final now = DateTime.now();
    final affectedRows =
        await (db.update(db.payments)..where(
              (payment) =>
                  payment.uuid.equals(uuid) & payment.deletedAt.isNull(),
            ))
            .write(
              PaymentsCompanion(deletedAt: Value(now), updatedAt: Value(now)),
            );

    return affectedRows > 0;
  }
}
