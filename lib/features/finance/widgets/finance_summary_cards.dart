import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../view_models/finance_view_model.dart';

class FinanceSummaryCards extends StatelessWidget {
  const FinanceSummaryCards({super.key, required this.summary});

  final FinanceAmountSummaryState summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: '销售金额',
            value:
                '¥${FinanceViewModel.formatFenToYuan(summary.totalSaleAmount)}',
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '总成本',
            value:
                '¥${FinanceViewModel.formatFenToYuan(summary.totalCostAmount)}',
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '毛利',
            value:
                '¥${FinanceViewModel.formatFenToYuan(summary.totalProfitAmount)}',
            valueColor: summary.totalProfitAmount < 0
                ? AppColors.danger
                : AppColors.success,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '毛利率',
            value: FinanceViewModel.formatProfitRate(summary.profitRate),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.caption),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: AppTextStyles.sectionTitle.copyWith(
              color: valueColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
