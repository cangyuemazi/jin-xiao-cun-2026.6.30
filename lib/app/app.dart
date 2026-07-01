import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/customers/presentation/customer_address_form_page.dart';
import '../features/customers/presentation/customer_detail_page.dart';
import '../features/customers/presentation/customer_form_page.dart';
import '../features/customers/presentation/customer_list_page.dart';
import '../features/customers/view_models/customer_list_view_model.dart';
import '../features/orders/presentation/order_detail_page.dart';
import '../features/orders/presentation/order_form_page.dart';
import '../features/orders/presentation/order_list_page.dart';
import '../features/orders/view_models/order_list_view_model.dart';
import '../shared/theme/app_spacing.dart';
import '../shared/theme/app_theme.dart';
import '../shared/layout/desktop_shell.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/empty_state.dart';

class JinXiaoCunApp extends StatelessWidget {
  const JinXiaoCunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JinXiaoCun 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const _DesktopWorkspacePage(),
    );
  }
}

class _DesktopWorkspacePage extends ConsumerStatefulWidget {
  const _DesktopWorkspacePage();

  @override
  ConsumerState<_DesktopWorkspacePage> createState() =>
      _DesktopWorkspacePageState();
}

class _DesktopWorkspacePageState extends ConsumerState<_DesktopWorkspacePage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return DesktopShell(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      title: _title,
      subtitle: _subtitle,
      searchHint: _searchHint,
      onSearchChanged: _onSearchChanged,
      actions: _actions(context),
      child: _child(context),
    );
  }

  String get _title {
    return switch (_selectedIndex) {
      1 => '订单',
      2 => '客户',
      _ => '模块占位',
    };
  }

  String? get _subtitle {
    return switch (_selectedIndex) {
      1 => '订单列表、录入、编辑和软删除',
      2 => '客户资料、联系方式和收货地址管理',
      _ => '该模块将在后续阶段逐步接入。',
    };
  }

  String? get _searchHint {
    return switch (_selectedIndex) {
      1 => '搜索订单号、客户或状态',
      2 => '搜索姓名、手机号或单位',
      _ => null,
    };
  }

  void Function(String)? get _onSearchChanged {
    return switch (_selectedIndex) {
      1 =>
        (keyword) => ref
            .read(orderListViewModelProvider.notifier)
            .setSearchKeyword(keyword),
      2 =>
        (keyword) => ref
            .read(customerListViewModelProvider.notifier)
            .setSearchKeyword(keyword),
      _ => null,
    };
  }

  List<Widget> _actions(BuildContext context) {
    return switch (_selectedIndex) {
      1 => [
        AppButton(
          label: '新增订单',
          icon: Icons.add,
          onPressed: () => _openOrderForm(context),
        ),
      ],
      2 => [
        AppButton(
          label: '新增客户',
          icon: Icons.person_add_alt_1_outlined,
          onPressed: () => _openCustomerForm(context),
        ),
      ],
      _ => const [],
    };
  }

  Widget _child(BuildContext context) {
    return switch (_selectedIndex) {
      1 => OrderListPage(
        onCreateOrder: () => _openOrderForm(context),
        onEditOrder: (orderUuid) => _openOrderForm(context, orderUuid),
        onOpenOrder: (orderUuid) => _openOrderDetail(context, orderUuid),
      ),
      2 => CustomerListPage(
        onCreateCustomer: () => _openCustomerForm(context),
        onEditCustomer: (customerUuid) =>
            _openCustomerForm(context, customerUuid),
        onOpenCustomer: (customerUuid) =>
            _openCustomerDetail(context, customerUuid),
      ),
      _ => const Padding(
        padding: EdgeInsets.all(AppSpacing.xxl),
        child: EmptyState(
          icon: Icons.widgets_outlined,
          title: '模块待开发',
          description: '当前阶段只接入订单和客户模块。',
        ),
      ),
    };
  }

  void _openOrderForm(BuildContext context, [String? orderUuid]) {
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

  void _openOrderDetail(BuildContext context, String orderUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => OrderDetailPage(
          orderUuid: orderUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEdit: (selectedOrderUuid) {
            Navigator.of(pageContext).pop();
            _openOrderForm(context, selectedOrderUuid);
          },
        ),
      ),
    );
  }

  void _openCustomerForm(BuildContext context, [String? customerUuid]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => CustomerFormPage(
          customerUuid: customerUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(customerListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }

  void _openCustomerDetail(BuildContext context, String customerUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => CustomerDetailPage(
          customerUuid: customerUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEditCustomer: (selectedCustomerUuid) {
            Navigator.of(pageContext).pop();
            _openCustomerForm(context, selectedCustomerUuid);
          },
          onAddAddress: (selectedCustomerUuid) =>
              _openCustomerAddressForm(pageContext, selectedCustomerUuid),
          onEditAddress: (selectedCustomerUuid, addressUuid) =>
              _openCustomerAddressForm(
                pageContext,
                selectedCustomerUuid,
                addressUuid,
              ),
        ),
      ),
    );
  }

  void _openCustomerAddressForm(
    BuildContext context,
    String customerUuid, [
    String? addressUuid,
  ]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => CustomerAddressFormPage(
          customerUuid: customerUuid,
          addressUuid: addressUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(customerListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }
}
