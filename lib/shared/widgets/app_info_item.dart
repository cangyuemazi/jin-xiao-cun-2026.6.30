import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class AppInfoItem extends StatelessWidget {
  const AppInfoItem({
    super.key,
    required this.label,
    this.value,
  });

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final displayValue =
        value == null || value!.trim().isEmpty ? '—' : value!.trim();
    final isEmpty = value == null || value!.trim().isEmpty;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 104,
            child: Text(label, style: AppTextStyles.label),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              displayValue,
              style: AppTextStyles.bodyLarge.copyWith(
                color: isEmpty ? AppColors.mutedSoft : AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
