import '../../data/repositories/finance_repository.dart';
import '../../data/repositories/order_repository.dart';

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

class FinanceService {
  FinanceService({
    required OrderRepository orderRepository,
    required FinanceRepository financeRepository,
  }) : _orderRepository = orderRepository,
       _financeRepository = financeRepository;

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
    final expenseProductCost = expenses
        .where((expense) => expense.expenseType == _productCostType)
        .fold<int>(0, (sum, expense) => sum + expense.amount);
    final otherCost = expenses
        .where(
          (expense) =>
              expense.expenseType != _productCostType &&
              _costExpenseTypes.contains(expense.expenseType),
        )
        .fold<int>(0, (sum, expense) => sum + expense.amount);

    final productCost = expenseProductCost > 0
        ? expenseProductCost
        : itemProductCost;

    return productCost + otherCost;
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
}
