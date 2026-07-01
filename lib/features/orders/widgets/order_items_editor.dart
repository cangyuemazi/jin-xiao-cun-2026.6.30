import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../view_models/order_form_view_model.dart';

class OrderItemsEditor extends StatelessWidget {
  const OrderItemsEditor({
    super.key,
    required this.items,
    required this.onChanged,
    required this.onAdd,
    required this.onRemove,
  });

  final List<OrderFormItemState> items;
  final void Function(int index, OrderFormItemState item) onChanged;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < items.length; index++) ...[
          _OrderItemCard(
            index: index,
            item: items[index],
            canRemove: items.length > 1,
            onChanged: (item) => onChanged(index, item),
            onRemove: () => onRemove(index),
          ),
          if (index < items.length - 1) const SizedBox(height: AppSpacing.md),
        ],
        const SizedBox(height: AppSpacing.lg),
        Align(
          alignment: Alignment.centerLeft,
          child: AppButton(
            label: '添加产品',
            icon: Icons.add,
            variant: AppButtonVariant.secondary,
            onPressed: onAdd,
          ),
        ),
      ],
    );
  }
}

class _OrderItemCard extends StatelessWidget {
  const _OrderItemCard({
    required this.index,
    required this.item,
    required this.canRemove,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final OrderFormItemState item;
  final bool canRemove;
  final ValueChanged<OrderFormItemState> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text('产品 ${index + 1}')),
                    AppButton(
                      label: '移除',
                      icon: Icons.remove_circle_outline,
                      variant: AppButtonVariant.ghost,
                      size: AppButtonSize.small,
                      onPressed: canRemove ? onRemove : null,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppTextField(
                        initialValue: item.productName,
                        label: '产品名称',
                        onChanged: (value) =>
                            onChanged(item.copyWith(productName: value)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: AppTextField(
                        initialValue: item.productCode,
                        label: '货号',
                        onChanged: (value) =>
                            onChanged(item.copyWith(productCode: value)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: AppTextField(
                        initialValue: item.productUuid,
                        label: '产品 UUID',
                        onChanged: (value) =>
                            onChanged(item.copyWith(productUuid: value)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppTextField(
                        initialValue: item.specification,
                        label: '规格',
                        onChanged: (value) =>
                            onChanged(item.copyWith(specification: value)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: AppTextField(
                        initialValue: item.quantityValue,
                        label: '数量',
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            onChanged(item.copyWith(quantityValue: value)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: AppTextField(
                        initialValue: item.quantityUnit,
                        label: '单位',
                        onChanged: (value) =>
                            onChanged(item.copyWith(quantityUnit: value)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
