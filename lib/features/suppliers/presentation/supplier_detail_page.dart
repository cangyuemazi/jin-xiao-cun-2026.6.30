import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../view_models/supplier_list_view_model.dart';
import '../widgets/supplier_type_badge.dart';

class SupplierDetailPage extends ConsumerWidget {
  const SupplierDetailPage({
    super.key,
    required this.supplierUuid,
    required this.onBack,
    required this.onEdit,
  });

  final String supplierUuid;
  final VoidCallback onBack;
  final ValueChanged<String> onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(supplierDetailProvider(supplierUuid));

    return detail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '厂家详情加载失败',
        description: error.toString(),
      ),
      data: (detail) {
        if (detail == null) {
          return const EmptyState(
            icon: Icons.factory_outlined,
            title: '厂家不存在',
            description: '这个厂家可能已经被删除。',
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: detail.supplierName,
                description: detail.specialtyProducts ?? '未填写擅长产品',
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
                      label: '编辑',
                      icon: Icons.edit_outlined,
                      onPressed: () => onEdit(detail.uuid),
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
                      label: '厂家类型',
                      child: SupplierTypeBadge(label: detail.supplierTypeLabel),
                    ),
                    _Info(label: '联系人', child: Text(detail.contactName ?? '-')),
                    _Info(label: '电话', child: Text(detail.phone ?? '-')),
                    _Info(label: '微信', child: Text(detail.wechat ?? '-')),
                    _Info(label: '邮箱', child: Text(detail.email ?? '-')),
                    _Info(
                      label: '擅长产品',
                      child: Text(detail.specialtyProducts ?? '-'),
                    ),
                    _Info(
                      label: '默认交期',
                      child: Text(
                        detail.defaultLeadDays == null
                            ? '-'
                            : '${detail.defaultLeadDays} 天',
                      ),
                    ),
                    _Info(label: '备注', child: Text(detail.remark ?? '-')),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
