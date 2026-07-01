import 'package:flutter/material.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../view_models/order_form_view_model.dart';

class OrderSupplierEditor extends StatelessWidget {
  const OrderSupplierEditor({
    super.key,
    required this.items,
    required this.onChanged,
  });

  final List<OrderFormItemState> items;
  final void Function(int index, OrderFormItemState item) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < items.length; index++) ...[
          Row(
            children: [
              SizedBox(width: 96, child: Text('产品 ${index + 1}')),
              Expanded(
                child: AppTextField(
                  initialValue: items[index].supplierUuid,
                  label: '厂家 UUID',
                  onChanged: (value) => onChanged(
                    index,
                    items[index].copyWith(supplierUuid: value),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextField(
                  initialValue: items[index].remark,
                  label: '明细备注',
                  onChanged: (value) =>
                      onChanged(index, items[index].copyWith(remark: value)),
                ),
              ),
            ],
          ),
          if (index < items.length - 1) const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}
