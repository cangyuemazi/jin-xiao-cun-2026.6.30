import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../customers/view_models/customer_list_view_model.dart';
import '../../dashboard/view_models/dashboard_view_model.dart';
import '../../finance/view_models/finance_view_model.dart';
import '../../orders/view_models/order_list_view_model.dart';
import '../../products/view_models/product_list_view_model.dart';
import '../../shipments/view_models/shipment_list_view_model.dart';
import '../../suppliers/view_models/supplier_list_view_model.dart';

final backupViewModelProvider =
    AsyncNotifierProvider.autoDispose<BackupViewModel, BackupState>(
      BackupViewModel.new,
    );

class BackupState {
  const BackupState({this.backups = const [], this.result, this.errorMessage});

  final List<BackupEntryState> backups;
  final BackupResultState? result;
  final String? errorMessage;

  BackupState copyWith({
    List<BackupEntryState>? backups,
    BackupResultState? result,
    String? errorMessage,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return BackupState(
      backups: backups ?? this.backups,
      result: clearResult ? null : result ?? this.result,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class BackupEntryState {
  const BackupEntryState({
    required this.fileName,
    required this.path,
    required this.createdAtText,
    required this.sizeText,
    required this.reasonLabel,
  });

  final String fileName;
  final String path;
  final String createdAtText;
  final String sizeText;
  final String reasonLabel;
}

class BackupResultState {
  const BackupResultState({
    required this.title,
    required this.message,
    required this.filePath,
    required this.createdAtText,
  });

  final String title;
  final String message;
  final String filePath;
  final String createdAtText;
}

class BackupViewModel extends AsyncNotifier<BackupState> {
  @override
  Future<BackupState> build() async {
    final backups = await _loadBackupEntries();
    return BackupState(backups: backups);
  }

  Future<void> refresh() async {
    final current = state.value ?? const BackupState();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return current.copyWith(
        backups: await _loadBackupEntries(),
        clearError: true,
      );
    });
  }

  Future<void> createManualBackup() async {
    final current = state.value ?? const BackupState();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(backupServiceProvider).createManualBackup();
      return current.copyWith(
        backups: await _loadBackupEntries(),
        result: BackupResultState(
          title: '手动备份完成',
          message: result.message,
          filePath: result.file.path,
          createdAtText: _formatDateTime(result.createdAt),
        ),
        clearError: true,
      );
    });
  }

  Future<void> restoreBackup(String filePath) async {
    final current = state.value ?? const BackupState();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(backupServiceProvider)
          .restoreFromBackup(File(filePath));
      _invalidateDataProvidersAfterRestore();
      return current.copyWith(
        backups: await _loadBackupEntries(),
        result: BackupResultState(
          title: '恢复完成',
          message:
              '${result.message} 恢复前已自动保存当前数据库：${result.preRestoreBackup.path}',
          filePath: result.restoredFrom.path,
          createdAtText: _formatDateTime(result.restoredAt),
        ),
        clearError: true,
      );
    });
  }

  Future<List<BackupEntryState>> _loadBackupEntries() async {
    final backups = await ref.read(backupServiceProvider).listBackups();
    return [
      for (final backup in backups)
        BackupEntryState(
          fileName: backup.fileName,
          path: backup.path,
          createdAtText: _formatDateTime(backup.createdAt),
          sizeText: _formatSize(backup.sizeBytes),
          reasonLabel: _reasonLabel(backup.reason),
        ),
    ];
  }

  void _invalidateDataProvidersAfterRestore() {
    ref.invalidate(appDatabaseProvider);
    ref.invalidate(orderListViewModelProvider);
    ref.invalidate(customerListViewModelProvider);
    ref.invalidate(productListViewModelProvider);
    ref.invalidate(supplierListViewModelProvider);
    ref.invalidate(shipmentListViewModelProvider);
    ref.invalidate(financeViewModelProvider);
    ref.invalidate(dashboardViewModelProvider);
  }
}

String _reasonLabel(String reason) {
  return switch (reason) {
    'manual_backup' => '手动备份',
    'daily_launch' => '启动自动备份',
    'before_restore' => '恢复前备份',
    'backup' => '备份',
    _ => reason,
  };
}

String _formatDateTime(DateTime value) {
  String two(int number) => number.toString().padLeft(2, '0');
  return '${value.year}-${two(value.month)}-${two(value.day)} '
      '${two(value.hour)}:${two(value.minute)}:${two(value.second)}';
}

String _formatSize(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  }

  final kb = bytes / 1024;
  if (kb < 1024) {
    return '${kb.toStringAsFixed(1)} KB';
  }

  final mb = kb / 1024;
  return '${mb.toStringAsFixed(2)} MB';
}
