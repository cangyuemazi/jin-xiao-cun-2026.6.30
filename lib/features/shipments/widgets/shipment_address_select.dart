import 'package:flutter/material.dart';

import '../../../shared/theme/app_text_styles.dart';
import '../view_models/shipment_form_view_model.dart';

class ShipmentAddressSelect extends StatelessWidget {
  const ShipmentAddressSelect({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String value;
  final List<ShipmentAddressOptionState> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final values = options.map((option) => option.uuid).toSet();
    final selectedValue = values.contains(value) ? value : null;

    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      isExpanded: true,
      style: AppTextStyles.body,
      decoration: const InputDecoration(labelText: '收货地址'),
      items: [
        for (final option in options)
          DropdownMenuItem<String>(
            value: option.uuid,
            child: Text(option.label),
          ),
      ],
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
