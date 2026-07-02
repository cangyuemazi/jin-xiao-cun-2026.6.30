import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
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
      child: SizedBox(
        width: 210,
        child: Row(
          children: [
            Icon(icon, color: colors.foreground, size: AppSpacing.xxl),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.caption),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '$count',
                    style: AppTextStyles.sectionTitle.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _TodoColors _colors(DashboardTodoTone tone) {
    return switch (tone) {
      DashboardTodoTone.warning => const _TodoColors(AppColors.warning),
      DashboardTodoTone.danger => const _TodoColors(AppColors.danger),
      DashboardTodoTone.info => const _TodoColors(AppColors.info),
      DashboardTodoTone.neutral => const _TodoColors(AppColors.neutral),
    };
  }
}

enum DashboardTodoTone { neutral, warning, danger, info }

class _TodoColors {
  const _TodoColors(this.foreground);

  final Color foreground;
}
