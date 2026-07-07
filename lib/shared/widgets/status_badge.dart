import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

enum StatusBadgeTone {
  neutral,
  info,
  success,
  warning,
  danger,
  purple,
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.tone = StatusBadgeTone.neutral,
    this.icon,
    this.size = StatusBadgeSize.medium,
  });

  final String label;
  final StatusBadgeTone tone;
  final IconData? icon;
  final StatusBadgeSize size;

  @override
  Widget build(BuildContext context) {
    final colors = _toneColors(tone);
    final verticalPadding = size == StatusBadgeSize.small
        ? AppSpacing.xxs
        : 4.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: AppRadius.borderPill,
        border: Border.all(color: colors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: colors.foreground),
            const SizedBox(width: AppSpacing.xxs),
          ],
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: colors.foreground,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  _BadgeColors _toneColors(StatusBadgeTone tone) {
    return switch (tone) {
      StatusBadgeTone.success => const _BadgeColors(
          background: AppColors.successSoft,
          foreground: AppColors.success,
          border: AppColors.successBorder,
        ),
      StatusBadgeTone.warning => const _BadgeColors(
          background: AppColors.warningSoft,
          foreground: AppColors.warning,
          border: AppColors.warningBorder,
        ),
      StatusBadgeTone.danger => const _BadgeColors(
          background: AppColors.dangerSoft,
          foreground: AppColors.danger,
          border: AppColors.dangerBorder,
        ),
      StatusBadgeTone.info => const _BadgeColors(
          background: AppColors.infoSoft,
          foreground: AppColors.info,
          border: AppColors.infoBorder,
        ),
      StatusBadgeTone.purple => const _BadgeColors(
          background: AppColors.purpleSoft,
          foreground: AppColors.purple,
          border: AppColors.purpleBorder,
        ),
      StatusBadgeTone.neutral => const _BadgeColors(
          background: AppColors.neutralSoft,
          foreground: AppColors.neutral,
          border: AppColors.neutralBorder,
        ),
    };
  }
}

enum StatusBadgeSize { small, medium }

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
