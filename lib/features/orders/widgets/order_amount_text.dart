import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../view_models/order_form_view_model.dart';

class OrderAmountText extends StatelessWidget {
  const OrderAmountText({
    super.key,
    required this.amount,
    this.emphasized = false,
  });

  final int amount;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final style = emphasized
        ? AppTextStyles.tableCell.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          )
        : AppTextStyles.tableCell;

    return Text('¥${OrderFormViewModel.formatFenToYuan(amount)}', style: style);
  }
}
