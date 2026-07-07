import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/supplier_form_view_model.dart';
import '../view_models/supplier_list_view_model.dart';
import '../widgets/supplier_type_select.dart';

class SupplierFormPage extends ConsumerWidget {
  const SupplierFormPage({
    super.key,
    this.supplierUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String? supplierUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = supplierFormViewModelProvider(supplierUuid);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '厂家保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: state.isEditing ? '编辑厂家' : '新增厂家',
              actions: [
                AppButton(
                  label: '取消',
                  icon: Icons.close,
                  variant: AppButtonVariant.secondary,
                  onPressed: onCancel,
                ),
                const SizedBox(width: AppSpacing.sm),
                AppButton(
                  label: '保存厂家',
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
            const SizedBox(height: AppSpacing.xxl),
            AppFormSection(
              title: '厂家基本信息',
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.supplierName,
                          label: '厂家名称',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(supplierName: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: SupplierTypeSelect(
                          value: state.supplierType,
                          options: state.supplierTypeOptions,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(supplierType: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.contactName,
                          label: '联系人',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(contactName: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.phone,
                          label: '电话',
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(phone: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.wechat,
                          label: '微信',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(wechat: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.email,
                          label: '邮箱',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(email: value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '采购与加工能力',
              child: Column(
                children: [
                  AppTextField(
                    initialValue: state.specialtyProducts,
                    label: '擅长产品',
                    hintText: '例如：合金靶材、金属颗粒、二次加工',
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(specialtyProducts: value),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    initialValue: state.defaultLeadDays,
                    label: '默认交期天数',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(defaultLeadDays: value),
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
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
        .read(supplierFormViewModelProvider(supplierUuid).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(supplierListViewModelProvider);
    ref.invalidate(supplierDetailProvider(savedUuid));
    onSaved(savedUuid);
  }
}
