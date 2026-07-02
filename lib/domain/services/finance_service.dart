import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/finance_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'audit_log_service.dart';
import 'dictionary_service.dart';

class OrderAmountSummary {
  const OrderAmountSummary({
    required this.totalSaleAmount,
    required this.totalCostAmount,
    required this.totalProfitAmount,
  });

  final int totalSaleAmount;
  final int totalCostAmount;
  final int totalProfitAmount;
}

class ProfitRateResult {
  const ProfitRateResult({
    required this.totalSaleAmount,
    required this.totalProfitAmount,
    required this.rate,
    this.warning,
  });

  final int totalSaleAmount;
  final int totalProfitAmount;
  final double? rate;
  final String? warning;

  bool get canCalculate => rate != null;
}

class FinanceDictionaryOption {
  const FinanceDictionaryOption({required this.key, required this.label});

  final String key;
  final String label;
}

class FinanceOrderOption {
  const FinanceOrderOption({required this.orderUuid, required this.orderNo});

  final String orderUuid;
  final String orderNo;
}

class FinanceOrderTargetOption {
  const FinanceOrderTargetOption({
    required this.relatedType,
    required this.relatedUuid,
    required this.label,
    this.description,
    this.defaultExpenseType,
  });

  final String relatedType;
  final String relatedUuid;
  final String label;
  final String? description;
  final String? defaultExpenseType;
}

class FinanceOrderAmountAnalysis {
  const FinanceOrderAmountAnalysis({
    required this.totalSaleAmount,
    required this.totalCostAmount,
    required this.totalProfitAmount,
    required this.profitRate,
    this.warnings = const [],
  });

  final int totalSaleAmount;
  final int totalCostAmount;
  final int totalProfitAmount;
  final double? profitRate;
  final List<String> warnings;
}

class FinanceOrderContext {
  const FinanceOrderContext({
    required this.orderUuid,
    required this.orderNo,
    required this.amountAnalysis,
    this.targets = const [],
  });

  final String orderUuid;
  final String orderNo;
  final FinanceOrderAmountAnalysis amountAnalysis;
  final List<FinanceOrderTargetOption> targets;
}

class FinanceExpenseEntry {
  const FinanceExpenseEntry({
    required this.expense,
    required this.expenseTypeLabel,
    required this.relatedLabel,
  });

  final ExpenseItem expense;
  final String expenseTypeLabel;
  final String relatedLabel;
}

