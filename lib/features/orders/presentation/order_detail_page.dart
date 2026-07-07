import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_form_section.dart';
import '../../../shared/widgets/app_info_item.dart';
import '../../../shared/widgets/app_page_header.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../view_models/order_list_view_model.dart';
import '../widgets/order_status_badge.dart';

class OrderDetailPage extends ConsumerWidget {
  const OrderDetailPage({
    super.key,
    required this.orderUuid,
    required this.onBack,
    required this.onEdit,
  });

  final String orderUuid;
  final VoidCallback onBack;
  final ValueChanged<String> onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(orderDetailProvider(orderUuid));

    return detail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '订单详情加载失败',
        description: error.toString(),
      ),
      data: (detail) {
        if (detail == null) {
          return const EmptyState(
            icon: Icons.receipt_long_outlined,
            title: '订单不存在',
            description: '这条订单可能已被删除。',
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPageHeader(
                title: detail.orderNo,
                subtitle: detail.customerName ?? '未绑定客户',
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
              AppFormSection(
                title: '订单概览',
                child: Column(
                  children: [
                    AppInfoItem(label: '订单状态', value: detail.orderStatusLabel),
                    AppInfoItem(label: '订单号', value: detail.orderNo),
                    AppInfoItem(
                      label: '客户',
                      value: detail.customerName ?? '未绑定',
                    ),
                    AppInfoItem(
                      label: '下单时间',
                      value: _formatDate(detail.orderDate),
                    ),
                    AppInfoItem(
                      label: '销售金额',
                      value: _formatMoney(detail.totalSaleAmount),
                    ),
                    AppInfoItem(
                      label: '成本',
                      value: _formatMoney(detail.totalCostAmount),
                    ),
                    AppInfoItem(
                      label: '毛利',
                      value: _formatMoney(detail.totalProfitAmount),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppFormSection(
                title: '产品明细',
                child: AppTable<OrderDetailItemState>(
                  rows: detail.items,
                  emptyTitle: '暂无产品明细',
                  columns: [
                    AppTableColumn<OrderDetailItemState>(
                      label: '产品名称',
                      width: 180,
                      cellBuilder: (item) => Text(item.productName),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '货号',
                      width: 120,
                      cellBuilder: (item) => Text(item.productCode ?? '-'),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '规格',
                      width: 160,
                      cellBuilder: (item) => Text(item.specification ?? '-'),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '数量',
                      width: 100,
                      cellBuilder: (item) => Text(
                        '${item.quantityValue ?? '-'} ${item.quantityUnit ?? ''}',
                      ),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '销售金额',
                      width: 100,
                      cellBuilder: (item) =>
                          Text(_formatMoney(item.saleAmount)),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '成本',
                      width: 100,
                      cellBuilder: (item) =>
                          Text(_formatMoney(item.costAmount)),
                    ),
                    AppTableColumn<OrderDetailItemState>(
                      label: '厂家',
                      width: 160,
                      cellBuilder: (item) => Text(item.supplierName ?? '-'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppFormSection(
                title: '发货信息',
                child: AppTable<OrderShipmentState>(
                  rows: detail.shipments,
                  emptyTitle: '暂无发货记录',
                  columns: [
                    AppTableColumn<OrderShipmentState>(
                      label: '发货单号',
                      width: 140,
                      cellBuilder: (shipment) => Text(shipment.shipmentNo),
                    ),
                    AppTableColumn<OrderShipmentState>(
                      label: '快递公司',
                      width: 120,
                      cellBuilder: (shipment) => Text(shipment.carrier ?? '-'),
                    ),
                    AppTableColumn<OrderShipmentState>(
                      label: '快递单号',
                      width: 160,
                      cellBuilder: (shipment) =>
                          Text(shipment.trackingNo ?? '-'),
                    ),
                    AppTableColumn<OrderShipmentState>(
                      label: '发货状态',
                      width: 120,
                      cellBuilder: (shipment) => ShipmentStatusBadge(
                        status: shipment.shipmentStatus,
                        label: shipment.shipmentStatusLabel,
                      ),
                    ),
                    AppTableColumn<OrderShipmentState>(
                      label: '运费',
                      width: 100,
                      cellBuilder: (shipment) =>
                          Text(_formatMoney(shipment.shippingFee)),
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

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '-';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }

  String _formatMoney(int fen) {
    if (fen == 0) return '¥0.00';
    return '¥${(fen / 100).toStringAsFixed(2)}';
  }
}
