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
            icon: Icons.trending_up,
            tone: _SummaryTone.neutral,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '总成本',
            value:
                '¥${FinanceViewModel.formatFenToYuan(summary.totalCostAmount)}',
            icon: Icons.payments_outlined,
            tone: _SummaryTone.neutral,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '毛利',
            value:
                '¥${FinanceViewModel.formatFenToYuan(summary.totalProfitAmount)}',
            icon: Icons.insights_outlined,
            tone: summary.totalProfitAmount < 0
                ? _SummaryTone.negative
                : _SummaryTone.positive,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: '毛利率',
            value: FinanceViewModel.formatProfitRate(summary.profitRate),
            icon: Icons.percent_outlined,
            tone: _SummaryTone.neutral,
          ),
        ),
      ],
    );
  }
}

enum _SummaryTone { neutral, positive, negative }

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    this.tone = _SummaryTone.neutral,
  });

  final String label;
  final String value;
  final IconData icon;
  final _SummaryTone tone;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = switch (tone) {
      _SummaryTone.positive => AppColors.success,
      _SummaryTone.negative => AppColors.danger,
      _SummaryTone.neutral => AppColors.textMuted,
    };
    final Color valueColor = switch (tone) {
      _SummaryTone.positive => AppColors.success,
      _SummaryTone.negative => AppColors.danger,
      _SummaryTone.neutral => AppColors.textPrimary,
    };

    return AppCard(
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: AppSpacing.sm),
              Text(label, style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            value,
            style: AppTextStyles.metricValue.copyWith(
              color: valueColor,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
