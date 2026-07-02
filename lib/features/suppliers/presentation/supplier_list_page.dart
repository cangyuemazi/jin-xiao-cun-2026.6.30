import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../view_models/supplier_list_view_model.dart';
import '../widgets/supplier_type_badge.dart';

class SupplierListPage extends ConsumerWidget {
  const SupplierListPage({
    super.key,
    required this.onCreateSupplier,
    required this.onEditSupplier,
    required this.onOpenSupplier,
  });

  final VoidCallback onCreateSupplier;
  final ValueChanged<String> onEditSupplier;
  final ValueChanged<String> onOpenSupplier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(supplierListViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '厂家加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: '厂家列表',
              subtitle: '共 ${data.suppliers.length} 个厂家/供应商',
              actions: [
                AppButton(
                  label: '新增厂家',
                  icon: Icons.factory_outlined,
                  onPressed: onCreateSupplier,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTable<SupplierListRowState>(
              rows: data.suppliers,
              emptyTitle: '暂无厂家',
              emptyDescription: '新增厂家后会显示在这里。',
              onRowTap: (row) => onOpenSupplier(row.uuid),
              columns: [
                AppTableColumn<SupplierListRowState>(
                  label: '厂家名称',
                  width: 180,
                  cellBuilder: (row) => Text(row.supplierName),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '厂家类型',
                  width: 130,
                  cellBuilder: (row) =>
                      SupplierTypeBadge(label: row.supplierTypeLabel),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '联系人',
                  width: 110,
                  cellBuilder: (row) => Text(row.contactName ?? '-'),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '电话',
                  width: 130,
                  cellBuilder: (row) => Text(row.phone ?? '-'),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '微信',
                  width: 120,
                  cellBuilder: (row) => Text(row.wechat ?? '-'),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '擅长产品',
                  width: 180,
                  cellBuilder: (row) => Text(row.specialtyProducts ?? '-'),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '默认交期',
                  width: 90,
                  cellBuilder: (row) => Text(
                    row.defaultLeadDays == null
                        ? '-'
                        : '${row.defaultLeadDays} 天',
                  ),
                ),
                AppTableColumn<SupplierListRowState>(
                  label: '备注',
                  width: 180,
                  cellBuilder: (row) => Text(row.remark ?? '-'),
                ),
                AppTableColumn<SupplierListRowState>(
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
                        onPressed: () => onOpenSupplier(row.uuid),
                      ),
                      AppButton(
                        label: '编辑',
                        icon: Icons.edit_outlined,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onEditSupplier(row.uuid),
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
    String supplierUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除厂家',
      content: const Text('确认删除这个厂家？数据会被软删除，不会物理移除。'),
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
        .read(supplierListViewModelProvider.notifier)
        .softDeleteSupplier(supplierUuid);
  }
}
