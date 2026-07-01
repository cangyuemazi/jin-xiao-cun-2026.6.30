import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../view_models/customer_detail_view_model.dart';
import '../view_models/customer_list_view_model.dart';
import '../widgets/customer_address_table.dart';
import '../widgets/customer_type_badge.dart';

class CustomerDetailPage extends ConsumerWidget {
  const CustomerDetailPage({
    super.key,
    required this.customerUuid,
    required this.onBack,
    required this.onEditCustomer,
    required this.onAddAddress,
    required this.onEditAddress,
  });

  final String customerUuid;
  final VoidCallback onBack;
  final ValueChanged<String> onEditCustomer;
  final ValueChanged<String> onAddAddress;
  final void Function(String customerUuid, String addressUuid) onEditAddress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(customerDetailViewModelProvider(customerUuid));

    return detail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '客户详情加载失败',
        description: error.toString(),
      ),
      data: (detail) {
        if (detail == null) {
          return const EmptyState(
            icon: Icons.person_off_outlined,
            title: '客户不存在',
            description: '这位客户可能已被删除。',
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: detail.customerName,
                description: detail.companyName ?? '未填写单位信息',
                trailing: Wrap(
                  spacing: AppSpacing.sm,
                  children: [
                    AppButton(
                      label: '返回',
                      icon: Icons.arrow_back,
                      variant: AppButtonVariant.secondary,
                      onPressed: onBack,
                    ),
                    AppButton(
                      label: '编辑客户',
                      icon: Icons.edit_outlined,
                      onPressed: () => onEditCustomer(detail.uuid),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              AppCard(
                child: Wrap(
                  spacing: AppSpacing.xxl,
                  runSpacing: AppSpacing.lg,
                  children: [
                    _Info(
                      label: '客户类型',
                      child: CustomerTypeBadge(
                        customerType: detail.customerType,
                      ),
                    ),
                    _Info(label: '手机号', child: Text(detail.phone ?? '-')),
                    _Info(label: '微信', child: Text(detail.wechat ?? '-')),
                    _Info(label: '邮箱', child: Text(detail.email ?? '-')),
                    _Info(
                      label: '单位/学校/公司',
                      child: Text(detail.companyName ?? '-'),
                    ),
                    _Info(label: '部门', child: Text(detail.department ?? '-')),
                    _Info(label: '备注', child: Text(detail.remark ?? '-')),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SectionHeader(
                title: '收货地址',
                description: '一个客户可以维护多个收货地址，并设置一个默认地址。',
                trailing: AppButton(
                  label: '新增地址',
                  icon: Icons.add_location_alt_outlined,
                  onPressed: () => onAddAddress(detail.uuid),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              CustomerAddressTable(
                addresses: detail.addresses,
                onEdit: (addressUuid) =>
                    onEditAddress(detail.uuid, addressUuid),
                onSetDefault: (addressUuid) =>
                    _setDefaultAddress(ref, detail.uuid, addressUuid),
                onDelete: (addressUuid) =>
                    _confirmDeleteAddress(context, ref, addressUuid),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SectionHeader(title: '历史订单'),
              const SizedBox(height: AppSpacing.md),
              AppCard(
                child: Row(
                  children: [
                    const Expanded(child: Text('历史订单入口已预留，订单筛选联动将在后续阶段接入。')),
                    AppButton(
                      label: '查看历史订单',
                      icon: Icons.receipt_long_outlined,
                      variant: AppButtonVariant.secondary,
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _setDefaultAddress(
    WidgetRef ref,
    String customerUuid,
    String addressUuid,
  ) async {
    await ref
        .read(customerDetailViewModelProvider(customerUuid).notifier)
        .setDefaultAddress(addressUuid);
    ref.invalidate(customerListViewModelProvider);
  }

  Future<void> _confirmDeleteAddress(
    BuildContext context,
    WidgetRef ref,
    String addressUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除地址',
      content: const Text('确认删除这条收货地址？数据会被软删除，不会物理移除。'),
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
        .read(customerDetailViewModelProvider(customerUuid).notifier)
        .softDeleteAddress(addressUuid);
    ref.invalidate(customerListViewModelProvider);
  }
}

class _Info extends StatelessWidget {
  const _Info({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: AppSpacing.xs),
          child,
        ],
      ),
    );
  }
}
