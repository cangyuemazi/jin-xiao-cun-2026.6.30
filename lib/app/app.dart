import 'package:flutter/material.dart';

import '../shared/theme/app_theme.dart';
import '../shared/layout/desktop_shell.dart';
import '../shared/theme/app_spacing.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/app_card.dart';
import '../shared/widgets/app_table.dart';
import '../shared/widgets/section_header.dart';
import '../shared/widgets/status_badge.dart';

class JinXiaoCunApp extends StatelessWidget {
  const JinXiaoCunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JinXiaoCun 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const _DesktopPreviewPage(),
    );
  }
}

class _DesktopPreviewPage extends StatelessWidget {
  const _DesktopPreviewPage();

  @override
  Widget build(BuildContext context) {
    return DesktopShell(
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      title: '首页',
      subtitle: '桌面布局与通用组件预览',
      searchHint: '搜索模块或记录',
      actions: [AppButton(label: '新建', icon: Icons.add, onPressed: null)],
      child: const _DashboardPlaceholder(),
    );
  }
}

class _DashboardPlaceholder extends StatelessWidget {
  const _DashboardPlaceholder();

  @override
  Widget build(BuildContext context) {
    final rows = const [
      _PreviewRow(area: '布局', component: 'DesktopShell', status: '已接入'),
      _PreviewRow(area: '导航', component: 'SideNavigation', status: '占位'),
      _PreviewRow(area: '工具栏', component: 'TopBar', status: '占位'),
      _PreviewRow(area: '表格', component: 'AppTable', status: '可复用'),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: '基础界面已就绪',
            description: '当前页面只用于展示通用组件和桌面布局，未接入任何业务数据。',
          ),
          const SizedBox(height: AppSpacing.xxl),
          const Row(
            children: [
              Expanded(
                child: _PreviewCard(
                  title: '统一主题',
                  description: '颜色、字体、间距、圆角和阴影集中管理。',
                  tone: StatusBadgeTone.success,
                  badge: 'Theme',
                ),
              ),
              SizedBox(width: AppSpacing.lg),
              Expanded(
                child: _PreviewCard(
                  title: '通用组件',
                  description: '按钮、输入框、表格、状态标签和空状态可复用。',
                  tone: StatusBadgeTone.info,
                  badge: 'Widgets',
                ),
              ),
              SizedBox(width: AppSpacing.lg),
              Expanded(
                child: _PreviewCard(
                  title: '桌面布局',
                  description: '左侧导航栏、顶部工具栏和内容区已经成型。',
                  tone: StatusBadgeTone.accent,
                  badge: 'Layout',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxl),
          AppTable<_PreviewRow>(
            rows: rows,
            columns: [
              AppTableColumn<_PreviewRow>(
                label: '区域',
                width: 120,
                cellBuilder: (row) => Text(row.area),
              ),
              AppTableColumn<_PreviewRow>(
                label: '组件',
                width: 220,
                cellBuilder: (row) => Text(row.component),
              ),
              AppTableColumn<_PreviewRow>(
                label: '状态',
                width: 120,
                cellBuilder: (row) => StatusBadge(label: row.status),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({
    required this.title,
    required this.description,
    required this.tone,
    required this.badge,
  });

  final String title;
  final String description;
  final StatusBadgeTone tone;
  final String badge;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatusBadge(label: badge, tone: tone),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Text(description, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _PreviewRow {
  const _PreviewRow({
    required this.area,
    required this.component,
    required this.status,
  });

  final String area;
  final String component;
  final String status;
}
