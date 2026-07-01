import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/import_service.dart';
import '../../customers/view_models/customer_list_view_model.dart';
import '../../dashboard/view_models/dashboard_view_model.dart';
import '../../finance/view_models/finance_view_model.dart';
import '../../orders/view_models/order_list_view_model.dart';
import '../../shipments/view_models/shipment_list_view_model.dart';
import '../../suppliers/view_models/supplier_list_view_model.dart';

final importViewModelProvider =
    AsyncNotifierProvider.autoDispose<ImportViewModel, ImportState>(
      ImportViewModel.new,
    );

class ImportState {
  const ImportState({
    this.selectedFilePath,
    this.selectedFileName,
    this.preview,
    this.result,
    this.errorMessage,
  });

  final String? selectedFilePath;
  final String? selectedFileName;
  final ImportPreviewSummaryState? preview;
  final ImportConfirmSummaryState? result;
  final String? errorMessage;

  bool get canConfirm => preview != null && preview!.importableRows > 0;
}

class ImportPreviewSummaryState {
  const ImportPreviewSummaryState({
    required this.fileName,
    required this.sheetName,
    required this.totalRows,
    required this.importableRows,
    required this.warningRows,
    required this.blockedRows,
    required this.issueCount,
    required this.rows,
    required this.issues,
  });

  final String fileName;
  final String sheetName;
  final int totalRows;
  final int importableRows;
  final int warningRows;
  final int blockedRows;
  final int issueCount;
  final List<ImportPreviewRowState> rows;
  final List<ImportIssueState> issues;

  factory ImportPreviewSummaryState.fromReport(ImportPreviewReport report) {
    final rowStates = report.rows.map(ImportPreviewRowState.fromRow).toList();
    return ImportPreviewSummaryState(
      fileName: report.fileName,
      sheetName: report.sheetName,
      totalRows: report.totalRows,
      importableRows: report.importableRows,
      warningRows: report.rows
          .where((row) => row.hasIssues && row.canImport)
          .length,
      blockedRows: report.rows.where((row) => !row.canImport).length,
      issueCount: report.issues.length,
      rows: rowStates,
      issues: report.issues.map(ImportIssueState.fromIssue).toList(),
    );
  }
}

class ImportPreviewRowState {
  const ImportPreviewRowState({
    required this.rowNumber,
    required this.orderNo,
    required this.productName,
    required this.quantityText,
    required this.orderDateText,
    required this.costAmountText,
    required this.saleAmountText,
    required this.customerText,
    required this.supplierText,
    required this.trackingNo,
    required this.issueSummary,
    required this.canImport,
    required this.hasIssues,
  });

  final int rowNumber;
  final String orderNo;
  final String productName;
  final String quantityText;
  final String orderDateText;
  final String costAmountText;
  final String saleAmountText;
  final String customerText;
  final String supplierText;
  final String trackingNo;
  final String issueSummary;
  final bool canImport;
  final bool hasIssues;

  factory ImportPreviewRowState.fromRow(ImportPreviewRow row) {
    final phone = row.customerPhone == null ? '' : ' ${row.customerPhone}';
    return ImportPreviewRowState(
      rowNumber: row.rowNumber,
      orderNo: row.orderNo,
      productName: _textOrDash(row.productNameSnapshot),
      quantityText: _quantityText(row),
      orderDateText: formatDate(row.orderDate),
      costAmountText: formatFenToYuan(row.costAmount),
      saleAmountText: formatFenToYuan(row.saleAmount),
      customerText: _textOrDash('${row.customerName}$phone'),
      supplierText: _textOrDash(row.supplierName),
      trackingNo: _textOrDash(row.trackingNo),
      issueSummary: row.issues.isEmpty
          ? '无'
          : row.issues.map((issue) => issue.message).join('；'),
      canImport: row.canImport,
      hasIssues: row.hasIssues,
    );
  }
}

class ImportIssueState {
  const ImportIssueState({
    required this.rowNumber,
    required this.field,
    required this.message,
    required this.isBlocking,
  });

  final int rowNumber;
  final String field;
  final String message;
  final bool isBlocking;

