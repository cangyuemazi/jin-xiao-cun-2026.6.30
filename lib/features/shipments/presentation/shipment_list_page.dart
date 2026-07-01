import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../view_models/shipment_list_view_model.dart';
import '../widgets/shipment_status_badge.dart';

class ShipmentListPage extends ConsumerWidget {
  const ShipmentListPage({
    super.key,
    required this.onCreateShipment,
    required this.onEditShipment,
    required this.onOpenShipment,
  });

  final VoidCallback onCreateShipment;
  final ValueChanged<String> onEditShipment;
  final ValueChanged<String> onOpenShipment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shipmentListViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '发货单加载失败',
        description: error.toString(),
      ),
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: '发货列表',
              description: '共 ${data.shipments.length} 个发货单',
              trailing: AppButton(
                label: '新增发货',
                icon: Icons.local_shipping_outlined,
                onPressed: onCreateShipment,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            AppTable<ShipmentListRowState>(
              rows: data.shipments,
              emptyTitle: '暂无发货单',
              emptyDescription: '为订单创建发货单后会显示在这里。',
              onRowTap: (row) => onOpenShipment(row.uuid),
              columns: [
                AppTableColumn<ShipmentListRowState>(
                  label: '发货单号',
                  width: 150,
                  cellBuilder: (row) => Text(row.shipmentNo),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '关联订单',
                  width: 150,
                  cellBuilder: (row) => Text(row.orderNo ?? '-'),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '客户',
                  width: 130,
                  cellBuilder: (row) => Text(row.customerName ?? '-'),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '快递公司',
                  width: 100,
                  cellBuilder: (row) => Text(row.carrierLabel ?? '-'),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '快递单号',
                  width: 150,
                  cellBuilder: (row) => Text(row.trackingNo ?? '-'),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '发货时间',
                  width: 110,
                  cellBuilder: (row) => Text(_formatDate(row.shipDate)),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '运费',
                  width: 90,
                  numeric: true,
                  cellBuilder: (row) => Text(_formatMoney(row.shippingFee)),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '发货状态',
                  width: 130,
                  cellBuilder: (row) => ShipmentStatusBadge(
                    status: row.shipmentStatus,
                    label: row.shipmentStatusLabel,
                  ),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '明细',
                  width: 70,
                  cellBuilder: (row) => Text('${row.itemCount} 项'),
                ),
                AppTableColumn<ShipmentListRowState>(
                  label: '备注',
                  width: 160,
                  cellBuilder: (row) => Text(row.remark ?? '-'),
                ),
                AppTableColumn<ShipmentListRowState>(
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
                        onPressed: () => onOpenShipment(row.uuid),
                      ),
                      AppButton(
                        label: '编辑',
                        icon: Icons.edit_outlined,
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => onEditShipment(row.uuid),
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
    String shipmentUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除发货单',
      content: const Text('确认删除这个发货单？数据会被软删除，不会物理移除。'),
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
        .read(shipmentListViewModelProvider.notifier)
        .softDeleteShipment(shipmentUuid);
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
