import 'package:flutter/material.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/customer_detail_view_model.dart';

class CustomerAddressTable extends StatelessWidget {
  const CustomerAddressTable({
    super.key,
    required this.addresses,
    required this.onEdit,
    required this.onSetDefault,
    required this.onDelete,
  });

  final List<CustomerAddressRowState> addresses;
  final ValueChanged<String> onEdit;
  final ValueChanged<String> onSetDefault;
  final ValueChanged<String> onDelete;

  @override
  Widget build(BuildContext context) {
    return AppTable<CustomerAddressRowState>(
      rows: addresses,
      emptyTitle: '暂无收货地址',
      emptyDescription: '新增地址后会显示在这里。',
      columns: [
        AppTableColumn<CustomerAddressRowState>(
          label: '默认',
          width: 80,
          cellBuilder: (address) => address.isDefault
              ? const StatusBadge(label: '默认', tone: StatusBadgeTone.success)
              : const Text('-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '收件人',
          width: 120,
          cellBuilder: (address) => Text(address.recipientName ?? '-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '收件电话',
          width: 120,
          cellBuilder: (address) => Text(address.phone ?? '-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '省市区',
          width: 180,
          cellBuilder: (address) => Text(
            [
              address.province,
              address.city,
              address.district,
            ].whereType<String>().where((value) => value.isNotEmpty).join(' '),
          ),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '详细地址',
          width: 240,
          cellBuilder: (address) => Text(address.detailAddress ?? '-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '收件单位',
          width: 160,
          cellBuilder: (address) => Text(address.recipientCompany ?? '-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '备注',
          width: 160,
          cellBuilder: (address) => Text(address.remark ?? '-'),
        ),
        AppTableColumn<CustomerAddressRowState>(
          label: '操作',
          width: 260,
          cellBuilder: (address) => Wrap(
            spacing: AppSpacing.xs,
            children: [
              AppButton(
                label: '编辑',
                icon: Icons.edit_outlined,
                size: AppButtonSize.small,
                variant: AppButtonVariant.ghost,
                onPressed: () => onEdit(address.uuid),
              ),
              AppButton(
                label: '设为默认',
                icon: Icons.check_circle_outline,
                size: AppButtonSize.small,
                variant: AppButtonVariant.ghost,
                onPressed: address.isDefault
                    ? null
                    : () => onSetDefault(address.uuid),
              ),
              AppButton(
                label: '删除',
                icon: Icons.delete_outline,
                size: AppButtonSize.small,
                variant: AppButtonVariant.ghost,
                onPressed: () => onDelete(address.uuid),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
