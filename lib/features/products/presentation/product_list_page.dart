import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/product_list_view_model.dart';
import '../widgets/product_type_badge.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({
    super.key,
    required this.onCreateProduct,
    required this.onEditProduct,
    required this.onOpenProduct,
  });

  final VoidCallback onCreateProduct;
  final ValueChanged<String> onEditProduct;
  final ValueChanged<String> onOpenProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '产品加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: '产品列表',
              subtitle: '共 ${data.products.length} 个产品',
              actions: [
                AppButton(
                  label: '新增产品',
                  icon: Icons.add_box_outlined,
                  onPressed: onCreateProduct,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            AppTable<ProductListRowState>(
              rows: data.products,
              emptyTitle: '暂无产品',
              emptyDescription: '新增产品后会显示在这里。',
              onRowTap: (row) => onOpenProduct(row.uuid),
              columns: [
                AppTableColumn<ProductListRowState>(
                  label: '货号',
                  width: 120,
                  cellBuilder: (row) => Text(row.productCode ?? '-'),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '产品名称',
                  width: 180,
                  cellBuilder: (row) => Text(row.productName),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '产品类型',
                  width: 130,
                  cellBuilder: (row) =>
                      ProductTypeBadge(label: row.productTypeLabel),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '材料体系',
                  width: 150,
                  cellBuilder: (row) => Text(row.materialCategory ?? '-'),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '规格',
                  width: 160,
                  cellBuilder: (row) => Text(row.specification ?? '-'),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '默认单位',
                  width: 90,
                  cellBuilder: (row) => Text(row.quantityUnit ?? '-'),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '默认厂家',
                  width: 150,
                  cellBuilder: (row) => Text(row.defaultSupplierUuid ?? '-'),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '定制',
                  width: 90,
                  cellBuilder: (row) => _FlagBadge(value: row.isCustomProduct),
                ),
                AppTableColumn<ProductListRowState>(
                  label: '库存',
                  width: 90,
                  cellBuilder: (row) => _FlagBadge(value: row.trackInventory),
                ),
                AppTableColumn<ProductListRowState>(
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
                        onPressed: () => onOpenProduct(row.uuid),
                      ),
                      AppButton(
                        label: '编辑',
                        icon: Icons.edit_outlined,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onEditProduct(row.uuid),
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
    String productUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除产品',
      content: const Text('确认删除这个产品？数据会被软删除，不会物理移除。'),
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
        .read(productListViewModelProvider.notifier)
        .softDeleteProduct(productUuid);
  }
}

class _FlagBadge extends StatelessWidget {
  const _FlagBadge({required this.value});

  final bool value;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(
      label: value ? '是' : '否',
      tone: value ? StatusBadgeTone.success : StatusBadgeTone.neutral,
    );
  }
}
