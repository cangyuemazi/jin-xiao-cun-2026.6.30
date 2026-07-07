import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_shadows.dart';
import '../theme/app_spacing.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.cardPadding),
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.showBorder = true,
    this.showShadow = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final bool showBorder;
  final bool showShadow;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final interactive = widget.onTap != null;
    final highlight = interactive && _hovered;

    return MouseRegion(
      onEnter: (_) {
        if (interactive) setState(() => _hovered = true);
      },
      onExit: (_) {
        if (interactive) setState(() => _hovered = false);
      },
      cursor: interactive ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOutCubic,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: highlight ? AppColors.surfaceHover : AppColors.surfaceCard,
          borderRadius: AppRadius.card,
          border: widget.showBorder
              ? Border.all(
                  color: highlight
                      ? AppColors.borderStrong
                      : AppColors.hairline,
                )
              : null,
          boxShadow: widget.showShadow || highlight
              ? AppShadows.card
              : AppShadows.none,
        ),
        child: ClipRRect(
          borderRadius: AppRadius.card,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: AppRadius.card,
              splashColor: AppColors.overlay,
              hoverColor: Colors.transparent,
              highlightColor: AppColors.overlay,
              child: Padding(padding: widget.padding, child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}
