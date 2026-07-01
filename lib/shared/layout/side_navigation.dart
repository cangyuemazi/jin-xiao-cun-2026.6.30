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
    SideNavigationItem(
      label: '财务',
      icon: Icons.account_balance_wallet_outlined,
    ),
    SideNavigationItem(label: '设置', icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(right: BorderSide(color: AppColors.border)),
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
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.xs),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final selected = index == selectedIndex;

                    return _NavigationTile(
                      item: item,
                      selected: selected,
                      onTap: () => onDestinationSelected(index),
                    );
                  },
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
          width: AppSpacing.xxxl,
          height: AppSpacing.xxxl,
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: AppRadius.sm,
          ),
          child: const Icon(
            Icons.science_outlined,
            color: AppColors.primary,
            size: AppSpacing.xl,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('JinXiaoCun', style: AppTextStyles.cardTitle),
              Text('2026', style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final SideNavigationItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? AppColors.primary : AppColors.textSecondary;
    final background = selected ? AppColors.primarySoft : Colors.transparent;

    return Material(
      color: background,
      borderRadius: AppRadius.button,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.button,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(item.icon, size: AppSpacing.xl, color: foreground),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  item.label,
                  style: AppTextStyles.body.copyWith(
                    color: foreground,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
