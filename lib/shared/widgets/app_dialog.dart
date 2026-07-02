import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'app_button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    this.primaryAction,
    this.secondaryAction,
  });

  final String title;
  final Widget content;
  final AppDialogAction? primaryAction;
  final AppDialogAction? secondaryAction;

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    AppDialogAction? primaryAction,
    AppDialogAction? secondaryAction,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return AppDialog(
          title: title,
          content: content,
          primaryAction: primaryAction,
          secondaryAction: secondaryAction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: content,
      ),
      actionsPadding: const EdgeInsets.fromLTRB(
        AppSpacing.xxl,
        AppSpacing.md,
        AppSpacing.xxl,
        AppSpacing.xl,
      ),
      actions: [
        if (secondaryAction != null)
          AppButton(
            label: secondaryAction!.label,
            onPressed: secondaryAction!.onPressed,
            variant: AppButtonVariant.secondary,
          ),
        if (primaryAction != null)
          AppButton(
            label: primaryAction!.label,
            onPressed: primaryAction!.onPressed,
            variant: primaryAction!.isDanger
                ? AppButtonVariant.danger
                : AppButtonVariant.primary,
          ),
      ],
    );
  }
}

class AppDialogAction {
  const AppDialogAction({
    required this.label,
    required this.onPressed,
    this.isDanger = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isDanger;
}
