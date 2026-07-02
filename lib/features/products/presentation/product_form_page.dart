import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/product_form_view_model.dart';
import '../view_models/product_list_view_model.dart';
import '../widgets/product_flags_editor.dart';
import '../widgets/product_type_select.dart';
import '../widgets/product_unit_input.dart';

class ProductFormPage extends ConsumerWidget {
  const ProductFormPage({
    super.key,
    this.productUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String? productUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = productFormViewModelProvider(productUuid);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '产品保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: state.isEditing ? '编辑产品' : '新增产品',
              actions: [
                AppButton(
                  label: '取消',
                  icon: Icons.close,
                  variant: AppButtonVariant.secondary,
                  onPressed: onCancel,
                ),
                AppButton(
                  label: '保存产品',
                  icon: Icons.save_outlined,
                  onPressed: () => _save(context, ref),
                ),
              ],
            ),
            if (state.errorMessage != null) ...[
              const SizedBox(height: AppSpacing.lg),
              StatusBadge(
                label: state.errorMessage!,
                tone: StatusBadgeTone.danger,
                icon: Icons.error_outline,
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            AppFormSection(
              title: '产品基本信息',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.productCode,
                          label: '产品编号/货号',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(productCode: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.productName,
                          label: '产品名称',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(productName: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ProductTypeSelect(
                    value: state.productType,
                    options: state.productTypeOptions,
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(productType: value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '材料与规格',
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.materialCategory,
                          label: '材料体系',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(materialCategory: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.specification,
                          label: '规格',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(specification: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ProductUnitInput(
                    value: state.quantityUnit,
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(quantityUnit: value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '默认配置',
              child: Column(
                children: [
                  AppTextField(
                    initialValue: state.defaultSupplierUuid,
                    label: '默认厂家',
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(defaultSupplierUuid: value),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ProductFlagsEditor(
                    isCustomProduct: state.isCustomProduct,
                    trackInventory: state.trackInventory,
                    onCustomProductChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(isCustomProduct: value),
                    onTrackInventoryChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(trackInventory: value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '备注',
              child: AppTextField(
                initialValue: state.remark,
                label: '备注',
                maxLines: 3,
                onChanged: (value) =>
                    ref.read(provider.notifier).updateFields(remark: value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final savedUuid = await ref
        .read(productFormViewModelProvider(productUuid).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(productListViewModelProvider);
    ref.invalidate(productDetailProvider(savedUuid));
    onSaved(savedUuid);
  }
}
