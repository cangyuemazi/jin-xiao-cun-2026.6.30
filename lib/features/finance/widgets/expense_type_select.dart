import 'package:flutter/material.dart';

import '../../../shared/theme/app_text_styles.dart';
import '../view_models/finance_view_model.dart';

class ExpenseTypeSelect extends StatelessWidget {
  const ExpenseTypeSelect({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String value;
  final List<FinanceExpenseTypeOptionState> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final values = options.map((option) => option.key).toSet();
    final selectedValue = values.contains(value) ? value : null;

    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      isExpanded: true,
      style: AppTextStyles.body,
      decoration: const InputDecoration(labelText: '费用类型'),
      items: [
        for (final option in options)
          DropdownMenuItem<String>(
            value: option.key,
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
