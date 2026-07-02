import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/export_service.dart';

final exportViewModelProvider =
    AsyncNotifierProvider.autoDispose<ExportViewModel, ExportState>(
      ExportViewModel.new,
    );

class ExportState {
  const ExportState({this.keyword = '', this.result, this.errorMessage});

  final String keyword;
  final ExportResultState? result;
  final String? errorMessage;

  ExportState copyWith({
    String? keyword,
    ExportResultState? result,
    String? errorMessage,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return ExportState(
      keyword: keyword ?? this.keyword,
      result: clearResult ? null : result ?? this.result,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class ExportResultState {
  const ExportResultState({
    required this.filePath,
    required this.rowCount,
    required this.orderCount,
    required this.modeLabel,
    required this.generatedAtText,
  });

  final String filePath;
  final int rowCount;
  final int orderCount;
  final String modeLabel;
  final String generatedAtText;

  factory ExportResultState.fromResult(OrderExportResult result) {
    return ExportResultState(
      filePath: result.filePath,
      rowCount: result.rowCount,
      orderCount: result.orderCount,
      modeLabel: result.modeLabel,
      generatedAtText: _formatDateTime(result.generatedAt),
    );
  }
}

class ExportViewModel extends AsyncNotifier<ExportState> {
  @override
  Future<ExportState> build() async {
    return const ExportState();
  }

  void updateKeyword(String keyword) {
    final current = state.value ?? const ExportState();
    state = AsyncValue.data(
      current.copyWith(keyword: keyword, clearError: true),
    );
  }

  Future<void> exportToDefault({
    OrderExportMode mode = OrderExportMode.filtered,
  }) async {
    await _export(mode: mode);
  }

  Future<void> exportFilteredToDefault() {
    return exportToDefault();
  }

  Future<void> exportFullBackupToDefault() {
    return exportToDefault(mode: OrderExportMode.fullBackup);
  }

  Future<void> exportToSelectedPath({
    OrderExportMode mode = OrderExportMode.filtered,
  }) async {
    final current = state.value ?? const ExportState();
    final exportService = ref.read(exportServiceProvider);
    final outputPath = await FilePicker.platform.saveFile(
      dialogTitle: mode == OrderExportMode.fullBackup ? '保存完整订单导出' : '保存订单导出',
      fileName: exportService.defaultOrderExportFileName(mode: mode),
      initialDirectory: exportService.defaultOrderExportDirectoryPath(),
      type: FileType.custom,
      allowedExtensions: const ['xlsx'],
      lockParentWindow: true,
    );

    if (outputPath == null) {
      return;
    }

    state = AsyncValue.data(current.copyWith(clearError: true));
    await _export(mode: mode, outputPath: outputPath);
  }

  Future<void> exportFilteredToSelectedPath() {
    return exportToSelectedPath();
  }

  Future<void> exportFullBackupToSelectedPath() {
    return exportToSelectedPath(mode: OrderExportMode.fullBackup);
  }

  void clearResult() {
    final current = state.value ?? const ExportState();
    state = AsyncValue.data(current.copyWith(clearResult: true));
  }

  Future<void> _export({
    required OrderExportMode mode,
    String? outputPath,
  }) async {
    final current = state.value ?? const ExportState();
    final keyword = mode == OrderExportMode.fullBackup ? '' : current.keyword;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(exportServiceProvider)
          .exportOrders(mode: mode, keyword: keyword, outputPath: outputPath);

      return ExportState(
        keyword: current.keyword,
        result: ExportResultState.fromResult(result),
      );
    });
  }
}

String _formatDateTime(DateTime value) {
  String two(int number) => number.toString().padLeft(2, '0');
  return '${value.year}-${two(value.month)}-${two(value.day)} '
      '${two(value.hour)}:${two(value.minute)}:${two(value.second)}';
}
