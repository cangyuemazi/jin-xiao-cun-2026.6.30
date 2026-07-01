import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/shipment_form_view_model.dart';

typedef ShipmentFormItemChanged =
    void Function(int index, ShipmentFormItemState item);

class ShipmentItemsEditor extends StatelessWidget {
  const ShipmentItemsEditor({
    super.key,
    required this.items,
    required this.onChanged,
    this.readOnly = false,
  });

  final List<ShipmentFormItemState> items;
  final ShipmentFormItemChanged onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.inventory_2_outlined,
        title: '暂无可发货明细',
        description: '选择关联订单后会显示订单产品明细。',
      );
    }

    return Column(
      children: [
        for (var index = 0; index < items.length; index++) ...[
          _ShipmentItemRow(
            item: items[index],
            index: index,
            readOnly: readOnly,
            onChanged: onChanged,
          ),
          if (index < items.length - 1) const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}

class _ShipmentItemRow extends StatelessWidget {
  const _ShipmentItemRow({
    required this.item,
    required this.index,
    required this.readOnly,
    required this.onChanged,
  });

  final ShipmentFormItemState item;
  final int index;
  final bool readOnly;
  final ShipmentFormItemChanged onChanged;

  @override
  Widget build(BuildContext context) {
    final enabled = !readOnly && !item.isAlreadyFullyShipped;

    return Opacity(
      opacity: item.isAlreadyFullyShipped ? 0.58 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: AppRadius.card,
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: item.isSelected,
                    onChanged: enabled
                        ? (value) => onChanged(
                            index,
                            item.copyWith(isSelected: value ?? false),
                          )
                        : null,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: AppSpacing.sm,
                          runSpacing: AppSpacing.xs,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              item.productName,
                              style: AppTextStyles.bodyLarge,
                            ),
                            if (item.isAlreadyFullyShipped)
                              const StatusBadge(
                                label: '已全部发货',
                                tone: StatusBadgeTone.success,
                                icon: Icons.check_circle_outline,
                              ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(_metaText, style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: item.isFullShipment,
                        onChanged: enabled && item.isSelected
                            ? (value) => onChanged(
                                index,
                                item.copyWith(isFullShipment: value ?? false),
                              )
                            : null,
                      ),
                      const Text('全部发货'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppTextField(
                      initialValue: item.quantityValue,
                      label: '本次发货数量',
                      enabled:
                          enabled && item.isSelected && !item.isFullShipment,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          onChanged(index, item.copyWith(quantityValue: value)),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  SizedBox(
                    width: 120,
                    child: AppTextField(
                      initialValue: item.quantityUnit,
                      label: '单位',
                      enabled: enabled && item.isSelected,
                      onChanged: (value) =>
                          onChanged(index, item.copyWith(quantityUnit: value)),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    flex: 2,
                    child: AppTextField(
                      initialValue: item.remark,
                      label: '明细备注',
                      enabled: enabled && item.isSelected,
                      onChanged: (value) =>
                          onChanged(index, item.copyWith(remark: value)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _metaText {
    final parts = <String>[
      if (item.productCode.isNotEmpty) '货号 ${item.productCode}',
      if (item.specification.isNotEmpty) '规格 ${item.specification}',
      '订单数量 ${item.orderedQuantityText}',
      '已发 ${item.shippedQuantityText}',
      '剩余 ${item.remainingQuantityText}',
    ];

    return parts.join(' · ');
  }
}
