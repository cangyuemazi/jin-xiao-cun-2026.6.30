import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/services/data_quality_service.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/order_list_view_model.dart';
import '../widgets/order_amount_text.dart';
import '../widgets/order_status_badge.dart';

class OrderListPage extends ConsumerWidget {
  const OrderListPage({
    super.key,
    required this.onCreateOrder,
    required this.onEditOrder,
    required this.onOpenOrder,
  });

  final VoidCallback onCreateOrder;
  final ValueChanged<String> onEditOrder;
  final ValueChanged<String> onOpenOrder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '订单加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: '订单列表',
              description: '共 ${data.orders.length} 条订单',
              trailing: Wrap(
                spacing: AppSpacing.sm,
                children: [
                  AppButton(
                    label: '异常订单',
                    icon: Icons.warning_amber_outlined,
                    variant: AppButtonVariant.secondary,
                    onPressed: () => ref
                        .read(orderListViewModelProvider.notifier)
                        .setQualityFilter(DataQualityService.allIssuesCode),
                  ),
                  AppButton(
                    label: '新增订单',
                    icon: Icons.add,
                    onPressed: onCreateOrder,
                  ),
                ],
              ),
            ),
            if (data.hasQualityFilter) ...[
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  StatusBadge(
                    label:
                        '异常筛选：${data.qualityFilterLabel ?? '异常订单'} · ${data.qualityIssueCount} 项',
                    tone: StatusBadgeTone.warning,
                  ),
                  AppButton(
                    label: '清除筛选',
                    icon: Icons.filter_alt_off,
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.ghost,
                    onPressed: () => ref
                        .read(orderListViewModelProvider.notifier)
                        .clearQualityFilter(),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSpacing.xxl),
            AppTable<OrderListRowState>(
              rows: data.orders,
              emptyTitle: data.hasQualityFilter ? '暂无异常订单' : '暂无订单',
              emptyDescription: data.hasQualityFilter
                  ? '当前异常筛选下暂无订单。'
                  : '新增订单后会显示在这里。',
              onRowTap: (row) => onOpenOrder(row.uuid),
              columns: [
                AppTableColumn<OrderListRowState>(
                  label: '订单号',
                  width: 132,
                  cellBuilder: (row) => Text(row.orderNo),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '客户',
                  width: 140,
                  cellBuilder: (row) => Text(row.customerName ?? '-'),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '产品数量',
                  width: 80,
                  numeric: true,
                  cellBuilder: (row) => Text('${row.productCount}'),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '下单时间',
                  width: 112,
                  cellBuilder: (row) => Text(_formatDate(row.orderDate)),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '发货状态',
                  width: 120,
                  cellBuilder: (row) => ShipmentStatusBadge(
                    status: row.shipmentStatus,
                    label: row.shipmentStatusLabel,
                  ),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '销售金额',
                  width: 100,
                  numeric: true,
                  cellBuilder: (row) => OrderAmountText(
                    amount: row.totalSaleAmount,
                    emphasized: true,
                  ),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '成本',
                  width: 100,
                  numeric: true,
                  cellBuilder: (row) =>
                      OrderAmountText(amount: row.totalCostAmount),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '毛利',
                  width: 100,
                  numeric: true,
                  cellBuilder: (row) =>
                      OrderAmountText(amount: row.totalProfitAmount),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '厂家',
                  width: 140,
                  cellBuilder: (row) => Text(
                    row.supplierNames.isEmpty
                        ? '-'
                        : row.supplierNames.join('、'),
                  ),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '快递单号',
                  width: 150,
                  cellBuilder: (row) => Text(
                    row.trackingNumbers.isEmpty
                        ? '-'
                        : row.trackingNumbers.join('、'),
                  ),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '订单状态',
                  width: 120,
                  cellBuilder: (row) => OrderStatusBadge(
                    status: row.orderStatus,
                    label: row.orderStatusLabel,
                  ),
                ),
                AppTableColumn<OrderListRowState>(
                  label: '操作',
                  width: 230,
                  cellBuilder: (row) => Wrap(
                    spacing: AppSpacing.xs,
                    children: [
                      AppButton(
                        label: '详情',
                        icon: Icons.open_in_new,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onOpenOrder(row.uuid),
                      ),
                      AppButton(
                        label: '编辑',
                        icon: Icons.edit_outlined,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onEditOrder(row.uuid),
                      ),
                      AppButton(
                        label: '删除',
                        icon: Icons.delete_outline,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => _confirmDelete(context, ref, row.uuid),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String orderUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除订单',
      content: const Text('确认删除这条订单？数据会被软删除，不会物理移除。'),
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
        .read(orderListViewModelProvider.notifier)
        .softDeleteOrder(orderUuid);
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '-';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }
}
