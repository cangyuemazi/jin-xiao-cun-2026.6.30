import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/dashboard_view_model.dart';
import '../widgets/dashboard_metric_card.dart';
import '../widgets/dashboard_todo_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '首页看板加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: '经营概览',
              description: '${data.monthLabel} 本地数据统计',
              trailing: AppButton(
                label: '刷新看板',
                icon: Icons.refresh,
                variant: AppButtonVariant.secondary,
                onPressed: () =>
                    ref.read(dashboardViewModelProvider.notifier).refresh(),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                DashboardMetricCard(
                  label: '本月订单数',
                  value: '${data.monthOrderCount}',
                  icon: Icons.receipt_long_outlined,
                  description: '按下单时间统计',
                  tone: DashboardMetricTone.info,
                ),
                DashboardMetricCard(
                  label: '本月销售额',
                  value: _money(data.monthSaleAmount),
                  icon: Icons.trending_up,
                  tone: DashboardMetricTone.success,
                ),
                DashboardMetricCard(
                  label: '本月成本',
                  value: _money(data.monthCostAmount),
                  icon: Icons.payments_outlined,
                  tone: DashboardMetricTone.neutral,
                ),
                DashboardMetricCard(
                  label: '本月毛利',
                  value: _money(data.monthProfitAmount),
                  icon: Icons.insights_outlined,
                  tone: data.monthProfitAmount < 0
                      ? DashboardMetricTone.danger
                      : DashboardMetricTone.success,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            SectionHeader(title: '待处理事项', description: '按订单当前数据自动识别'),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                DashboardTodoCard(
                  label: '待发货订单',
                  count: data.pendingShipmentOrderCount,
                  icon: Icons.local_shipping_outlined,
                  tone: DashboardTodoTone.info,
                ),
                DashboardTodoCard(
                  label: '未填成本订单',
                  count: data.missingCostOrderCount,
                  icon: Icons.price_change_outlined,
                  tone: DashboardTodoTone.warning,
                ),
                DashboardTodoCard(
                  label: '未填销售金额订单',
                  count: data.missingSaleAmountOrderCount,
                  icon: Icons.request_quote_outlined,
                  tone: DashboardTodoTone.warning,
                ),
                DashboardTodoCard(
                  label: '异常订单',
                  count: data.abnormalOrderCount,
                  icon: Icons.warning_amber_outlined,
                  tone: data.abnormalOrderCount > 0
                      ? DashboardTodoTone.danger
                      : DashboardTodoTone.neutral,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _RecentOrdersTable(rows: data.recentOrders)),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: _RecentShipmentsTable(rows: data.recentShipments),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _money(int amount) {
    return '¥${DashboardViewModel.formatFenToYuan(amount)}';
  }
}

class _RecentOrdersTable extends StatelessWidget {
  const _RecentOrdersTable({required this.rows});

  final List<DashboardRecentOrderState> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '最近订单', description: '按创建时间排序'),
        const SizedBox(height: AppSpacing.lg),
        AppTable<DashboardRecentOrderState>(
          rows: rows,
          emptyTitle: '暂无订单',
          columns: [
            AppTableColumn<DashboardRecentOrderState>(
              label: '订单号',
              width: 120,
              cellBuilder: (row) => Text(row.orderNo),
            ),
            AppTableColumn<DashboardRecentOrderState>(
              label: '客户',
              width: 120,
              cellBuilder: (row) => Text(row.customerName ?? '-'),
            ),
            AppTableColumn<DashboardRecentOrderState>(
              label: '下单时间',
              width: 100,
              cellBuilder: (row) =>
                  Text(DashboardViewModel.formatDate(row.orderDate)),
            ),
            AppTableColumn<DashboardRecentOrderState>(
              label: '销售额',
              width: 90,
              numeric: true,
              cellBuilder: (row) => Text(_money(row.totalSaleAmount)),
            ),
            AppTableColumn<DashboardRecentOrderState>(
              label: '毛利',
              width: 90,
              numeric: true,
              cellBuilder: (row) => Text(
                _money(row.totalProfitAmount),
                style: AppTextStyles.tableCell.copyWith(
                  color: row.totalProfitAmount < 0
                      ? AppColors.danger
                      : AppColors.textPrimary,
                ),
              ),
            ),
            AppTableColumn<DashboardRecentOrderState>(
              label: '状态',
              width: 110,
              cellBuilder: (row) => StatusBadge(
                label: row.orderStatusLabel,
                tone: _orderTone(row.orderStatus),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _money(int amount) {
    return '¥${DashboardViewModel.formatFenToYuan(amount)}';
  }

  StatusBadgeTone _orderTone(String status) {
    return switch (status) {
      'completed' || 'shipped' => StatusBadgeTone.success,
      'partial_shipped' ||
      'purchasing' ||
      'in_production' ||
      'ready_to_ship' => StatusBadgeTone.warning,
      'cancelled' || 'after_sales' => StatusBadgeTone.danger,
      'confirmed' => StatusBadgeTone.info,
      _ => StatusBadgeTone.neutral,
    };
  }
}

class _RecentShipmentsTable extends StatelessWidget {
  const _RecentShipmentsTable({required this.rows});

  final List<DashboardRecentShipmentState> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '最近发货', description: '按创建时间排序'),
        const SizedBox(height: AppSpacing.lg),
        AppTable<DashboardRecentShipmentState>(
          rows: rows,
          emptyTitle: '暂无发货',
          columns: [
            AppTableColumn<DashboardRecentShipmentState>(
              label: '发货单号',
              width: 120,
              cellBuilder: (row) => Text(row.shipmentNo),
            ),
            AppTableColumn<DashboardRecentShipmentState>(
              label: '订单',
              width: 120,
              cellBuilder: (row) => Text(row.orderNo ?? '-'),
            ),
            AppTableColumn<DashboardRecentShipmentState>(
              label: '客户',
              width: 110,
              cellBuilder: (row) => Text(row.customerName ?? '-'),
            ),
            AppTableColumn<DashboardRecentShipmentState>(
              label: '快递',
              width: 90,
              cellBuilder: (row) => Text(row.carrierLabel ?? '-'),
            ),
            AppTableColumn<DashboardRecentShipmentState>(
              label: '单号',
              width: 130,
              cellBuilder: (row) => Text(row.trackingNo ?? '-'),
            ),
            AppTableColumn<DashboardRecentShipmentState>(
              label: '状态',
              width: 110,
              cellBuilder: (row) => StatusBadge(
                label: row.shipmentStatusLabel,
                tone: _shipmentTone(row.shipmentStatus),
              ),
            ),
          ],
        ),
      ],
    );
  }

  StatusBadgeTone _shipmentTone(String status) {
    return switch (status) {
      'shipped' || 'completed' => StatusBadgeTone.success,
      'partial_shipped' => StatusBadgeTone.warning,
      'pending' => StatusBadgeTone.info,
      'cancelled' => StatusBadgeTone.danger,
      _ => StatusBadgeTone.neutral,
    };
  }
}
