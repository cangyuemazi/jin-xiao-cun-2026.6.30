import 'package:flutter/material.dart';

import '../../../shared/theme/app_text_styles.dart';
import '../view_models/finance_view_model.dart';

class FinanceTargetSelect extends StatelessWidget {
  const FinanceTargetSelect({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String value;
  final List<FinanceTargetOptionState> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final values = options.map((option) => option.key).toSet();
    final selectedValue = values.contains(value) ? value : null;

    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      isExpanded: true,
      style: AppTextStyles.body,
      decoration: const InputDecoration(labelText: '费用关联对象'),
      items: [
        for (final option in options)
          DropdownMenuItem<String>(
            value: option.key,
            child: Text(_label(option)),
          ),
      ],
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }

  String _label(FinanceTargetOptionState option) {
    if (option.description == null || option.description!.isEmpty) {
      return option.label;
    }

    return '${option.label} / ${option.description}';
  }
}
