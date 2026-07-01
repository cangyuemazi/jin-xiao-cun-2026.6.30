import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/orders/presentation/order_detail_page.dart';
import '../features/orders/presentation/order_form_page.dart';
import '../features/orders/presentation/order_list_page.dart';
import '../features/orders/view_models/order_list_view_model.dart';
import '../shared/theme/app_theme.dart';
import '../shared/layout/desktop_shell.dart';
import '../shared/widgets/app_button.dart';

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

class _DesktopPreviewPage extends ConsumerWidget {
  const _DesktopPreviewPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DesktopShell(
      selectedIndex: 1,
      onDestinationSelected: (_) {},
      title: '订单',
      subtitle: '订单列表、录入、编辑和软删除',
      searchHint: '搜索订单号、客户或状态',
      onSearchChanged: (keyword) => ref
          .read(orderListViewModelProvider.notifier)
          .setSearchKeyword(keyword),
      actions: [
        AppButton(
          label: '新增订单',
          icon: Icons.add,
          onPressed: () => _openOrderForm(context, ref),
        ),
      ],
      child: OrderListPage(
        onCreateOrder: () => _openOrderForm(context, ref),
        onEditOrder: (orderUuid) => _openOrderForm(context, ref, orderUuid),
        onOpenOrder: (orderUuid) => _openOrderDetail(context, ref, orderUuid),
      ),
    );
  }

  void _openOrderForm(
    BuildContext context,
    WidgetRef ref, [
    String? orderUuid,
  ]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => OrderFormPage(
          orderUuid: orderUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(orderListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }

  void _openOrderDetail(BuildContext context, WidgetRef ref, String orderUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => OrderDetailPage(
          orderUuid: orderUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEdit: (selectedOrderUuid) {
            Navigator.of(pageContext).pop();
            _openOrderForm(context, ref, selectedOrderUuid);
          },
        ),
      ),
    );
  }
}

