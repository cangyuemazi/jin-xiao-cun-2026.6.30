import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/order_form_view_model.dart';
import '../view_models/order_list_view_model.dart';
import '../widgets/order_fee_editor.dart';
import '../widgets/order_items_editor.dart';
import '../widgets/order_supplier_editor.dart';

class OrderFormPage extends ConsumerWidget {
  const OrderFormPage({
    super.key,
    this.orderUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String? orderUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = orderFormViewModelProvider(orderUuid);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '订单保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              AppPageHeader(
                title: state.isEditing ? '编辑订单' : '新增订单',
                actions: [
                  AppButton(
                    label: '取消',
                    icon: Icons.close,
                    variant: AppButtonVariant.secondary,
                    onPressed: onCancel,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  AppButton(
                    label: '保存订单',
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
              title: '订单基本信息',
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      initialValue: state.orderNo,
                      label: '订单号',
                      enabled: !state.isEditing,
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(orderNo: value),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppTextField(
                      initialValue: state.orderDateText,
                      label: '下单时间',
                      hintText: 'YYYY-MM-DD',
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(orderDateText: value),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppTextField(
                      initialValue: state.orderStatus,
                      label: '订单状态',
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(orderStatus: value),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '客户信息',
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      initialValue: state.customerUuid,
                      label: '客户 UUID',
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(customerUuid: value),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppTextField(
                      initialValue: state.paymentStatus,
                      label: '收款状态',
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(paymentStatus: value),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppTextField(
                      initialValue: state.invoiceStatus,
                      label: '开票状态',
                      onChanged: (value) => ref
                          .read(provider.notifier)
                          .updateBasic(invoiceStatus: value),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '产品明细',
              child: OrderItemsEditor(
                items: state.items,
                onAdd: () => ref.read(provider.notifier).addItem(),
                onRemove: (index) =>
                    ref.read(provider.notifier).removeItem(index),
                onChanged: (index, item) =>
                    ref.read(provider.notifier).updateItem(index, item),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '采购/厂家信息',
              child: OrderSupplierEditor(
                items: state.items,
                onChanged: (index, item) =>
                    ref.read(provider.notifier).updateItem(index, item),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '费用信息',
              child: OrderFeeEditor(
                items: state.items,
                onChanged: (index, item) =>
                    ref.read(provider.notifier).updateItem(index, item),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '发货信息',
              child: Row(
                children: const [
                  Expanded(
                    child: AppTextField(
                      initialValue: 'pending',
                      label: '发货状态',
                      enabled: false,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppTextField(
                      initialValue: '',
                      label: '快递单号',
                      enabled: false,
                    ),
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
                    ref.read(provider.notifier).updateBasic(remark: value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final savedUuid = await ref
        .read(orderFormViewModelProvider(orderUuid).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(orderListViewModelProvider);
    onSaved(savedUuid);
  }
}
