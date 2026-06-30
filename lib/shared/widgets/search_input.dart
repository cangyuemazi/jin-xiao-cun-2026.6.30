import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_text_field.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.hintText = '搜索',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
      textInputAction: TextInputAction.search,
      prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
      suffixIcon: onClear == null
          ? null
          : IconButton(
              tooltip: '清空',
              onPressed: onClear,
              icon: const Icon(Icons.close, color: AppColors.textMuted),
            ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
