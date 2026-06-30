import 'dart:io';

import 'package:path/path.dart' as p;

import '../../data/database/database_paths.dart';
import 'audit_log_service.dart';

class BackupResult {
  const BackupResult({required this.file, required this.message});

  final File file;
  final String message;
}

class BackupService {
  BackupService({AuditLogService? auditLogService})
    : _auditLogService = auditLogService;

  final AuditLogService? _auditLogService;

  Future<BackupResult> createManualBackup({
    String? operatorName,
    String? deviceId,
  }) {
    return createBackup(
      reason: 'manual_backup',
      operatorName: operatorName,
      deviceId: deviceId,
    );
  }

  Future<BackupResult> createBackup({
    String reason = 'backup',
    int keepLatest = 30,
    String? operatorName,
    String? deviceId,
  }) async {
    AppDatabasePaths.ensureRuntimeDirectories();

    final source = AppDatabasePaths.databaseFile;
    if (!source.existsSync()) {
      throw StateError('Database file does not exist: ${source.path}');
    }

    final target = File(
      p.join(
        _backupDirectory.path,
        'inventory_backup_${_timestamp(DateTime.now())}.db',
      ),
    );
    await source.copy(target.path);
    await pruneOldBackups(keepLatest: keepLatest);

    await _auditLogService?.recordCreate(
      entityType: 'backup',
      entityUuid: p.basename(target.path),
      newValue: {'path': target.path, 'reason': reason},
      operatorName: operatorName,
      deviceId: deviceId,
      remark: 'Create database backup',
    );

    return BackupResult(file: target, message: 'Backup created');
  }

  Future<BackupResult> restoreFromBackup(
    File backupFile, {
    String? operatorName,
    String? deviceId,
  }) async {
    if (!backupFile.existsSync()) {
      throw StateError('Backup file does not exist: ${backupFile.path}');
    }

    final preRestore = await createBackup(
      reason: 'before_restore',
      operatorName: operatorName,
      deviceId: deviceId,
    );
    await backupFile.copy(AppDatabasePaths.databaseFile.path);

    await _auditLogService?.recordUpdate(
      entityType: 'backup',
      entityUuid: p.basename(backupFile.path),
      oldValue: {'pre_restore_backup': preRestore.file.path},
      newValue: {'restored_from': backupFile.path},
      operatorName: operatorName,
      deviceId: deviceId,
      remark: 'Restore database backup',
    );

    return BackupResult(file: backupFile, message: 'Backup restored');
  }

  Future<int> pruneOldBackups({int keepLatest = 30}) async {
    if (!_backupDirectory.existsSync()) {
      return 0;
    }

    final backups =
        _backupDirectory
            .listSync()
            .whereType<File>()
            .where(
              (file) => p.basename(file.path).startsWith('inventory_backup_'),
            )
            .toList()
          ..sort(
            (left, right) =>
                right.lastModifiedSync().compareTo(left.lastModifiedSync()),
          );

    final staleBackups = backups.skip(keepLatest).toList();
    for (final backup in staleBackups) {
      await backup.delete();
    }

    return staleBackups.length;
  }

  Directory get _backupDirectory {
    return Directory(
      p.join(
        AppDatabasePaths.dataRootDirectory.path,
        AppDatabasePaths.backupDirectoryName,
      ),
    );
  }

  String _timestamp(DateTime value) {
    String two(int number) => number.toString().padLeft(2, '0');

    return '${value.year}${two(value.month)}${two(value.day)}_'
        '${two(value.hour)}${two(value.minute)}${two(value.second)}';
  }
}
