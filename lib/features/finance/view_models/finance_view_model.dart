import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/finance_service.dart';
import '../../orders/view_models/order_list_view_model.dart';

final financeViewModelProvider =
    AsyncNotifierProvider.autoDispose<FinanceViewModel, FinanceState>(
      FinanceViewModel.new,
    );

class FinanceOrderOptionState {
  const FinanceOrderOptionState({
    required this.orderUuid,
    required this.orderNo,
  });

  final String orderUuid;
  final String orderNo;

  factory FinanceOrderOptionState.fromOption(FinanceOrderOption option) {
    return FinanceOrderOptionState(
      orderUuid: option.orderUuid,
      orderNo: option.orderNo,
    );
  }
}

class FinanceExpenseTypeOptionState {
  const FinanceExpenseTypeOptionState({required this.key, required this.label});

  final String key;
  final String label;

  factory FinanceExpenseTypeOptionState.fromOption(
    FinanceDictionaryOption option,
  ) {
    return FinanceExpenseTypeOptionState(key: option.key, label: option.label);
  }
}

class FinanceTargetOptionState {
  const FinanceTargetOptionState({
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

  String get key => '$relatedType::$relatedUuid';

  factory FinanceTargetOptionState.fromOption(FinanceOrderTargetOption option) {
    return FinanceTargetOptionState(
      relatedType: option.relatedType,
      relatedUuid: option.relatedUuid,
      label: option.label,
      description: option.description,
      defaultExpenseType: option.defaultExpenseType,
    );
  }
}

class FinanceAmountSummaryState {
  const FinanceAmountSummaryState({
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

  factory FinanceAmountSummaryState.empty() {
    return const FinanceAmountSummaryState(
      totalSaleAmount: 0,
      totalCostAmount: 0,
      totalProfitAmount: 0,
      profitRate: null,
    );
  }

  factory FinanceAmountSummaryState.fromAnalysis(
    FinanceOrderAmountAnalysis analysis,
  ) {
    return FinanceAmountSummaryState(
      totalSaleAmount: analysis.totalSaleAmount,
      totalCostAmount: analysis.totalCostAmount,
      totalProfitAmount: analysis.totalProfitAmount,
      profitRate: analysis.profitRate,
      warnings: analysis.warnings,
    );
  }
}

class FinanceExpenseRowState {
  const FinanceExpenseRowState({
    required this.uuid,
    required this.relatedType,
    required this.relatedUuid,
    required this.relatedLabel,
    required this.expenseType,
    required this.expenseTypeLabel,
    required this.amount,
    this.expenseDate,
    this.orderUuid,
    this.remark,
  });

  final String uuid;
  final String relatedType;
  final String relatedUuid;
  final String relatedLabel;
  final String expenseType;
  final String expenseTypeLabel;
  final int amount;
  final DateTime? expenseDate;
  final String? orderUuid;
  final String? remark;

  String get targetKey => '$relatedType::$relatedUuid';

  factory FinanceExpenseRowState.fromEntry(FinanceExpenseEntry entry) {
    final expense = entry.expense;
    return FinanceExpenseRowState(
      uuid: expense.uuid,
      relatedType: expense.relatedType,
      relatedUuid: expense.relatedUuid,
      relatedLabel: entry.relatedLabel,
      expenseType: expense.expenseType,
      expenseTypeLabel: entry.expenseTypeLabel,
      amount: expense.amount,
      expenseDate: expense.expenseDate,
      orderUuid: expense.orderUuid,
      remark: expense.remark,
    );
  }
}

class FinanceExpenseFormState {
  const FinanceExpenseFormState({
    this.expenseUuid,
    this.targetKey = '',
    this.expenseType = '',
    this.amountYuan = '',
    this.expenseDateText = '',
    this.remark = '',
  });

  final String? expenseUuid;
  final String targetKey;
  final String expenseType;
  final String amountYuan;
  final String expenseDateText;
  final String remark;

  bool get isEditing => expenseUuid != null;

  FinanceExpenseFormState copyWith({
    String? expenseUuid,
    String? targetKey,
    String? expenseType,
    String? amountYuan,
    String? expenseDateText,
    String? remark,
    bool clearExpenseUuid = false,
  }) {
    return FinanceExpenseFormState(
      expenseUuid: clearExpenseUuid ? null : expenseUuid ?? this.expenseUuid,
      targetKey: targetKey ?? this.targetKey,
      expenseType: expenseType ?? this.expenseType,
      amountYuan: amountYuan ?? this.amountYuan,
      expenseDateText: expenseDateText ?? this.expenseDateText,
      remark: remark ?? this.remark,
    );
  }
}

class FinanceState {
  const FinanceState({
    this.keyword = '',
    this.orders = const [],
    this.selectedOrderUuid = '',
    this.selectedOrderNo = '',
    this.summary,
    this.targets = const [],
    this.expenseTypes = const [],
    this.expenses = const [],
    this.form = const FinanceExpenseFormState(),
    this.errorMessage,
  });

  final String keyword;
  final List<FinanceOrderOptionState> orders;
  final String selectedOrderUuid;
  final String selectedOrderNo;
  final FinanceAmountSummaryState? summary;
  final List<FinanceTargetOptionState> targets;
  final List<FinanceExpenseTypeOptionState> expenseTypes;
  final List<FinanceExpenseRowState> expenses;
  final FinanceExpenseFormState form;
  final String? errorMessage;

  FinanceState copyWith({
    String? keyword,
    List<FinanceOrderOptionState>? orders,
    String? selectedOrderUuid,
    String? selectedOrderNo,
    FinanceAmountSummaryState? summary,
    List<FinanceTargetOptionState>? targets,
    List<FinanceExpenseTypeOptionState>? expenseTypes,
    List<FinanceExpenseRowState>? expenses,
    FinanceExpenseFormState? form,
    String? errorMessage,
    bool clearError = false,
  }) {
    return FinanceState(
      keyword: keyword ?? this.keyword,
      orders: orders ?? this.orders,
      selectedOrderUuid: selectedOrderUuid ?? this.selectedOrderUuid,
      selectedOrderNo: selectedOrderNo ?? this.selectedOrderNo,
      summary: summary ?? this.summary,
      targets: targets ?? this.targets,
      expenseTypes: expenseTypes ?? this.expenseTypes,
      expenses: expenses ?? this.expenses,
      form: form ?? this.form,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class FinanceViewModel extends AsyncNotifier<FinanceState> {
  @override
  Future<FinanceState> build() {
    return _load();
  }

  Future<void> setSearchKeyword(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<void> selectOrder(String orderUuid) async {
    final current = state.value;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(
        keyword: current?.keyword ?? '',
        selectedOrderUuid: orderUuid,
        resetForm: true,
      ),
    );
  }

  void updateForm({
    String? targetKey,
    String? expenseType,
    String? amountYuan,
    String? expenseDateText,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    var nextExpenseType = expenseType ?? current.form.expenseType;
    if (targetKey != null && targetKey != current.form.targetKey) {
      final target = current.targets
          .where((option) => option.key == targetKey)
          .firstOrNull;
      nextExpenseType = target?.defaultExpenseType ?? nextExpenseType;
    }

    state = AsyncValue.data(
      current.copyWith(
        form: current.form.copyWith(
          targetKey: targetKey,
          expenseType: nextExpenseType,
          amountYuan: amountYuan,
          expenseDateText: expenseDateText,
          remark: remark,
        ),
        clearError: true,
      ),
    );
  }

  void startEdit(FinanceExpenseRowState row) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        form: FinanceExpenseFormState(
          expenseUuid: row.uuid,
          targetKey: row.targetKey,
          expenseType: row.expenseType,
          amountYuan: formatFenToYuan(row.amount),
          expenseDateText: _formatDate(row.expenseDate),
          remark: row.remark ?? '',
        ),
        clearError: true,
      ),
    );
  }

  void cancelEdit() {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        form: _defaultForm(current.targets, current.expenseTypes),
      ),
    );
  }

  Future<void> refreshAmounts() async {
    final current = state.value;
    if (current == null || current.selectedOrderUuid.isEmpty) {
      return;
    }

    await ref
        .read(financeServiceProvider)
        .refreshOrderAmounts(current.selectedOrderUuid);
    ref.invalidate(orderListViewModelProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(
        keyword: current.keyword,
        selectedOrderUuid: current.selectedOrderUuid,
        form: current.form,
      ),
    );
  }

  Future<void> saveExpense() async {
    final current = state.value;
    if (current == null) {
      return;
    }

    final error = _validate(current);
    if (error != null) {
      state = AsyncValue.data(current.copyWith(errorMessage: error));
      return;
    }

    final target = current.targets
        .where((option) => option.key == current.form.targetKey)
        .first;
    final service = ref.read(financeServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (current.form.isEditing) {
        await service.updateExpense(
          current.form.expenseUuid!,
          UpdateExpenseInput(
            relatedType: target.relatedType,
            relatedUuid: target.relatedUuid,
            expenseType: current.form.expenseType,
            amount: parseYuanToFen(current.form.amountYuan),
            expenseDate: _parseDate(current.form.expenseDateText),
            orderUuid: current.selectedOrderUuid,
            remark: _blankToNull(current.form.remark),
          ),
        );
      } else {
        await service.createExpense(
          CreateExpenseInput(
            relatedType: target.relatedType,
            relatedUuid: target.relatedUuid,
            expenseType: current.form.expenseType,
            amount: parseYuanToFen(current.form.amountYuan),
            expenseDate: _parseDate(current.form.expenseDateText),
            orderUuid: current.selectedOrderUuid,
            remark: _blankToNull(current.form.remark),
          ),
        );
      }

      ref.invalidate(orderListViewModelProvider);
      return _load(
        keyword: current.keyword,
        selectedOrderUuid: current.selectedOrderUuid,
        resetForm: true,
      );
    });
  }

  Future<void> softDeleteExpense(String expenseUuid) async {
    final current = state.value;
    if (current == null) {
      return;
    }

    await ref.read(financeServiceProvider).softDeleteExpense(expenseUuid);
    ref.invalidate(orderListViewModelProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _load(
        keyword: current.keyword,
        selectedOrderUuid: current.selectedOrderUuid,
        resetForm: true,
      ),
    );
  }

  Future<FinanceState> _load({
    String keyword = '',
    String? selectedOrderUuid,
    FinanceExpenseFormState? form,
    bool resetForm = false,
  }) async {
    final service = ref.read(financeServiceProvider);
    final orders = (await service.listOrderOptions(
      keyword: keyword,
    )).map(FinanceOrderOptionState.fromOption).toList();
    final expenseTypes = (await service.listExpenseTypeOptions())
        .map(FinanceExpenseTypeOptionState.fromOption)
        .toList();

    final selectedUuid = _resolveSelectedOrderUuid(orders, selectedOrderUuid);
    if (selectedUuid.isEmpty) {
      return FinanceState(
        keyword: keyword,
        orders: orders,
        expenseTypes: expenseTypes,
        summary: FinanceAmountSummaryState.empty(),
      );
    }

    final context = await service.getOrderContext(selectedUuid);
    if (context == null) {
      return FinanceState(
        keyword: keyword,
        orders: orders,
        selectedOrderUuid: selectedUuid,
        expenseTypes: expenseTypes,
        summary: FinanceAmountSummaryState.empty(),
        errorMessage: '订单不存在或已删除。',
      );
    }

    final targets = context.targets
        .map(FinanceTargetOptionState.fromOption)
        .toList();
    final expenses = (await service.listOrderExpenses(
      selectedUuid,
    )).map(FinanceExpenseRowState.fromEntry).toList();
    final nextForm = resetForm || form == null
        ? _defaultForm(targets, expenseTypes)
        : _normalizeForm(form, targets, expenseTypes);

    return FinanceState(
      keyword: keyword,
      orders: orders,
      selectedOrderUuid: context.orderUuid,
      selectedOrderNo: context.orderNo,
      summary: FinanceAmountSummaryState.fromAnalysis(context.amountAnalysis),
      targets: targets,
      expenseTypes: expenseTypes,
      expenses: expenses,
      form: nextForm,
    );
  }

  String _resolveSelectedOrderUuid(
    List<FinanceOrderOptionState> orders,
    String? selectedOrderUuid,
  ) {
    if (orders.isEmpty) {
      return '';
    }

    if (selectedOrderUuid != null &&
        orders.any((order) => order.orderUuid == selectedOrderUuid)) {
      return selectedOrderUuid;
    }

    return orders.first.orderUuid;
  }

  FinanceExpenseFormState _defaultForm(
    List<FinanceTargetOptionState> targets,
    List<FinanceExpenseTypeOptionState> expenseTypes,
  ) {
    final target = targets.isEmpty ? null : targets.first;
    return FinanceExpenseFormState(
      targetKey: target?.key ?? '',
      expenseType:
          target?.defaultExpenseType ??
          (expenseTypes.isEmpty ? '' : expenseTypes.first.key),
      expenseDateText: _formatDate(DateTime.now()),
    );
  }

  FinanceExpenseFormState _normalizeForm(
    FinanceExpenseFormState form,
    List<FinanceTargetOptionState> targets,
    List<FinanceExpenseTypeOptionState> expenseTypes,
  ) {
    final targetKeys = targets.map((target) => target.key).toSet();
    final expenseTypeKeys = expenseTypes.map((type) => type.key).toSet();
    final targetKey = targetKeys.contains(form.targetKey)
        ? form.targetKey
        : (targets.isEmpty ? '' : targets.first.key);
    final target = targets
        .where((option) => option.key == targetKey)
        .firstOrNull;
    final expenseType = expenseTypeKeys.contains(form.expenseType)
        ? form.expenseType
        : target?.defaultExpenseType ??
              (expenseTypes.isEmpty ? '' : expenseTypes.first.key);

    return form.copyWith(targetKey: targetKey, expenseType: expenseType);
  }

  String? _validate(FinanceState current) {
    if (current.selectedOrderUuid.isEmpty) {
      return '请先选择订单。';
    }

    if (current.form.targetKey.isEmpty) {
      return '请选择费用关联对象。';
    }

    if (current.form.expenseType.isEmpty) {
      return '请选择费用类型。';
    }

    if (!isValidMoney(current.form.amountYuan) ||
        parseYuanToFen(current.form.amountYuan) <= 0) {
      return '费用金额必须是大于 0 的有效金额。';
    }

    if (_parseDate(current.form.expenseDateText) == null &&
        current.form.expenseDateText.trim().isNotEmpty) {
      return '费用日期格式应为 YYYY-MM-DD。';
    }

    return null;
  }

  static bool isValidMoney(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return false;
    }

    return RegExp(r'^\d+(?:\.\d{1,2})?$').hasMatch(trimmed);
  }

  static int parseYuanToFen(String value) {
    final match = RegExp(r'^(\d+)(?:\.(\d{1,2}))?$').firstMatch(value.trim());
    if (match == null) {
      return 0;
    }

    final yuan = int.parse(match.group(1)!);
    final fen = (match.group(2) ?? '').padRight(2, '0');
    return yuan * 100 + (fen.isEmpty ? 0 : int.parse(fen));
  }

  static String formatFenToYuan(int amount) {
    final sign = amount < 0 ? '-' : '';
    final absolute = amount.abs();
    final yuan = absolute ~/ 100;
    final fen = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$yuan.$fen';
  }

  static String formatProfitRate(double? rate) {
    if (rate == null) {
      return '无法计算';
    }

    return '${(rate * 100).toStringAsFixed(2)}%';
  }

  DateTime? _parseDate(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    return DateTime.tryParse(trimmed);
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
