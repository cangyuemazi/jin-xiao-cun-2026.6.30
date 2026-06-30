import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

enum StatusBadgeTone { neutral, success, warning, danger, info, accent }

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.tone = StatusBadgeTone.neutral,
    this.icon,
  });

  final String label;
  final StatusBadgeTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = _colors(tone);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: AppRadius.sm,
        border: Border.all(color: colors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: AppSpacing.lg, color: colors.foreground),
              const SizedBox(width: AppSpacing.xs),
            ],
            Text(
              label,
              style: AppTextStyles.caption.copyWith(color: colors.foreground),
            ),
          ],
        ),
      ),
    );
  }

  _BadgeColors _colors(StatusBadgeTone tone) {
    return switch (tone) {
      StatusBadgeTone.success => const _BadgeColors(
        background: AppColors.successSoft,
        foreground: AppColors.success,
        border: AppColors.successSoft,
      ),
      StatusBadgeTone.warning => const _BadgeColors(
        background: AppColors.warningSoft,
        foreground: AppColors.warning,
        border: AppColors.warningSoft,
      ),
      StatusBadgeTone.danger => const _BadgeColors(
        background: AppColors.dangerSoft,
        foreground: AppColors.danger,
        border: AppColors.dangerSoft,
      ),
      StatusBadgeTone.info => const _BadgeColors(
        background: AppColors.infoSoft,
        foreground: AppColors.info,
        border: AppColors.infoSoft,
      ),
      StatusBadgeTone.accent => const _BadgeColors(
        background: AppColors.accentSoft,
        foreground: AppColors.accent,
        border: AppColors.accentSoft,
      ),
      StatusBadgeTone.neutral => const _BadgeColors(
        background: AppColors.neutralSoft,
        foreground: AppColors.neutral,
        border: AppColors.neutralSoft,
      ),
    };
  }
}

class _BadgeColors {
  const _BadgeColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
