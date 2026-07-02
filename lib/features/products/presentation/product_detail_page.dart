import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_info_item.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/empty_state.dart';
import '../view_models/product_list_view_model.dart';

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
              AppPageHeader(
                title: detail.productName,
                subtitle: detail.productCode ?? '未填写货号',
                actions: [
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
              const SizedBox(height: AppSpacing.md),
              AppCard(
                child: Column(
                  children: [
                    AppInfoItem(
                      label: '产品类型',
                      value: detail.productTypeLabel,
                    ),
                    AppInfoItem(
                      label: '材料体系',
                      value: detail.materialCategory,
                    ),
                    AppInfoItem(label: '规格', value: detail.specification),
                    AppInfoItem(label: '默认单位', value: detail.quantityUnit),
                    AppInfoItem(
                      label: '默认厂家',
                      value: detail.defaultSupplierUuid,
                    ),
                    AppInfoItem(
                      label: '定制产品',
                      value: detail.isCustomProduct ? '是' : '否',
                    ),
                    AppInfoItem(
                      label: '纳入库存',
                      value: detail.trackInventory ? '是' : '否',
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
