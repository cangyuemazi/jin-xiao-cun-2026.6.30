import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_info_item.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/shipment_list_view_model.dart';

class ShipmentDetailPage extends ConsumerWidget {
  const ShipmentDetailPage({
    super.key,
    required this.shipmentUuid,
    required this.onBack,
    required this.onEdit,
  });

  final String shipmentUuid;
  final VoidCallback onBack;
  final ValueChanged<String> onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(shipmentDetailProvider(shipmentUuid));

    return detail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '发货详情加载失败',
        description: error.toString(),
      ),
      data: (detail) {
        if (detail == null) {
          return const EmptyState(
            icon: Icons.local_shipping_outlined,
            title: '发货单不存在',
            description: '这个发货单可能已经被删除。',
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPageHeader(
                title: detail.shipmentNo,
                subtitle: detail.orderNo == null
                    ? '未关联订单'
                    : '关联订单 ${detail.orderNo}',
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
                    AppInfoItem(label: '客户', value: detail.customerName),
                    AppInfoItem(label: '收货地址', value: detail.addressText),
                    AppInfoItem(label: '快递公司', value: detail.carrierLabel),
                    AppInfoItem(label: '快递单号', value: detail.trackingNo),
                    AppInfoItem(
                      label: '发货时间',
                      value: _formatDate(detail.shipDate),
                    ),
                    AppInfoItem(
                      label: '运费',
                      value: _formatMoney(detail.shippingFee),
                    ),
                    AppInfoItem(
                      label: '发货状态',
                      value: detail.shipmentStatusLabel,
                    ),
                    AppInfoItem(label: '备注', value: detail.remark),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SectionHeader(
                title: '发货明细',
                description: '共 ${detail.items.length} 项',
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTable<ShipmentDetailItemState>(
                rows: detail.items,
                emptyTitle: '暂无发货明细',
                columns: [
                  AppTableColumn<ShipmentDetailItemState>(
                    label: '产品',
                    width: 220,
                    cellBuilder: (row) => Text(row.productName),
                  ),
                  AppTableColumn<ShipmentDetailItemState>(
                    label: '订单明细 UUID',
                    width: 220,
                    cellBuilder: (row) => Text(row.orderItemUuid),
                  ),
                  AppTableColumn<ShipmentDetailItemState>(
                    label: '发货数量',
                    width: 120,
                    cellBuilder: (row) => Text(_formatQuantity(row)),
                  ),
                  AppTableColumn<ShipmentDetailItemState>(
                    label: '是否全部发货',
                    width: 130,
                    cellBuilder: (row) => row.isFullShipment
                        ? const StatusBadge(
                            label: '全部发货',
                            tone: StatusBadgeTone.success,
                            icon: Icons.check_circle_outline,
                          )
                        : const StatusBadge(
                            label: '部分发货',
                            tone: StatusBadgeTone.warning,
                            icon: Icons.call_split_outlined,
                          ),
                  ),
                  AppTableColumn<ShipmentDetailItemState>(
                    label: '备注',
                    width: 180,
                    cellBuilder: (row) => Text(row.remark ?? '-'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

String _formatDate(DateTime? value) {
  if (value == null) {
    return '-';
  }

  String two(int number) => number.toString().padLeft(2, '0');
  return '${value.year}-${two(value.month)}-${two(value.day)}';
}

String _formatMoney(int amount) {
  final yuan = amount ~/ 100;
  final fen = (amount % 100).toString().padLeft(2, '0');
  return '¥$yuan.$fen';
}

String _formatQuantity(ShipmentDetailItemState item) {
  if (item.isFullShipment) {
    return '全部';
  }

  final value = item.quantityValue;
  if (value == null) {
    return '-';
  }

  final quantity = value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toString();
  return item.quantityUnit == null || item.quantityUnit!.isEmpty
      ? quantity
      : '$quantity ${item.quantityUnit}';
}
