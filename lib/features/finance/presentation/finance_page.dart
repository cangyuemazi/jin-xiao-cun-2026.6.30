import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/finance_view_model.dart';
import '../widgets/expense_type_select.dart';
import '../widgets/finance_form_section.dart';
import '../widgets/finance_order_select.dart';
import '../widgets/finance_summary_cards.dart';
import '../widgets/finance_target_select.dart';

class FinancePage extends ConsumerWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(financeViewModelProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => EmptyState(
        icon: Icons.error_outline,
        title: '财务数据加载失败',
        description: error.toString(),
      ),
      data: (data) {
        if (data.orders.isEmpty) {
          return const EmptyState(
            icon: Icons.account_balance_wallet_outlined,
            title: '暂无订单',
            description: '创建订单后即可录入费用并查看利润。',
          );
        }

        final summary = data.summary ?? FinanceAmountSummaryState.empty();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: '费用、成本和利润',
                description: data.selectedOrderNo.isEmpty
                    ? '选择订单后录入费用'
                    : '当前订单 ${data.selectedOrderNo}',
                trailing: AppButton(
                  label: '刷新金额',
                  icon: Icons.refresh,
                  variant: AppButtonVariant.secondary,
                  onPressed: () => ref
                      .read(financeViewModelProvider.notifier)
                      .refreshAmounts(),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              AppFormSection(
                title: '订单选择',
                child: FinanceOrderSelect(
                  value: data.selectedOrderUuid,
                  options: data.orders,
                  onChanged: (value) => ref
                      .read(financeViewModelProvider.notifier)
                      .selectOrder(value),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              FinanceSummaryCards(summary: summary),
              if (summary.warnings.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final warning in summary.warnings)
                      StatusBadge(
                        label: warning,
                        tone: StatusBadgeTone.warning,
                        icon: Icons.warning_amber_outlined,
                      ),
                  ],
                ),
              ],
              if (data.errorMessage != null) ...[
                const SizedBox(height: AppSpacing.lg),
                StatusBadge(
                  label: data.errorMessage!,
                  tone: StatusBadgeTone.danger,
                  icon: Icons.error_outline,
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              AppFormSection(
                key: ValueKey(
                  '${data.selectedOrderUuid}-${data.form.expenseUuid ?? 'new'}',
                ),
                title: data.form.isEditing ? '编辑费用' : '新增费用',
                description: '费用金额以元输入，保存时按整数分写入数据库。',
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: FinanceTargetSelect(
                            value: data.form.targetKey,
                            options: data.targets,
                            onChanged: (value) => ref
                                .read(financeViewModelProvider.notifier)
                                .updateForm(targetKey: value),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: ExpenseTypeSelect(
                            value: data.form.expenseType,
                            options: data.expenseTypes,
                            onChanged: (value) => ref
                                .read(financeViewModelProvider.notifier)
                                .updateForm(expenseType: value),
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
                            initialValue: data.form.amountYuan,
                            label: '费用金额（元）',
                            keyboardType: TextInputType.number,
                            onChanged: (value) => ref
                                .read(financeViewModelProvider.notifier)
                                .updateForm(amountYuan: value),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: AppTextField(
                            initialValue: data.form.expenseDateText,
                            label: '费用日期',
                            hintText: 'YYYY-MM-DD',
                            onChanged: (value) => ref
                                .read(financeViewModelProvider.notifier)
                                .updateForm(expenseDateText: value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppTextField(
                      initialValue: data.form.remark,
                      label: '备注',
                      maxLines: 3,
                      onChanged: (value) => ref
                          .read(financeViewModelProvider.notifier)
                          .updateForm(remark: value),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (data.form.isEditing) ...[
                          AppButton(
                            label: '取消编辑',
                            icon: Icons.close,
                            variant: AppButtonVariant.secondary,
                            onPressed: () => ref
                                .read(financeViewModelProvider.notifier)
                                .cancelEdit(),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                        ],
                        AppButton(
                          label: data.form.isEditing ? '保存修改' : '保存费用',
                          icon: Icons.save_outlined,
                          onPressed: () => ref
                              .read(financeViewModelProvider.notifier)
                              .saveExpense(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SectionHeader(
                title: '费用明细',
                description: '共 ${data.expenses.length} 条费用',
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTable<FinanceExpenseRowState>(
                rows: data.expenses,
                emptyTitle: '暂无费用',
                emptyDescription: '录入订单费用后会显示在这里。',
                columns: [
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '关联对象',
                    width: 180,
                    cellBuilder: (row) => Text(row.relatedLabel),
                  ),
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '费用类型',
                    width: 120,
                    cellBuilder: (row) => StatusBadge(
                      label: row.expenseTypeLabel,
                      tone: StatusBadgeTone.info,
                    ),
                  ),
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '金额',
                    width: 100,
                    numeric: true,
                    cellBuilder: (row) => Text(_formatMoney(row.amount)),
                  ),
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '费用日期',
                    width: 110,
                    cellBuilder: (row) => Text(_formatDate(row.expenseDate)),
                  ),
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '备注',
                    width: 220,
                    cellBuilder: (row) => Text(row.remark ?? '-'),
                  ),
                  AppTableColumn<FinanceExpenseRowState>(
                    label: '操作',
                    width: 170,
                    cellBuilder: (row) => Wrap(
                      spacing: AppSpacing.xs,
                      children: [
                        AppButton(
                          label: '编辑',
                          icon: Icons.edit_outlined,
                          size: AppButtonSize.small,
                          variant: AppButtonVariant.ghost,
                          onPressed: () => ref
                              .read(financeViewModelProvider.notifier)
                              .startEdit(row),
                        ),
                        AppButton(
                          label: '删除',
                          icon: Icons.delete_outline,
                          size: AppButtonSize.small,
                          variant: AppButtonVariant.ghost,
                          onPressed: () =>
                              _confirmDelete(context, ref, row.uuid),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String expenseUuid,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '删除费用',
      content: const Text('确认删除这条费用？数据会被软删除，并重新计算订单成本和毛利。'),
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
        .read(financeViewModelProvider.notifier)
        .softDeleteExpense(expenseUuid);
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '-';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }

  String _formatMoney(int amount) {
    return '¥${FinanceViewModel.formatFenToYuan(amount)}';
  }
}
