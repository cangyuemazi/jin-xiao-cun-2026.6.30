import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_dialog.dart';
import '../../../shared/widgets/app_table.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/status_badge.dart';
import '../view_models/backup_view_model.dart';
import '../view_models/export_view_model.dart';
import '../view_models/import_view_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(importViewModelProvider);

    return asyncState.when(
      loading: () =>
          _buildContent(context, ref, const ImportState(), isLoading: true),
      error: (error, stackTrace) => _buildContent(
        context,
        ref,
        const ImportState(),
        asyncError: error.toString(),
      ),
      data: (state) => _buildContent(context, ref, state),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    ImportState state, {
    bool isLoading = false,
    String? asyncError,
  }) {
    final preview = state.preview;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: '系统设置',
            description: 'Excel 订单导入、数据维护和后续系统参数集中放在这里。',
          ),
          const SizedBox(height: AppSpacing.xxl),
          const _ExportSection(),
          const SizedBox(height: AppSpacing.xxl),
          const _BackupSection(),
          const SizedBox(height: AppSpacing.xxl),
          _ImportControlCard(
            state: state,
            isLoading: isLoading,
            onPickFile: () =>
                ref.read(importViewModelProvider.notifier).pickExcelFile(),
            onConfirm: state.canConfirm && !isLoading
                ? () => _showConfirmDialog(context, ref, state)
                : null,
            onClear: isLoading
                ? null
                : () => ref.read(importViewModelProvider.notifier).clear(),
          ),
          if (asyncError != null || state.errorMessage != null) ...[
            const SizedBox(height: AppSpacing.lg),
            StatusBadge(
              label: asyncError ?? state.errorMessage!,
              tone: StatusBadgeTone.danger,
              icon: Icons.error_outline,
            ),
          ],
          if (state.result != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _ImportResultCard(result: state.result!),
          ],
          const SizedBox(height: AppSpacing.xxl),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (preview == null)
            EmptyState(
              icon: Icons.upload_file_outlined,
              title: '尚未选择 Excel',
              description: '选择订单 Excel 后会先生成预览和异常清单，确认后才写入数据库。',
              actionLabel: '选择 Excel',
              onAction: () =>
                  ref.read(importViewModelProvider.notifier).pickExcelFile(),
            )
          else ...[
            _ImportPreviewSummary(preview: preview),
            const SizedBox(height: AppSpacing.lg),
            AppTable<ImportPreviewRowState>(
              rows: preview.rows,
              emptyTitle: '没有可预览的行',
              emptyDescription: '请检查 Excel 首行字段是否符合当前导入模板。',
              columns: [
                AppTableColumn<ImportPreviewRowState>(
                  label: '行号',
                  width: 56,
                  numeric: true,
                  cellBuilder: (row) => Text('${row.rowNumber}'),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '订单号',
                  width: 132,
                  cellBuilder: (row) => Text(row.orderNo),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '产品名称',
                  width: 160,
                  cellBuilder: (row) => Text(row.productName),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '重量',
                  width: 88,
                  cellBuilder: (row) => Text(row.quantityText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '下单时间',
                  width: 108,
                  cellBuilder: (row) => Text(row.orderDateText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '成本',
                  width: 96,
                  numeric: true,
                  cellBuilder: (row) => Text(row.costAmountText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '销售金额',
                  width: 96,
                  numeric: true,
                  cellBuilder: (row) => Text(row.saleAmountText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '客户',
                  width: 160,
                  cellBuilder: (row) => Text(row.customerText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '厂家',
                  width: 140,
                  cellBuilder: (row) => Text(row.supplierText),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '快递单号',
                  width: 148,
                  cellBuilder: (row) => Text(row.trackingNo),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '状态',
                  width: 128,
                  cellBuilder: (row) => _RowImportBadge(row: row),
                ),
                AppTableColumn<ImportPreviewRowState>(
                  label: '异常',
                  width: 220,
                  cellBuilder: (row) => Text(row.issueSummary),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _IssueList(issues: preview.issues),
          ],
        ],
      ),
    );
  }

  Future<void> _showConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    ImportState state,
  ) async {
    final preview = state.preview;
    if (preview == null) {
      return;
    }

    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '确认导入订单',
      content: Text(
        '将导入 ${preview.importableRows} 行订单数据。'
        '阻断错误行不会写入，提示项会保留在预览和备注中。',
        style: AppTextStyles.body,
      ),
      primaryAction: AppDialogAction(
        label: '确认导入',
        onPressed: () => Navigator.of(context).pop(true),
      ),
      secondaryAction: AppDialogAction(
        label: '取消',
        onPressed: () => Navigator.of(context).pop(false),
      ),
    );

    if (confirmed == true) {
      await ref.read(importViewModelProvider.notifier).confirmImport();
    }
  }
}

class _BackupSection extends ConsumerWidget {
  const _BackupSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(backupViewModelProvider);

    return asyncState.when(
      loading: () => _BackupCard(
        state: const BackupState(),
        isLoading: true,
        onRefresh: null,
        onManualBackup: null,
        onRestore: null,
      ),
      error: (error, stackTrace) => _BackupCard(
        state: BackupState(errorMessage: error.toString()),
        onRefresh: () => ref.read(backupViewModelProvider.notifier).refresh(),
        onManualBackup: () =>
            ref.read(backupViewModelProvider.notifier).createManualBackup(),
        onRestore: (entry) => _confirmRestore(context, ref, entry),
      ),
      data: (state) => _BackupCard(
        state: state,
        onRefresh: () => ref.read(backupViewModelProvider.notifier).refresh(),
        onManualBackup: () =>
            ref.read(backupViewModelProvider.notifier).createManualBackup(),
        onRestore: (entry) => _confirmRestore(context, ref, entry),
      ),
    );
  }

  Future<void> _confirmRestore(
    BuildContext context,
    WidgetRef ref,
    BackupEntryState entry,
  ) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: '确认从备份恢复',
      content: Text(
        '恢复会用备份文件替换当前本地数据库。系统会先自动备份当前数据库，再执行恢复。\n\n'
        '备份文件：${entry.fileName}',
        style: AppTextStyles.body,
      ),
      primaryAction: AppDialogAction(
        label: '确认恢复',
        isDanger: true,
        onPressed: () => Navigator.of(context).pop(true),
      ),
      secondaryAction: AppDialogAction(
        label: '取消',
        onPressed: () => Navigator.of(context).pop(false),
      ),
    );

    if (confirmed == true) {
      await ref
          .read(backupViewModelProvider.notifier)
          .restoreBackup(entry.path);
    }
  }
}

