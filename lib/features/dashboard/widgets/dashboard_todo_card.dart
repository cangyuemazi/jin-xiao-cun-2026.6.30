import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';

class DashboardTodoCard extends StatelessWidget {
  const DashboardTodoCard({
    super.key,
    required this.label,
    required this.count,
    required this.icon,
    required this.tone,
    this.onTap,
  });

  final String label;
  final int count;
  final IconData icon;
  final DashboardTodoTone tone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = _colors(tone);

    return AppCard(
      onTap: onTap,
      showShadow: true,
      child: SizedBox(
        width: 220,
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: AppRadius.borderSm,
              ),
              child: Icon(icon, size: 22, color: colors.foreground),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: AppTextStyles.caption),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '$count',
                    style: AppTextStyles.metricValue.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.chevron_right,
                size: 18,
                color: colors.foreground.withValues(alpha: 0.4),
              ),
          ],
        ),
      ),
    );
  }

  _TodoColors _colors(DashboardTodoTone tone) {
    return switch (tone) {
      DashboardTodoTone.warning => const _TodoColors(
        AppColors.warning,
        AppColors.warningSoft,
      ),
      DashboardTodoTone.danger => const _TodoColors(
        AppColors.danger,
        AppColors.dangerSoft,
      ),
      DashboardTodoTone.info => const _TodoColors(
        AppColors.info,
        AppColors.infoSoft,
      ),
      DashboardTodoTone.neutral => const _TodoColors(
        AppColors.neutral,
        AppColors.neutralSoft,
      ),
    };
  }
}

enum DashboardTodoTone { neutral, warning, danger, info }

class _TodoColors {
  const _TodoColors(this.foreground, this.background);

  final Color foreground;
  final Color background;
}
