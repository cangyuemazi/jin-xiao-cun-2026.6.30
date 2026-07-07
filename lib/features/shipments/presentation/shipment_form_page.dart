import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../orders/view_models/order_list_view_model.dart';
import '../view_models/shipment_form_view_model.dart';
import '../view_models/shipment_list_view_model.dart';
import '../widgets/shipment_address_select.dart';
import '../widgets/shipment_carrier_select.dart';
import '../widgets/shipment_items_editor.dart';
import '../widgets/shipment_order_select.dart';

class ShipmentFormPage extends ConsumerWidget {
  const ShipmentFormPage({
    super.key,
    this.shipmentUuid,
    required this.onCancel,
    required this.onSaved,
  });

  final String? shipmentUuid;
  final VoidCallback onCancel;
  final ValueChanged<String> onSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = shipmentFormViewModelProvider(shipmentUuid);
    final formState = ref.watch(provider);

    return formState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '发货单保存失败',
        description: error.toString(),
      ),
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageHeader(
              title: state.isEditing ? '编辑发货单' : '新增发货单',
              actions: [
                AppButton(
                  label: '取消',
                  icon: Icons.close,
                  variant: AppButtonVariant.secondary,
                  onPressed: onCancel,
                ),
                AppButton(
                  label: '保存发货单',
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
              title: '发货基本信息',
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          initialValue: state.shipmentNo,
                          label: '发货单号',
                          enabled: !state.isEditing,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateBasic(shipmentNo: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: ShipmentOrderSelect(
                          value: state.orderUuid,
                          options: state.orderOptions,
                          enabled: !state.isEditing,
                          onChanged: (value) =>
                              ref.read(provider.notifier).selectOrder(value),
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
                          initialValue: state.customerName,
                          label: '客户',
                          enabled: false,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _addressField(
                          state,
                          (value) => ref
                              .read(provider.notifier)
                              .updateBasic(addressUuid: value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '快递信息',
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ShipmentCarrierSelect(
                          value: state.carrier,
                          options: state.carrierOptions,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateBasic(carrier: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.trackingNo,
                          label: '快递单号',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateBasic(trackingNo: value),
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
                          initialValue: state.shipDateText,
                          label: '发货时间',
                          hintText: 'YYYY-MM-DD',
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateBasic(shipDateText: value),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppTextField(
                          initialValue: state.shippingFeeYuan,
                          label: '运费（元）',
                          keyboardType: TextInputType.number,
                          onChanged: (value) => ref
                              .read(provider.notifier)
                              .updateBasic(shippingFeeYuan: value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppFormSection(
              title: '发货明细',
              child: ShipmentItemsEditor(
                items: state.items,
                readOnly: state.isEditing,
                onChanged: (index, item) => ref
                    .read(provider.notifier)
                    .updateItem(
                      index,
                      quantityValue: item.quantityValue,
                      quantityUnit: item.quantityUnit,
                      isSelected: item.isSelected,
                      isFullShipment: item.isFullShipment,
                      remark: item.remark,
                    ),
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

  Widget _addressField(
    ShipmentFormState state,
    ValueChanged<String> onChanged,
  ) {
    if (state.addressOptions.isEmpty) {
      return const AppTextField(
        initialValue: '',
        label: '收货地址',
        enabled: false,
      );
    }

    return ShipmentAddressSelect(
      value: state.addressUuid,
      options: state.addressOptions,
      onChanged: onChanged,
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final savedUuid = await ref
        .read(shipmentFormViewModelProvider(shipmentUuid).notifier)
        .save();
    if (savedUuid == null || !context.mounted) {
      return;
    }

    ref.invalidate(shipmentListViewModelProvider);
    ref.invalidate(shipmentDetailProvider(savedUuid));
    ref.invalidate(orderListViewModelProvider);
    onSaved(savedUuid);
  }
}
