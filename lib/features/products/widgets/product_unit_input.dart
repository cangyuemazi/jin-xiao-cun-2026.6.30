import 'package:flutter/material.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';

class ProductUnitInput extends StatelessWidget {
  const ProductUnitInput({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const _commonUnits = ['g', 'kg', 'mg', '片', '件', '瓶', '套'];

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          key: ValueKey(value),
          initialValue: value,
          label: '默认单位',
          onChanged: onChanged,
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final unit in _commonUnits)
              AppButton(
                label: unit,
                size: AppButtonSize.small,
                variant: value == unit
                    ? AppButtonVariant.secondary
                    : AppButtonVariant.ghost,
                onPressed: () => onChanged(unit),
              ),
          ],
        ),
      ],
    );
  }
}
