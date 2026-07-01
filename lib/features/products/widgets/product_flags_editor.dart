import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';

class ProductFlagsEditor extends StatelessWidget {
  const ProductFlagsEditor({
    super.key,
    required this.isCustomProduct,
    required this.trackInventory,
    required this.onCustomProductChanged,
    required this.onTrackInventoryChanged,
  });

  final bool isCustomProduct;
  final bool trackInventory;
  final ValueChanged<bool> onCustomProductChanged;
  final ValueChanged<bool> onTrackInventoryChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FlagTile(
            title: '定制产品',
            value: isCustomProduct,
            onChanged: onCustomProductChanged,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _FlagTile(
            title: '纳入库存',
            value: trackInventory,
            onChanged: onTrackInventoryChanged,
          ),
        ),
      ],
    );
  }
}

class _FlagTile extends StatelessWidget {
  const _FlagTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: AppRadius.input,
        border: Border.all(color: AppColors.border),
      ),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
    );
  }
}