class CreateExpenseInput {
  const CreateExpenseInput({
    this.uuid,
    required this.relatedType,
    required this.relatedUuid,
    required this.expenseType,
    required this.amount,
    this.expenseDate,
    this.orderUuid,
    this.supplierUuid,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String relatedType;
  final String relatedUuid;
  final String expenseType;
  final int amount;
  final DateTime? expenseDate;
  final String? orderUuid;
  final String? supplierUuid;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class UpdateExpenseInput {
  const UpdateExpenseInput({
    this.relatedType,
    this.relatedUuid,
    this.expenseType,
    this.amount,
    this.expenseDate,
    this.orderUuid,
    this.supplierUuid,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? relatedType;
  final String? relatedUuid;
  final String? expenseType;
  final int? amount;
  final DateTime? expenseDate;
  final String? orderUuid;
  final String? supplierUuid;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class FinanceService {
  FinanceService({
    required OrderRepository orderRepository,
    required FinanceRepository financeRepository,
    ShipmentRepository? shipmentRepository,
    DictionaryService? dictionaryService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _orderRepository = orderRepository,
       _financeRepository = financeRepository,
       _shipmentRepository = shipmentRepository,
       _dictionaryService = dictionaryService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  static const _productCostType = 'product_cost';
  static const _costExpenseTypes = {
    _productCostType,
    'processing_fee',
    'shipping_fee',
    'packing_fee',
    'testing_fee',
    'tax_fee',
    'other_fee',
  };

  final OrderRepository _orderRepository;
  final FinanceRepository _financeRepository;
  final ShipmentRepository? _shipmentRepository;
  final DictionaryService? _dictionaryService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<FinanceOrderOption>> listOrderOptions({
    String keyword = '',
    int limit = 100,
  }) async {
    final orders = keyword.trim().isEmpty
        ? await _orderRepository.list(limit: limit)
        : await _orderRepository.search(keyword, limit: limit);

    return [
      for (final order in orders)
        FinanceOrderOption(orderUuid: order.uuid, orderNo: order.orderNo),
    ];
  }

  Future<List<FinanceDictionaryOption>> listExpenseTypeOptions() async {
    await _dictionaryService?.initializeDefaultDictionaries();
    final dictionaries =
        await _dictionaryService?.listEnabledByType('expense_type') ??
        const <Dictionary>[];

    return [
      for (final dictionary in dictionaries)
        FinanceDictionaryOption(
          key: dictionary.dictKey,
          label: dictionary.dictLabel,
        ),
    ];
  }

  Future<FinanceOrderContext?> getOrderContext(String orderUuid) async {
    final order = await _orderRepository.getByUuid(orderUuid);
    if (order == null) {
      return null;
    }

    return FinanceOrderContext(
      orderUuid: order.uuid,
      orderNo: order.orderNo,
      amountAnalysis: await analyzeOrderAmounts(orderUuid),
      targets: await _buildTargets(order),
    );
  }

  Future<List<FinanceExpenseEntry>> listOrderExpenses(String orderUuid) async {
    final expenses = await _financeRepository.listExpensesByOrderUuid(
      orderUuid,
    );
    final typeLabels = {
      for (final option in await listExpenseTypeOptions())
        option.key: option.label,
    };
    final targetLabels = await _targetLabels(orderUuid);

    return [
      for (final expense in expenses)
        FinanceExpenseEntry(
          expense: expense,
          expenseTypeLabel:
              typeLabels[expense.expenseType] ?? expense.expenseType,
          relatedLabel:
              targetLabels[_targetKey(
                expense.relatedType,
                expense.relatedUuid,
              )] ??
              expense.relatedUuid,
        ),
    ];
  }

  Future<ExpenseItem?> getExpenseByUuid(String expenseUuid) {
    return _financeRepository.getByUuid(expenseUuid);
  }

  Future<int> calculateOrderTotalSale(String orderUuid) async {
    final items = await _orderRepository.listItemsByOrderUuid(orderUuid);
    return items.fold<int>(0, (sum, item) => sum + item.saleAmount);
  }

  Future<int> calculateOrderTotalCost(String orderUuid) async {
    final items = await _orderRepository.listItemsByOrderUuid(orderUuid);
    final expenses = await _financeRepository.listExpensesByOrderUuid(
      orderUuid,
    );

    final itemProductCost = items.fold<int>(
      0,
      (sum, item) => sum + item.costAmount,
    );

    final allExpenseCost = expenses
        .where(
          (expense) => _costExpenseTypes.contains(expense.expenseType),
        )
        .fold<int>(0, (sum, expense) => sum + expense.amount);

    int shipmentsShippingFee = 0;
    if (_shipmentRepository != null) {
      final shipments =
          await _shipmentRepository.listByOrderUuid(orderUuid);
      shipmentsShippingFee = shipments.fold<int>(
        0,
        (sum, shipment) => sum + shipment.shippingFee,
      );
    }

    // TODO: shipments.shipping_fee may overlap with expense_items of type
    // shipping_fee if the user records both. Current data model cannot
    // distinguish these cases; consider a future reconciliation flag or
    // convention (e.g. use expense_items OR shipment.shipping_fee, not both).

    return itemProductCost + allExpenseCost + shipmentsShippingFee;
  }

  Future<int> calculateOrderProfit(String orderUuid) async {
    final summary = await calculateOrderAmountSummary(orderUuid);
    return summary.totalProfitAmount;
  }

  Future<ProfitRateResult> calculateOrderProfitRate(String orderUuid) async {
    final summary = await calculateOrderAmountSummary(orderUuid);

    if (summary.totalSaleAmount <= 0) {
      return ProfitRateResult(
        totalSaleAmount: summary.totalSaleAmount,
        totalProfitAmount: summary.totalProfitAmount,
        rate: null,
        warning: '销售金额为空或为 0，无法计算毛利率。',
      );
    }

    return ProfitRateResult(
      totalSaleAmount: summary.totalSaleAmount,
      totalProfitAmount: summary.totalProfitAmount,
      rate: summary.totalProfitAmount / summary.totalSaleAmount,
    );
  }

  Future<OrderAmountSummary> calculateOrderAmountSummary(
    String orderUuid,
  ) async {
    final totalSaleAmount = await calculateOrderTotalSale(orderUuid);
    final totalCostAmount = await calculateOrderTotalCost(orderUuid);

    return OrderAmountSummary(
      totalSaleAmount: totalSaleAmount,
      totalCostAmount: totalCostAmount,
      totalProfitAmount: totalSaleAmount - totalCostAmount,
    );
  }

  Future<FinanceOrderAmountAnalysis> analyzeOrderAmounts(
    String orderUuid,
  ) async {
    final summary = await calculateOrderAmountSummary(orderUuid);
    final profitRate = await calculateOrderProfitRate(orderUuid);
    final warnings = <String>[
      if (summary.totalProfitAmount < 0) '毛利为负数，请检查销售金额和成本费用。',
      if (profitRate.warning != null) profitRate.warning!,
    ];

    return FinanceOrderAmountAnalysis(
      totalSaleAmount: summary.totalSaleAmount,
      totalCostAmount: summary.totalCostAmount,
      totalProfitAmount: summary.totalProfitAmount,
      profitRate: profitRate.rate,
      warnings: warnings,
    );
  }

  Future<ExpenseItem?> createExpense(CreateExpenseInput input) async {
    _validateCreateExpense(input);
    final expenseUuid = input.uuid ?? _uuid.v4();

    await _financeRepository.create(
      ExpenseItemsCompanion.insert(
        uuid: expenseUuid,
        relatedType: input.relatedType.trim(),
        relatedUuid: input.relatedUuid.trim(),
        expenseType: input.expenseType.trim(),
        amount: input.amount,
        expenseDate: Value(input.expenseDate),
        orderUuid: Value(_blankToNull(input.orderUuid)),
        supplierUuid: Value(_blankToNull(input.supplierUuid)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    if (_blankToNull(input.orderUuid) != null) {
      await refreshOrderAmounts(input.orderUuid!, recordAudit: true);
    }

    await _auditLogService?.recordCreate(
      entityType: 'expense_item',
      entityUuid: expenseUuid,
      newValue: {
        'related_type': input.relatedType,
        'related_uuid': input.relatedUuid,
        'expense_type': input.expenseType,
        'amount': input.amount,
        'order_uuid': input.orderUuid,
      },
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create expense item',
    );

    return _financeRepository.getByUuid(expenseUuid);
  }

  Future<bool> updateExpense(
    String expenseUuid,
    UpdateExpenseInput input,
  ) async {
    final oldExpense = await _financeRepository.getByUuid(expenseUuid);
    if (oldExpense == null) {
      return false;
    }

    if (input.amount != null && input.amount! <= 0) {
      throw ArgumentError('Expense amount must be greater than 0.');
    }

    final updated = await _financeRepository.update(
      expenseUuid,
      ExpenseItemsCompanion(
        relatedType: _value(_blankToNull(input.relatedType)),
        relatedUuid: _value(_blankToNull(input.relatedUuid)),
        expenseType: _value(_blankToNull(input.expenseType)),
        amount: _value(input.amount),
        expenseDate: _nullableValue(input.expenseDate),
        orderUuid: _nullableValue(_blankToNull(input.orderUuid)),
        supplierUuid: _nullableValue(_blankToNull(input.supplierUuid)),
        remark: _nullableValue(_blankToNull(input.remark)),
        deviceId: _nullableValue(_blankToNull(input.deviceId)),
      ),
    );

    if (updated) {
      final nextOrderUuid =
          _blankToNull(input.orderUuid) ?? oldExpense.orderUuid;
      if (_blankToNull(oldExpense.orderUuid) != null) {
        await refreshOrderAmounts(oldExpense.orderUuid!, recordAudit: true);
      }
      if (nextOrderUuid != null && nextOrderUuid != oldExpense.orderUuid) {
        await refreshOrderAmounts(nextOrderUuid, recordAudit: true);
      }

      await _auditLogService?.recordUpdate(
        entityType: 'expense_item',
        entityUuid: expenseUuid,
        oldValue: _expenseSnapshot(oldExpense),
        newValue: _expenseUpdateSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update expense item',
      );
    }

    return updated;
  }

  Future<bool> softDeleteExpense(
    String expenseUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldExpense = await _financeRepository.getByUuid(expenseUuid);
    final deleted = await _financeRepository.softDelete(expenseUuid);

    if (deleted) {
      if (_blankToNull(oldExpense?.orderUuid) != null) {
        await refreshOrderAmounts(oldExpense!.orderUuid!, recordAudit: true);
      }

      await _auditLogService?.recordDelete(
        entityType: 'expense_item',
        entityUuid: expenseUuid,
        oldValue: _expenseSnapshot(oldExpense),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete expense item',
      );
    }

    return deleted;
  }

  Future<OrderAmountSummary> refreshOrderAmounts(
    String orderUuid, {
    String? operatorName,
    String? deviceId,
    bool recordAudit = true,
  }) async {
    final oldOrder = await _orderRepository.getByUuid(orderUuid);
    final summary = await calculateOrderAmountSummary(orderUuid);

    await _orderRepository.update(
      orderUuid,
      SalesOrdersCompanion(
        totalSaleAmount: Value(summary.totalSaleAmount),
        totalCostAmount: Value(summary.totalCostAmount),
        totalProfitAmount: Value(summary.totalProfitAmount),
      ),
    );

    if (recordAudit) {
      await _auditLogService?.recordUpdate(
        entityType: 'sales_order',
        entityUuid: orderUuid,
        oldValue: oldOrder == null
            ? null
            : {
                'total_sale_amount': oldOrder.totalSaleAmount,
                'total_cost_amount': oldOrder.totalCostAmount,
                'total_profit_amount': oldOrder.totalProfitAmount,
              },
        newValue: {
          'total_sale_amount': summary.totalSaleAmount,
          'total_cost_amount': summary.totalCostAmount,
          'total_profit_amount': summary.totalProfitAmount,
        },
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Refresh order amounts from finance',
      );
    }

    return summary;
  }

  Future<List<FinanceOrderTargetOption>> _buildTargets(SalesOrder order) async {
    final targets = <FinanceOrderTargetOption>[
      FinanceOrderTargetOption(
        relatedType: 'sales_order',
        relatedUuid: order.uuid,
        label: '订单 ${order.orderNo}',
        description: '订单级费用',
      ),
    ];

    final orderItems = await _orderRepository.listItemsByOrderUuid(order.uuid);
    for (final item in orderItems) {
      targets.add(
        FinanceOrderTargetOption(
          relatedType: 'sales_order_item',
          relatedUuid: item.uuid,
          label: item.productNameSnapshot,
          description: _itemDescription(item),
          defaultExpenseType: 'product_cost',
        ),
      );
    }

    final shipments =
        await _shipmentRepository?.listByOrderUuid(order.uuid) ??
        const <Shipment>[];
    for (final shipment in shipments) {
      targets.add(
        FinanceOrderTargetOption(
          relatedType: 'shipment',
          relatedUuid: shipment.uuid,
          label: shipment.shipmentNo,
          description:
              shipment.trackingNo == null || shipment.trackingNo!.isEmpty
              ? '发货单运费'
              : '快递单号 ${shipment.trackingNo}',
          defaultExpenseType: 'shipping_fee',
        ),
      );
    }

    return targets;
  }

  Future<Map<String, String>> _targetLabels(String orderUuid) async {
    final order = await _orderRepository.getByUuid(orderUuid);
    if (order == null) {
      return const {};
    }

    return {
      for (final target in await _buildTargets(order))
        _targetKey(target.relatedType, target.relatedUuid): target.label,
    };
  }

  String _itemDescription(SalesOrderItem item) {
    final parts = [
      if (_blankToNull(item.productCodeSnapshot) != null)
        '货号 ${item.productCodeSnapshot}',
      if (_blankToNull(item.specificationSnapshot) != null)
        '规格 ${item.specificationSnapshot}',
    ];

    return parts.isEmpty ? '订单明细费用' : parts.join(' / ');
  }

  void _validateCreateExpense(CreateExpenseInput input) {
    if (_blankToNull(input.relatedType) == null) {
      throw ArgumentError('Expense related type is required.');
    }
    if (_blankToNull(input.relatedUuid) == null) {
      throw ArgumentError('Expense related uuid is required.');
    }
    if (_blankToNull(input.expenseType) == null) {
      throw ArgumentError('Expense type is required.');
    }
    if (input.amount <= 0) {
      throw ArgumentError('Expense amount must be greater than 0.');
    }
  }

  String _targetKey(String relatedType, String relatedUuid) {
    return '$relatedType::$relatedUuid';
  }

  Value<T> _value<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  Value<T?> _nullableValue<T>(T? value) {
    return value == null ? const Value.absent() : Value(value);
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Map<String, Object?>? _expenseSnapshot(ExpenseItem? expense) {
    if (expense == null) {
      return null;
    }

    return {
      'uuid': expense.uuid,
      'related_type': expense.relatedType,
      'related_uuid': expense.relatedUuid,
      'expense_type': expense.expenseType,
      'amount': expense.amount,
      'order_uuid': expense.orderUuid,
      'supplier_uuid': expense.supplierUuid,
      'remark': expense.remark,
    };
  }

  Map<String, Object?> _expenseUpdateSnapshot(UpdateExpenseInput input) {
    return {
      if (input.relatedType != null) 'related_type': input.relatedType,
      if (input.relatedUuid != null) 'related_uuid': input.relatedUuid,
      if (input.expenseType != null) 'expense_type': input.expenseType,
      if (input.amount != null) 'amount': input.amount,
      if (input.expenseDate != null) 'expense_date': input.expenseDate,
      if (input.orderUuid != null) 'order_uuid': input.orderUuid,
      if (input.supplierUuid != null) 'supplier_uuid': input.supplierUuid,
      if (input.remark != null) 'remark': input.remark,
    };
  }
}
