import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/customer_form_view_model.dart';
import '../view_models/customer_list_view_model.dart';

class CustomerFormPage extends ConsumerWidget {
  const CustomerFormPage({
    super.key,
    this.customerUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String? customerUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = customerFormViewModelProvider(customerUuid);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '客户保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: state.isEditing ? '编辑客户' : '新增客户',
              actions: [
                AppButton(
                  label: '取消',
                  icon: Icons.close,
                  variant: AppButtonVariant.secondary,
                  onPressed: onCancel,
                ),
                const SizedBox(width: AppSpacing.sm),
                AppButton(
                  label: '保存客户',
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
              title: '客户基本信息',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.customerName,
                          label: '客户姓名',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(customerName: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.customerType,
                          label: '客户类型',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(customerType: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.companyName,
                          label: '单位/学校/公司',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(companyName: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.department,
                          label: '部门',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(department: value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '联系方式',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.phone,
                          label: '手机号',
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(phone: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.wechat,
                          label: '微信',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(wechat: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    initialValue: state.email,
                    label: '邮箱',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) =>
                        ref.read(provider.notifier).updateFields(email: value),
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
        .read(customerFormViewModelProvider(customerUuid).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(customerListViewModelProvider);
    onSaved(savedUuid);
  }
}
