import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant { primary, secondary, ghost, danger }

enum AppButtonSize { small, medium }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.expanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final child = _ButtonContent(
      label: label,
      icon: icon,
      isLoading: isLoading,
    );
    final effectiveOnPressed = isLoading ? null : onPressed;
    final style = _style();

    final button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
          onPressed: effectiveOnPressed,
          style: style,
          child: child,
        ),
      AppButtonVariant.secondary => OutlinedButton(
          onPressed: effectiveOnPressed,
          style: style,
          child: child,
        ),
      AppButtonVariant.ghost => TextButton(
          onPressed: effectiveOnPressed,
          style: style,
          child: child,
        ),
      AppButtonVariant.danger => FilledButton(
          onPressed: effectiveOnPressed,
          style: style,
          child: child,
        ),
    };

    if (!expanded) return button;
    return SizedBox(width: double.infinity, child: button);
  }

  ButtonStyle _style() {
    final double height = size == AppButtonSize.small ? 32 : 40;

    final EdgeInsets padding = switch (size) {
      AppButtonSize.small => const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      AppButtonSize.medium => const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
    };

    final Color foreground = switch (variant) {
      AppButtonVariant.primary => AppColors.textOnPrimary,
      AppButtonVariant.secondary => AppColors.ink,
      AppButtonVariant.ghost => AppColors.ink,
      AppButtonVariant.danger => AppColors.textOnPrimary,
    };

    final Color background = switch (variant) {
      AppButtonVariant.primary => AppColors.primary,
      AppButtonVariant.secondary => AppColors.canvas,
      AppButtonVariant.ghost => Colors.transparent,
      AppButtonVariant.danger => AppColors.danger,
    };

    final BorderSide? side = switch (variant) {
      AppButtonVariant.secondary =>
        const BorderSide(color: AppColors.hairline),
      _ => null,
    };

    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, height)),
      textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
      foregroundColor: WidgetStatePropertyAll(foreground),
      backgroundColor: WidgetStatePropertyAll(background),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0.0),
      overlayColor: const WidgetStatePropertyAll(AppColors.overlay),
      padding: WidgetStatePropertyAll(padding),
      side: WidgetStatePropertyAll(side),
      iconSize: const WidgetStatePropertyAll(16),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.isLoading,
  });

  final String label;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[
      if (isLoading)
        const SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
      else if (icon != null)
        Icon(icon, size: 16),
      Text(label),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var index = 0; index < content.length; index++) ...[
          if (index > 0) const SizedBox(width: AppSpacing.xs),
          content[index],
        ],
      ],
    );
  }
}
