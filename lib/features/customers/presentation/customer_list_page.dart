import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../view_models/customer_list_view_model.dart';
import '../widgets/customer_type_badge.dart';

class CustomerListPage extends ConsumerWidget {
  const CustomerListPage({
    super.key,
    required this.onCreateCustomer,
    required this.onEditCustomer,
    required this.onOpenCustomer,
  });

  final VoidCallback onCreateCustomer;
  final ValueChanged<String> onEditCustomer;
  final ValueChanged<String> onOpenCustomer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '客户加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: '客户列表',
              subtitle: '共 ${data.customers.length} 位客户',
              actions: [
                AppButton(
                  label: '新增客户',
                  icon: Icons.person_add_alt_1_outlined,
                  onPressed: onCreateCustomer,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTable<CustomerListRowState>(
              rows: data.customers,
              emptyTitle: '暂无客户',
              emptyDescription: '新增客户后会显示在这里。',
              onRowTap: (row) => onOpenCustomer(row.uuid),
              columns: [
                AppTableColumn<CustomerListRowState>(
                  label: '客户姓名',
                  width: 120,
                  cellBuilder: (row) => Text(row.customerName),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '手机号',
                  width: 120,
                  cellBuilder: (row) => Text(row.phone ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '单位/学校/公司',
                  width: 180,
                  cellBuilder: (row) => Text(row.companyName ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '部门',
                  width: 120,
                  cellBuilder: (row) => Text(row.department ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '客户类型',
                  width: 120,
                  cellBuilder: (row) =>
                      CustomerTypeBadge(customerType: row.customerType),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '微信',
                  width: 120,
                  cellBuilder: (row) => Text(row.wechat ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '邮箱',
                  width: 160,
                  cellBuilder: (row) => Text(row.email ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '默认地址',
                  width: 220,
                  cellBuilder: (row) => Text(row.defaultAddress ?? '-'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '地址数',
                  width: 80,
                  numeric: true,
                  cellBuilder: (row) => Text('${row.addressCount}'),
                ),
                AppTableColumn<CustomerListRowState>(
                  label: '操作',
                  width: 230,
                  cellBuilder: (row) => Wrap(
                    spacing: AppSpacing.xs,
                    children: [
                      AppButton(
                        label: '详情',
                        icon: Icons.open_in_new,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onOpenCustomer(row.uuid),
                      ),
                      AppButton(
                        label: '编辑',
                        icon: Icons.edit_outlined,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onEditCustomer(row.uuid),
                      ),
                      AppButton(
                        label: '删除',
                        icon: Icons.delete_outline,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => _confirmDelete(context, ref, row.uuid),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String customerUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除客户',
      content: const Text('确认删除这位客户？数据会被软删除，不会物理移除。'),
      secondaryAction: AppDialogAction(
        label: '取消',
        onPressed: () => Navigator.of(context).pop(false),
      ),
      primaryAction: AppDialogAction(
        label: '删除',
        isDanger: true,
        onPressed: () => Navigator.of(context).pop(true),
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    await ref
        .read(customerListViewModelProvider.notifier)
        .softDeleteCustomer(customerUuid);
  }
}