class _BackupCard extends StatelessWidget {
  const _BackupCard({
    required this.state,
    required this.onRefresh,
    required this.onManualBackup,
    required this.onRestore,
    this.isLoading = false,
  });

  final BackupState state;
  final bool isLoading;
  final VoidCallback? onRefresh;
  final VoidCallback? onManualBackup;
  final ValueChanged<BackupEntryState>? onRestore;

  @override
  Widget build(BuildContext context) {
    final result = state.result;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: '本地数据库备份',
            description: '启动时每天自动备份一次；手动备份和恢复均由 Service 层处理。最近 30 个备份会自动保留。',
            trailing: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton(
                  label: '刷新列表',
                  icon: Icons.refresh,
                  variant: AppButtonVariant.secondary,
                  onPressed: isLoading ? null : onRefresh,
                ),
                AppButton(
                  label: '手动备份',
                  icon: Icons.backup_outlined,
                  isLoading: isLoading,
                  onPressed: isLoading ? null : onManualBackup,
                ),
              ],
            ),
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: AppSpacing.lg),
            StatusBadge(
              label: state.errorMessage!,
              tone: StatusBadgeTone.danger,
              icon: Icons.error_outline,
            ),
          ],
          if (result != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _BackupResultCard(result: result),
          ],
          const SizedBox(height: AppSpacing.xl),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else
            AppTable<BackupEntryState>(
              rows: state.backups,
              emptyTitle: '暂无备份',
              emptyDescription: '点击手动备份后会在这里显示本地备份文件。',
              columns: [
                AppTableColumn<BackupEntryState>(
                  label: '备份文件',
                  width: 260,
                  cellBuilder: (entry) => Text(entry.fileName),
                ),
                AppTableColumn<BackupEntryState>(
                  label: '类型',
                  width: 116,
                  cellBuilder: (entry) => StatusBadge(
                    label: entry.reasonLabel,
                    tone: entry.reasonLabel == '恢复前备份'
                        ? StatusBadgeTone.warning
                        : StatusBadgeTone.info,
                  ),
                ),
                AppTableColumn<BackupEntryState>(
                  label: '时间',
                  width: 150,
                  cellBuilder: (entry) => Text(entry.createdAtText),
                ),
                AppTableColumn<BackupEntryState>(
                  label: '大小',
                  width: 92,
                  cellBuilder: (entry) => Text(entry.sizeText),
                ),
                AppTableColumn<BackupEntryState>(
                  label: '路径',
                  width: 260,
                  cellBuilder: (entry) => Text(entry.path),
                ),
                AppTableColumn<BackupEntryState>(
                  label: '操作',
                  width: 128,
                  cellBuilder: (entry) => AppButton(
                    label: '恢复',
                    icon: Icons.restore,
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.danger,
                    onPressed: onRestore == null
                        ? null
                        : () => onRestore!(entry),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BackupResultCard extends StatelessWidget {
  const _BackupResultCard({required this.result});

  final BackupResultState result;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.infoSoft,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.infoSoft),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBadge(
              label: result.title,
              tone: StatusBadgeTone.info,
              icon: Icons.check_circle_outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(result.message, style: AppTextStyles.body),
            const SizedBox(height: AppSpacing.sm),
            Text(result.filePath, style: AppTextStyles.caption),
            const SizedBox(height: AppSpacing.xs),
            Text(result.createdAtText, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}

class _ExportSection extends ConsumerWidget {
  const _ExportSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(exportViewModelProvider);

    return asyncState.when(
      loading: () => _ExportCard(
        state: const ExportState(),
        isLoading: true,
        onKeywordChanged: (_) {},
        onExportFilteredDefault: null,
        onExportFilteredSelectedPath: null,
        onExportFullDefault: null,
        onExportFullSelectedPath: null,
      ),
      error: (error, stackTrace) => _ExportCard(
        state: ExportState(errorMessage: error.toString()),
        onKeywordChanged: (value) =>
            ref.read(exportViewModelProvider.notifier).updateKeyword(value),
        onExportFilteredDefault: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFilteredToDefault(),
        onExportFilteredSelectedPath: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFilteredToSelectedPath(),
        onExportFullDefault: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFullBackupToDefault(),
        onExportFullSelectedPath: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFullBackupToSelectedPath(),
      ),
      data: (state) => _ExportCard(
        state: state,
        onKeywordChanged: (value) =>
            ref.read(exportViewModelProvider.notifier).updateKeyword(value),
        onExportFilteredDefault: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFilteredToDefault(),
        onExportFilteredSelectedPath: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFilteredToSelectedPath(),
        onExportFullDefault: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFullBackupToDefault(),
        onExportFullSelectedPath: () => ref
            .read(exportViewModelProvider.notifier)
            .exportFullBackupToSelectedPath(),
      ),
    );
  }
}

class _ExportCard extends StatelessWidget {
  const _ExportCard({
    required this.state,
    required this.onKeywordChanged,
    required this.onExportFilteredDefault,
    required this.onExportFilteredSelectedPath,
    required this.onExportFullDefault,
    required this.onExportFullSelectedPath,
    this.isLoading = false,
  });

  final ExportState state;
  final bool isLoading;
  final ValueChanged<String> onKeywordChanged;
  final VoidCallback? onExportFilteredDefault;
  final VoidCallback? onExportFilteredSelectedPath;
  final VoidCallback? onExportFullDefault;
  final VoidCallback? onExportFullSelectedPath;

  @override
  Widget build(BuildContext context) {
    final result = state.result;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Excel 订单导出',
            description: '导出订单、产品明细、客户、厂家、发货和金额信息。',
          ),
          const SizedBox(height: AppSpacing.xl),
          AppTextField(
            key: ValueKey('export-keyword-${state.keyword}'),
            initialValue: state.keyword,
            label: '筛选关键词',
            hintText: '可输入订单号、客户 UUID、订单状态等',
            helperText: '留空时导出当前全部订单；完整备份式导出会忽略筛选关键词。',
            prefixIcon: const Icon(Icons.search),
            enabled: !isLoading,
            onChanged: onKeywordChanged,
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              AppButton(
                label: '导出筛选结果',
                icon: Icons.download_outlined,
                isLoading: isLoading,
                onPressed: isLoading ? null : onExportFilteredDefault,
              ),
              AppButton(
                label: '选择位置导出',
                icon: Icons.folder_open_outlined,
                variant: AppButtonVariant.secondary,
                onPressed: isLoading ? null : onExportFilteredSelectedPath,
              ),
              AppButton(
                label: '完整备份式导出',
                icon: Icons.archive_outlined,
                variant: AppButtonVariant.secondary,
                onPressed: isLoading ? null : onExportFullDefault,
              ),
              AppButton(
                label: '备份导出到指定位置',
                icon: Icons.save_as_outlined,
                variant: AppButtonVariant.ghost,
                onPressed: isLoading ? null : onExportFullSelectedPath,
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
          if (result != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _ExportResultCard(result: result),
          ],
        ],
      ),
    );
  }
}

class _ExportResultCard extends StatelessWidget {
  const _ExportResultCard({required this.result});

  final ExportResultState result;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.successSoft,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.successSoft),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusBadge(
              label: '导出完成',
              tone: StatusBadgeTone.success,
              icon: Icons.check_circle_outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                _SummaryMetric(label: '导出类型', value: result.modeLabel),
                _SummaryMetric(label: '订单数', value: '${result.orderCount}'),
                _SummaryMetric(label: '明细行', value: '${result.rowCount}'),
                _SummaryMetric(label: '导出时间', value: result.generatedAtText),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(result.filePath, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}

class _ImportControlCard extends StatelessWidget {
  const _ImportControlCard({
    required this.state,
    required this.isLoading,
    required this.onPickFile,
    required this.onConfirm,
    required this.onClear,
  });

  final ImportState state;
  final bool isLoading;
  final VoidCallback onPickFile;
  final VoidCallback? onConfirm;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final fileName = state.selectedFileName ?? '未选择文件';
    final filePath = state.selectedFilePath ?? '支持 .xlsx / .xlsm / .xls';

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Excel 订单导入',
            description: '解析后先生成预览，确认前不会写入现有数据。',
            trailing: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton(
                  label: '选择 Excel',
                  icon: Icons.folder_open_outlined,
                  variant: AppButtonVariant.secondary,
                  isLoading: isLoading,
                  onPressed: isLoading ? null : onPickFile,
                ),
                AppButton(
                  label: '确认导入',
                  icon: Icons.playlist_add_check_outlined,
                  onPressed: onConfirm,
                ),
                AppButton(
                  label: '清空',
                  icon: Icons.close,
                  variant: AppButtonVariant.ghost,
                  onPressed: onClear,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: AppRadius.input,
              border: Border.all(color: AppColors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  const Icon(
                    Icons.insert_drive_file_outlined,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fileName, style: AppTextStyles.bodyLarge),
                        const SizedBox(height: AppSpacing.xs),
                        Text(filePath, style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImportPreviewSummary extends StatelessWidget {
  const _ImportPreviewSummary({required this.preview});

  final ImportPreviewSummaryState preview;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _SummaryMetric(label: '总行数', value: '${preview.totalRows}'),
        _SummaryMetric(label: '可导入', value: '${preview.importableRows}'),
        _SummaryMetric(label: '提示行', value: '${preview.warningRows}'),
        _SummaryMetric(label: '阻断行', value: '${preview.blockedRows}'),
        _SummaryMetric(label: '异常项', value: '${preview.issueCount}'),
        _SummaryMetric(label: '工作表', value: preview.sheetName),
      ],
    );
  }
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.lg,
        ),
        child: SizedBox(
          width: 128,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              const SizedBox(height: AppSpacing.xs),
              Text(value, style: AppTextStyles.cardTitle),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowImportBadge extends StatelessWidget {
  const _RowImportBadge({required this.row});

  final ImportPreviewRowState row;

  @override
  Widget build(BuildContext context) {
    if (!row.canImport) {
      return const StatusBadge(label: '阻断', tone: StatusBadgeTone.danger);
    }

    if (row.hasIssues) {
      return const StatusBadge(label: '可导入', tone: StatusBadgeTone.warning);
    }

    return const StatusBadge(label: '正常', tone: StatusBadgeTone.success);
  }
}

class _IssueList extends StatelessWidget {
  const _IssueList({required this.issues});

  final List<ImportIssueState> issues;

  @override
  Widget build(BuildContext context) {
    if (issues.isEmpty) {
      return const StatusBadge(
        label: '未发现异常',
        tone: StatusBadgeTone.success,
        icon: Icons.check_circle_outline,
      );
    }

    return AppTable<ImportIssueState>(
      rows: issues,
      emptyTitle: '未发现异常',
      columns: [
        AppTableColumn<ImportIssueState>(
          label: '行号',
          width: 64,
          numeric: true,
          cellBuilder: (issue) => Text('${issue.rowNumber}'),
        ),
        AppTableColumn<ImportIssueState>(
          label: '字段',
          width: 120,
          cellBuilder: (issue) => Text(issue.field),
        ),
        AppTableColumn<ImportIssueState>(
          label: '级别',
          width: 92,
          cellBuilder: (issue) => StatusBadge(
            label: issue.isBlocking ? '阻断' : '提示',
            tone: issue.isBlocking
                ? StatusBadgeTone.danger
                : StatusBadgeTone.warning,
          ),
        ),
        AppTableColumn<ImportIssueState>(
          label: '说明',
          width: 360,
          cellBuilder: (issue) => Text(issue.message),
        ),
      ],
    );
  }
}

class _ImportResultCard extends StatelessWidget {
  const _ImportResultCard({required this.result});

  final ImportConfirmSummaryState result;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          const StatusBadge(
            label: '导入完成',
            tone: StatusBadgeTone.success,
            icon: Icons.check_circle_outline,
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Text(
              '总计 ${result.totalRows} 行，成功 ${result.importedRows} 行，'
              '跳过 ${result.skippedRows} 行，异常 ${result.issueCount} 项。',
              style: AppTextStyles.body,
            ),
          ),
        ],
      ),
    );
  }
}
