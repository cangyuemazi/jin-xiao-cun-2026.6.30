import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import 'side_navigation.dart';
import 'top_bar.dart';

class DesktopShell extends StatelessWidget {
  const DesktopShell({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.title,
    required this.child,
    this.subtitle,
    this.actions = const [],
    this.searchHint,
    this.onSearchChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          SideNavigation(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          Expanded(
            child: Column(
              children: [
                TopBar(
                  title: title,
                  subtitle: subtitle,
                  actions: actions,
                  searchHint: searchHint,
                  onSearchChanged: onSearchChanged,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.pagePadding),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
