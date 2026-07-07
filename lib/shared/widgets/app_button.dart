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
        vertical: AppSpacing.xxs,
      ),
      AppButtonSize.medium => const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
    };

    final BorderSide? side = switch (variant) {
      AppButtonVariant.secondary => const BorderSide(color: AppColors.hairline),
      _ => null,
    };

    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, height)),
      textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      foregroundColor: WidgetStateProperty.resolveWith(_foregroundColor),
      backgroundColor: WidgetStateProperty.resolveWith(_backgroundColor),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0.0),
      overlayColor: const WidgetStatePropertyAll(AppColors.overlay),
      padding: WidgetStatePropertyAll(padding),
      side: WidgetStatePropertyAll(side),
      iconSize: const WidgetStatePropertyAll(16),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
      animationDuration: const Duration(milliseconds: 120),
    );
  }

  Color _foregroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.textDisabled;
    }

    return switch (variant) {
      AppButtonVariant.primary => AppColors.textOnPrimary,
      AppButtonVariant.secondary => AppColors.ink,
      AppButtonVariant.ghost => AppColors.ink,
      AppButtonVariant.danger => AppColors.textOnPrimary,
    };
  }

  Color _backgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return variant == AppButtonVariant.ghost
          ? Colors.transparent
          : AppColors.surfaceMuted;
    }

    final pressed = states.contains(WidgetState.pressed);
    final hovered = states.contains(WidgetState.hovered);

    return switch (variant) {
      AppButtonVariant.primary when pressed => AppColors.primaryPressed,
      AppButtonVariant.primary when hovered => AppColors.primaryHover,
      AppButtonVariant.primary => AppColors.primary,
      AppButtonVariant.secondary when pressed => AppColors.surfacePressed,
      AppButtonVariant.secondary when hovered => AppColors.surfaceHover,
      AppButtonVariant.secondary => AppColors.surface,
      AppButtonVariant.ghost when pressed => AppColors.surfacePressed,
      AppButtonVariant.ghost when hovered => AppColors.surfaceHover,
      AppButtonVariant.ghost => Colors.transparent,
      AppButtonVariant.danger when pressed => const Color(0xFFB91C1C),
      AppButtonVariant.danger when hovered => const Color(0xFFDC2626),
      AppButtonVariant.danger => AppColors.danger,
    };
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
