import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_info_item.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/empty_state.dart';
import '../view_models/supplier_list_view_model.dart';

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
              AppPageHeader(
                title: detail.supplierName,
                subtitle: detail.specialtyProducts,
                actions: [
                  AppButton(
                    label: '返回',
                    icon: Icons.arrow_back,
                    variant: AppButtonVariant.secondary,
                    onPressed: onBack,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: '编辑',
                    icon: Icons.edit_outlined,
                    onPressed: () => onEdit(detail.uuid),
                  ),
                ],
              ),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppInfoItem(label: '厂家类型', value: detail.supplierTypeLabel),
                    AppInfoItem(label: '联系人', value: detail.contactName),
                    AppInfoItem(label: '电话', value: detail.phone),
                    AppInfoItem(label: '微信', value: detail.wechat),
                    AppInfoItem(label: '邮箱', value: detail.email),
                    AppInfoItem(label: '擅长产品', value: detail.specialtyProducts),
                    AppInfoItem(
                      label: '默认交期',
                      value: detail.defaultLeadDays == null
                          ? null
                          : '${detail.defaultLeadDays} 天',
                    ),
                    AppInfoItem(label: '备注', value: detail.remark),
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
