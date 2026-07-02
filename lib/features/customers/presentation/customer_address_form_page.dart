import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/customer_address_form_view_model.dart';
import '../view_models/customer_detail_view_model.dart';
import '../view_models/customer_list_view_model.dart';

class CustomerAddressFormPage extends ConsumerWidget {
  const CustomerAddressFormPage({
    super.key,
    required this.customerUuid,
    this.addressUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String customerUuid;
  final String? addressUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = CustomerAddressFormArgs(
      customerUuid: customerUuid,
      addressUuid: addressUuid,
    );
    final provider = customerAddressFormViewModelProvider(args);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '地址保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: state.isEditing ? '编辑收货地址' : '新增收货地址',
              actions: [
                AppButton(
                  label: '取消',
                  icon: Icons.close,
                  variant: AppButtonVariant.secondary,
                  onPressed: onCancel,
                ),
                const SizedBox(width: AppSpacing.sm),
                AppButton(
                  label: '保存地址',
                  icon: Icons.save_outlined,
                  onPressed: () => _save(context, ref, args),
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
              title: '收件人信息',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.recipientName,
                          label: '收件人',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(recipientName: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.phone,
                          label: '收件电话',
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(phone: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    initialValue: state.recipientCompany,
                    label: '收件单位',
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(recipientCompany: value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '地址信息',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.province,
                          label: '省',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(province: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.city,
                          label: '市',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(city: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.district,
                          label: '区',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateFields(district: value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    initialValue: state.detailAddress,
                    label: '详细地址',
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(detailAddress: value),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _DefaultAddressToggle(
                    value: state.isDefault,
                    onChanged: (value) => ref
                        .read(provider.notifier)
                        .updateFields(isDefault: value ?? false),
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

  Future<void> _save(
    BuildContext context,
    WidgetRef ref,
    CustomerAddressFormArgs args,
  ) async {
    final savedUuid = await ref
        .read(customerAddressFormViewModelProvider(args).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(customerDetailViewModelProvider(customerUuid));
    ref.invalidate(customerListViewModelProvider);
    onSaved(savedUuid);
  }
}

class _DefaultAddressToggle extends StatelessWidget {
  const _DefaultAddressToggle({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: AppRadius.input,
        border: Border.all(color: AppColors.border),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: const Text('设为默认地址'),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
    );
  }
}