  factory ImportIssueState.fromIssue(ImportPreviewIssue issue) {
    return ImportIssueState(
      rowNumber: issue.rowNumber,
      field: issue.field,
      message: issue.message,
      isBlocking: _blockingIssueCodes.contains(issue.code),
    );
  }
}

class ImportConfirmSummaryState {
  const ImportConfirmSummaryState({
    required this.importUuid,
    required this.totalRows,
    required this.importedRows,
    required this.skippedRows,
    required this.issueCount,
  });

  final String importUuid;
  final int totalRows;
  final int importedRows;
  final int skippedRows;
  final int issueCount;

  factory ImportConfirmSummaryState.fromResult(ImportConfirmResult result) {
    return ImportConfirmSummaryState(
      importUuid: result.importUuid,
      totalRows: result.totalRows,
      importedRows: result.importedRows,
      skippedRows: result.skippedRows,
      issueCount: result.issues.length,
    );
  }
}

class ImportViewModel extends AsyncNotifier<ImportState> {
  ImportPreviewReport? _lastPreview;

  @override
  Future<ImportState> build() async {
    return const ImportState();
  }

  Future<void> pickExcelFile() async {
    final current = state.value ?? const ImportState();
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['xlsx', 'xlsm', 'xls'],
      allowMultiple: false,
      withData: false,
    );
    if (pickedFile == null) {
      return;
    }

    final file = pickedFile.files.single;
    final path = file.path;
    if (path == null) {
      state = AsyncValue.data(
        ImportState(
          selectedFileName: current.selectedFileName,
          selectedFilePath: current.selectedFilePath,
          preview: current.preview,
          result: current.result,
          errorMessage: '无法读取所选 Excel 文件路径。',
        ),
      );
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final preview = await ref
          .read(importServiceProvider)
          .previewOrderExcelFile(path);
      _lastPreview = preview;
      return ImportState(
        selectedFileName: file.name,
        selectedFilePath: path,
        preview: ImportPreviewSummaryState.fromReport(preview),
      );
    });
  }

  Future<void> confirmImport() async {
    final preview = _lastPreview;
    final current = state.value ?? const ImportState();
    if (preview == null) {
      state = AsyncValue.data(
        ImportState(
          selectedFileName: current.selectedFileName,
          selectedFilePath: current.selectedFilePath,
          preview: current.preview,
          result: current.result,
          errorMessage: '请先选择 Excel 并生成预览。',
        ),
      );
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(importServiceProvider)
          .confirmOrderImport(preview);
      ref.invalidate(orderListViewModelProvider);
      ref.invalidate(customerListViewModelProvider);
      ref.invalidate(supplierListViewModelProvider);
      ref.invalidate(shipmentListViewModelProvider);
      ref.invalidate(financeViewModelProvider);
      ref.invalidate(dashboardViewModelProvider);

      return ImportState(
        selectedFileName: current.selectedFileName,
        selectedFilePath: current.selectedFilePath,
        preview: current.preview,
        result: ImportConfirmSummaryState.fromResult(result),
      );
    });
  }

  void clear() {
    _lastPreview = null;
    state = const AsyncValue.data(ImportState());
  }
}

const _blockingIssueCodes = {
  'duplicate_order_no',
  'duplicate_tracking_no',
  'invalid_money',
  'invalid_date',
  'missing_product',
};

String formatFenToYuan(int? amount) {
  if (amount == null) {
    return '-';
  }

  final sign = amount < 0 ? '-' : '';
  final absolute = amount.abs();
  final yuan = absolute ~/ 100;
  final fen = (absolute % 100).toString().padLeft(2, '0');
  return '$sign$yuan.$fen';
}

String formatDate(DateTime? value) {
  if (value == null) {
    return '-';
  }

  String two(int number) => number.toString().padLeft(2, '0');
  return '${value.year}-${two(value.month)}-${two(value.day)}';
}

String _quantityText(ImportPreviewRow row) {
  if (row.quantityValue == null || row.quantityUnit == null) {
    return _textOrDash(row.quantityRaw);
  }

  final value = row.quantityValue!;
  final normalized = value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toString();
  return '$normalized ${row.quantityUnit}';
}

String _textOrDash(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? '-' : trimmed;
}
