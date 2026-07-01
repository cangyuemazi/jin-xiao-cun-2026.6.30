import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/customers/presentation/customer_address_form_page.dart';
import '../features/customers/presentation/customer_detail_page.dart';
import '../features/customers/presentation/customer_form_page.dart';
import '../features/customers/presentation/customer_list_page.dart';
import '../features/customers/view_models/customer_list_view_model.dart';
import '../features/finance/presentation/finance_page.dart';
import '../features/finance/view_models/finance_view_model.dart';
import '../features/orders/presentation/order_detail_page.dart';
import '../features/orders/presentation/order_form_page.dart';
import '../features/orders/presentation/order_list_page.dart';
import '../features/orders/view_models/order_list_view_model.dart';
import '../features/products/presentation/product_detail_page.dart';
import '../features/products/presentation/product_form_page.dart';
import '../features/products/presentation/product_list_page.dart';
import '../features/products/view_models/product_list_view_model.dart';
import '../features/suppliers/presentation/supplier_detail_page.dart';
import '../features/suppliers/presentation/supplier_form_page.dart';
import '../features/suppliers/presentation/supplier_list_page.dart';
import '../features/suppliers/view_models/supplier_list_view_model.dart';
import '../features/shipments/presentation/shipment_detail_page.dart';
import '../features/shipments/presentation/shipment_form_page.dart';
import '../features/shipments/presentation/shipment_list_page.dart';
import '../features/shipments/view_models/shipment_list_view_model.dart';
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
  int _selectedIndex = 7;

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
    if (_selectedIndex == 7) {
      return '财务';
    }

    if (_selectedIndex == 5) {
      return '发货';
    }

    if (_selectedIndex == 4) {
      return '厂家';
    }

    return switch (_selectedIndex) {
      1 => '订单',
      2 => '客户',
      3 => '产品',
      _ => '模块占位',
    };
  }

  String? get _subtitle {
    if (_selectedIndex == 7) {
      return '费用录入、成本归集和订单利润分析';
    }

    if (_selectedIndex == 5) {
      return '发货单、快递单号和分批发货管理';
    }

    if (_selectedIndex == 4) {
      return '厂家资料、加工能力和默认交期管理';
    }

    return switch (_selectedIndex) {
      1 => '订单列表、录入、编辑和软删除',
      2 => '客户资料、联系方式和收货地址管理',
      3 => '产品资料、材料体系和默认配置管理',
      _ => '该模块将在后续阶段逐步接入。',
    };
  }

  String? get _searchHint {
    if (_selectedIndex == 7) {
      return '搜索订单号';
    }

    if (_selectedIndex == 5) {
      return '搜索发货单号、快递单号或订单';
    }

    if (_selectedIndex == 4) {
      return '搜索厂家名称、联系人或擅长产品';
    }

    return switch (_selectedIndex) {
      1 => '搜索订单号、客户或状态',
      2 => '搜索姓名、手机号或单位',
      3 => '搜索产品名称、货号或材料体系',
      _ => null,
    };
  }

  void Function(String)? get _onSearchChanged {
    if (_selectedIndex == 7) {
      return (keyword) =>
          ref.read(financeViewModelProvider.notifier).setSearchKeyword(keyword);
    }

    if (_selectedIndex == 5) {
      return (keyword) => ref
          .read(shipmentListViewModelProvider.notifier)
          .setSearchKeyword(keyword);
    }

    if (_selectedIndex == 4) {
      return (keyword) => ref
          .read(supplierListViewModelProvider.notifier)
          .setSearchKeyword(keyword);
    }

    return switch (_selectedIndex) {
      1 =>
        (keyword) => ref
            .read(orderListViewModelProvider.notifier)
            .setSearchKeyword(keyword),
      2 =>
        (keyword) => ref
            .read(customerListViewModelProvider.notifier)
            .setSearchKeyword(keyword),
      3 =>
        (keyword) => ref
            .read(productListViewModelProvider.notifier)
            .setSearchKeyword(keyword),
      _ => null,
    };
  }

  List<Widget> _actions(BuildContext context) {
    if (_selectedIndex == 7) {
      return [
        AppButton(
          label: '刷新金额',
          icon: Icons.refresh,
          variant: AppButtonVariant.secondary,
          onPressed: () =>
              ref.read(financeViewModelProvider.notifier).refreshAmounts(),
        ),
      ];
    }

    if (_selectedIndex == 5) {
      return [
        AppButton(
          label: '新增发货',
          icon: Icons.local_shipping_outlined,
          onPressed: () => _openShipmentForm(context),
        ),
      ];
    }

    if (_selectedIndex == 4) {
      return [
        AppButton(
          label: '新增厂家',
          icon: Icons.factory_outlined,
          onPressed: () => _openSupplierForm(context),
        ),
      ];
    }

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
      3 => [
        AppButton(
          label: '新增产品',
          icon: Icons.add_box_outlined,
          onPressed: () => _openProductForm(context),
        ),
      ],
      _ => const [],
    };
  }

  Widget _child(BuildContext context) {
    if (_selectedIndex == 7) {
      return const FinancePage();
    }

    if (_selectedIndex == 5) {
      return ShipmentListPage(
        onCreateShipment: () => _openShipmentForm(context),
        onEditShipment: (shipmentUuid) =>
            _openShipmentForm(context, shipmentUuid),
        onOpenShipment: (shipmentUuid) =>
            _openShipmentDetail(context, shipmentUuid),
      );
    }

    if (_selectedIndex == 4) {
      return SupplierListPage(
        onCreateSupplier: () => _openSupplierForm(context),
        onEditSupplier: (supplierUuid) =>
            _openSupplierForm(context, supplierUuid),
        onOpenSupplier: (supplierUuid) =>
            _openSupplierDetail(context, supplierUuid),
      );
    }

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
      3 => ProductListPage(
        onCreateProduct: () => _openProductForm(context),
        onEditProduct: (productUuid) => _openProductForm(context, productUuid),
        onOpenProduct: (productUuid) =>
            _openProductDetail(context, productUuid),
      ),
      _ => const Padding(
        padding: EdgeInsets.all(AppSpacing.xxl),
        child: EmptyState(
          icon: Icons.widgets_outlined,
          title: '模块待开发',
          description: '当前阶段只接入订单、客户和产品模块。',
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

  void _openProductForm(BuildContext context, [String? productUuid]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => ProductFormPage(
          productUuid: productUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(productListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }

  void _openProductDetail(BuildContext context, String productUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => ProductDetailPage(
          productUuid: productUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEdit: (selectedProductUuid) {
            Navigator.of(pageContext).pop();
            _openProductForm(context, selectedProductUuid);
          },
        ),
      ),
    );
  }

  void _openSupplierForm(BuildContext context, [String? supplierUuid]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => SupplierFormPage(
          supplierUuid: supplierUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(supplierListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }

  void _openSupplierDetail(BuildContext context, String supplierUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => SupplierDetailPage(
          supplierUuid: supplierUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEdit: (selectedSupplierUuid) {
            Navigator.of(pageContext).pop();
            _openSupplierForm(context, selectedSupplierUuid);
          },
        ),
      ),
    );
  }

  void _openShipmentForm(BuildContext context, [String? shipmentUuid]) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => ShipmentFormPage(
          shipmentUuid: shipmentUuid,
          onCancel: () => Navigator.of(pageContext).pop(),
          onSaved: (_) {
            ref.invalidate(shipmentListViewModelProvider);
            ref.invalidate(orderListViewModelProvider);
            Navigator.of(pageContext).pop();
          },
        ),
      ),
    );
  }

  void _openShipmentDetail(BuildContext context, String shipmentUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (pageContext) => ShipmentDetailPage(
          shipmentUuid: shipmentUuid,
          onBack: () => Navigator.of(pageContext).pop(),
          onEdit: (selectedShipmentUuid) {
            Navigator.of(pageContext).pop();
            _openShipmentForm(context, selectedShipmentUuid);
          },
        ),
      ),
    );
  }
}
