import 'package:flutter/material.dart';

import '../../../shared/theme/app_text_styles.dart';
import '../view_models/shipment_form_view_model.dart';

class ShipmentOrderSelect extends StatelessWidget {
  const ShipmentOrderSelect({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.enabled = true,
  });

  final String value;
  final List<ShipmentOrderOptionState> options;
  final ValueChanged<String> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final values = options.map((option) => option.orderUuid).toSet();
    final selectedValue = values.contains(value) ? value : null;

    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      isExpanded: true,
      style: AppTextStyles.body,
      decoration: const InputDecoration(labelText: '关联订单'),
      items: [
        for (final option in options)
          DropdownMenuItem<String>(
            value: option.orderUuid,
            child: Text(option.label),
          ),
      ],
      onChanged: enabled
          ? (value) {
              if (value != null) {
                onChanged(value);
              }
            }
          : null,
    );
  }
}
