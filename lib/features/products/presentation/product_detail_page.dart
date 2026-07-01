import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/product_list_view_model.dart';
import '../widgets/product_type_badge.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({
    super.key,
    required this.productUuid,
    required this.onBack,
    required this.onEdit,
  });

  final String productUuid;
  final VoidCallback onBack;
  final ValueChanged<String> onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(productDetailProvider(productUuid));

    return detail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '产品详情加载失败',
        description: error.toString(),
      ),
      data: (detail) {
        if (detail == null) {
          return const EmptyState(
            icon: Icons.category_outlined,
            title: '产品不存在',
            description: '这个产品可能已被删除。',
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: detail.productName,
                description: detail.productCode ?? '未填写货号',
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
                      label: '产品类型',
                      child: ProductTypeBadge(label: detail.productTypeLabel),
                    ),
                    _Info(
                      label: '材料体系',
                      child: Text(detail.materialCategory ?? '-'),
                    ),
                    _Info(
                      label: '规格',
                      child: Text(detail.specification ?? '-'),
                    ),
                    _Info(
                      label: '默认单位',
                      child: Text(detail.quantityUnit ?? '-'),
                    ),
                    _Info(
                      label: '默认厂家',
                      child: Text(detail.defaultSupplierUuid ?? '-'),
                    ),
                    _Info(
                      label: '定制产品',
                      child: _FlagBadge(value: detail.isCustomProduct),
                    ),
                    _Info(
                      label: '纳入库存',
                      child: _FlagBadge(value: detail.trackInventory),
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
