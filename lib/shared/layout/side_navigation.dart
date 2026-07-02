import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.items = defaultItems,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<SideNavigationItem> items;

  static const List<SideNavigationItem> defaultItems = [
    SideNavigationItem(label: '首页', icon: Icons.dashboard_outlined),
    SideNavigationItem(label: '订单', icon: Icons.receipt_long_outlined),
    SideNavigationItem(label: '客户', icon: Icons.group_outlined),
    SideNavigationItem(label: '产品', icon: Icons.category_outlined),
    SideNavigationItem(label: '厂家', icon: Icons.factory_outlined),
    SideNavigationItem(label: '发货', icon: Icons.local_shipping_outlined),
    SideNavigationItem(label: '库存', icon: Icons.inventory_2_outlined),
    SideNavigationItem(label: '财务', icon: Icons.account_balance_wallet_outlined),
    SideNavigationItem(label: '设置', icon: Icons.settings_outlined),
  ];

  static const List<String> groupLabels = [
    '经营看板',
    '业务管理',
    '',
    '',
    '',
    '',
    '数据与系统',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> groupedItems = [];
    String? currentGroup;

    for (var i = 0; i < items.length; i++) {
      final groupLabel = i < groupLabels.length ? groupLabels[i] : '';
      if (groupLabel.isNotEmpty && groupLabel != currentGroup) {
        if (currentGroup != null) {
          groupedItems.add(const SizedBox(height: AppSpacing.lg));
        }
        currentGroup = groupLabel;
        groupedItems.add(
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.md,
              right: AppSpacing.md,
              bottom: AppSpacing.sm,
            ),
            child: Text(
              groupLabel,
              style: AppTextStyles.captionStrong.copyWith(
                letterSpacing: 0.5,
              ),
            ),
          ),
        );
      }

      groupedItems.add(
        _NavigationTile(
          item: items[i],
          selected: i == selectedIndex,
          onTap: () => onDestinationSelected(i),
        ),
      );
    }

    return Container(
      width: 240,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(right: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BrandHeader(),
              const SizedBox(height: AppSpacing.xxl),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: groupedItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideNavigationItem {
  const SideNavigationItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: AppRadius.borderMd,
          ),
          child: const Icon(
            Icons.science_outlined,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('JinXiaoCun', style: AppTextStyles.cardTitle.copyWith(
                letterSpacing: -0.2,
              )),
              Text('2026', style: AppTextStyles.caption.copyWith(
                color: AppColors.textMuted,
              )),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavigationTile extends StatefulWidget {
  const _NavigationTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final SideNavigationItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_NavigationTile> createState() => _NavigationTileState();
}

class _NavigationTileState extends State<_NavigationTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final foreground =
        widget.selected ? AppColors.primary : AppColors.textSecondary;
    final background = widget.selected
        ? AppColors.primarySoft
        : _hovered
            ? AppColors.surfaceMuted
            : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        margin: const EdgeInsets.only(bottom: AppSpacing.xxs),
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.borderMd,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: AppRadius.borderMd,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: AppRadius.borderMd,
            splashColor: AppColors.overlay,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm + 2,
              ),
              child: Row(
                children: [
                  Icon(
                    widget.item.icon,
                    size: 20,
                    color: foreground,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      widget.item.label,
                      style: AppTextStyles.bodyStrong.copyWith(
                        color: foreground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
