import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'empty_state.dart';

class AppTable<T> extends StatelessWidget {
  const AppTable({
    super.key,
    required this.columns,
    required this.rows,
    this.onRowTap,
    this.emptyTitle = '暂无数据',
    this.emptyDescription,
    this.isLoading = false,
    this.loadingRowCount = 5,
  });

  final List<AppTableColumn<T>> columns;
  final List<T> rows;
  final ValueChanged<T>? onRowTap;
  final String emptyTitle;
  final String? emptyDescription;
  final bool isLoading;
  final int loadingRowCount;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _LoadingTable(
        columns: columns,
        rowCount: loadingRowCount,
      );
    }

    if (rows.isEmpty) {
      return EmptyState(
        icon: Icons.table_rows_outlined,
        title: emptyTitle,
        description: emptyDescription,
      );
    }

    return ClipRRect(
      borderRadius: AppRadius.table,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: AppRadius.table,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 42,
            dataRowMinHeight: AppSpacing.tableRowHeight,
            dataRowMaxHeight: AppSpacing.tableRowHeight,
            horizontalMargin: AppSpacing.lg,
            columnSpacing: AppSpacing.xxl,
            showCheckboxColumn: false,
            headingRowColor:
                const WidgetStatePropertyAll(AppColors.surfaceAlt),
            columns: [
              for (final column in columns)
                DataColumn(
                  numeric: column.numeric,
                  label: _SizedCell(
                    width: column.width,
                    child: Text(
                      column.label,
                      style: AppTextStyles.tableHeader,
                    ),
                  ),
                ),
            ],
            rows: [
              for (var i = 0; i < rows.length; i++)
                DataRow(
                  onSelectChanged: onRowTap == null
                      ? null
                      : (_) => onRowTap!(rows[i]),
                  color: i.isEven
                      ? const WidgetStatePropertyAll(AppColors.surface)
                      : const WidgetStatePropertyAll(AppColors.surfaceAlt),
                  cells: [
                    for (final column in columns)
                      DataCell(
                        _SizedCell(
                          width: column.width,
                          child: DefaultTextStyle.merge(
                            style: AppTextStyles.tableCell,
                            overflow: TextOverflow.ellipsis,
                            child: column.cellBuilder(rows[i]),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingTable<T> extends StatelessWidget {
  const _LoadingTable({
    required this.columns,
    required this.rowCount,
  });

  final List<AppTableColumn<T>> columns;
  final int rowCount;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.table,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: AppRadius.table,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 42,
            dataRowMinHeight: AppSpacing.tableRowHeight,
            dataRowMaxHeight: AppSpacing.tableRowHeight,
            horizontalMargin: AppSpacing.lg,
            columnSpacing: AppSpacing.xxl,
            showCheckboxColumn: false,
            columns: [
              for (final column in columns)
                DataColumn(
                  numeric: column.numeric,
                  label: _SizedCell(
                    width: column.width,
                    child: Text(column.label, style: AppTextStyles.tableHeader),
                  ),
                ),
            ],
            rows: List.generate(rowCount, (index) {
              return DataRow(cells: [
                for (final column in columns)
                  DataCell(
                    _SizedCell(
                      width: column.width,
                      child: _ShimmerBlock(),
                    ),
                  ),
              ]);
            }),
          ),
        ),
      ),
    );
  }
}

class _ShimmerBlock extends StatelessWidget {
  const _ShimmerBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: AppRadius.borderXs,
      ),
    );
  }
}

class AppTableColumn<T> {
  const AppTableColumn({
    required this.label,
    required this.cellBuilder,
    this.width,
    this.numeric = false,
  });

  final String label;
  final Widget Function(T row) cellBuilder;
  final double? width;
  final bool numeric;
}

class _SizedCell extends StatelessWidget {
  const _SizedCell({required this.child, this.width});

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (width == null) return child;
    return SizedBox(width: width, child: child);
  }
}
