import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';

class DashboardMetricCard extends StatelessWidget {
  const DashboardMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.description,
    this.tone = DashboardMetricTone.neutral,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? description;
  final DashboardMetricTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = _colors(tone);

    return AppCard(
      showShadow: true,
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: AppRadius.borderSm,
                  ),
                  child: Icon(icon, size: 20, color: colors.foreground),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(label, style: AppTextStyles.caption),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              value,
              style: AppTextStyles.metricValue.copyWith(
                color: colors.valueColor,
              ),
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(description!, style: AppTextStyles.caption),
            ],
          ],
        ),
      ),
    );
  }

  _MetricColors _colors(DashboardMetricTone tone) {
    return switch (tone) {
      DashboardMetricTone.success => const _MetricColors(
        background: AppColors.successSoft,
        foreground: AppColors.success,
        valueColor: AppColors.success,
      ),
      DashboardMetricTone.warning => const _MetricColors(
        background: AppColors.warningSoft,
        foreground: AppColors.warning,
        valueColor: AppColors.warning,
      ),
      DashboardMetricTone.danger => const _MetricColors(
        background: AppColors.dangerSoft,
        foreground: AppColors.danger,
        valueColor: AppColors.danger,
      ),
      DashboardMetricTone.info => const _MetricColors(
        background: AppColors.infoSoft,
        foreground: AppColors.info,
        valueColor: AppColors.textPrimary,
      ),
      DashboardMetricTone.neutral => const _MetricColors(
        background: AppColors.neutralSoft,
        foreground: AppColors.neutral,
        valueColor: AppColors.textPrimary,
      ),
    };
  }
}

enum DashboardMetricTone { neutral, success, warning, danger, info }

class _MetricColors {
  const _MetricColors({
    required this.background,
    required this.foreground,
    required this.valueColor,
  });

  final Color background;
  final Color foreground;
  final Color valueColor;
}
