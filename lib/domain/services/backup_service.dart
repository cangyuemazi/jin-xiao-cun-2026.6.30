import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/database/database_paths.dart';
import '../../data/repositories/audit_log_repository.dart';
import 'audit_log_service.dart';

class BackupResult {
  const BackupResult({
    required this.file,
    required this.message,
    required this.reason,
    required this.createdAt,
    this.prunedCount = 0,
  });

  final File file;
  final String message;
  final String reason;
  final DateTime createdAt;
  final int prunedCount;
}

class BackupEntry {
  const BackupEntry({
    required this.file,
    required this.fileName,
    required this.path,
    required this.createdAt,
    required this.sizeBytes,
    required this.reason,
  });

  final File file;
  final String fileName;
  final String path;
  final DateTime createdAt;
  final int sizeBytes;
  final String reason;
}

class RestoreResult {
  const RestoreResult({
    required this.restoredFrom,
    required this.preRestoreBackup,
    required this.restoredAt,
    required this.message,
  });

  final File restoredFrom;
  final File preRestoreBackup;
  final DateTime restoredAt;
  final String message;
}

class BackupService {
  BackupService({
    AppDatabase? database,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _database = database,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  final AppDatabase? _database;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

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

  Future<BackupResult?> ensureDailyLaunchBackup({
    int keepLatest = 30,
    String? operatorName,
    String? deviceId,
  }) async {
    AppDatabasePaths.ensureRuntimeDirectories();
    final today = DateTime.now();
    final hasLaunchBackupToday = (await listBackups()).any((entry) {
      return entry.reason == 'daily_launch' &&
          _isSameDate(entry.createdAt, today);
    });

    if (hasLaunchBackupToday) {
      return null;
    }

    return createBackup(
      reason: 'daily_launch',
      keepLatest: keepLatest,
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
    await _flushDatabase();

    final source = AppDatabasePaths.databaseFile;
    if (!await source.exists()) {
      throw StateError('数据库文件不存在：${source.path}');
    }

    final now = DateTime.now();
    final target = await _nextAvailableBackupFile(
      _backupFileName(reason: reason, createdAt: now),
    );

    await source.copy(target.path);
    final prunedCount = await pruneOldBackups(keepLatest: keepLatest);

    await _auditLogService?.recordCreate(
      entityType: 'backup',
      entityUuid: p.basename(target.path),
      newValue: {
        'path': target.path,
        'reason': reason,
        'size_bytes': await target.length(),
        'pruned_count': prunedCount,
      },
      operatorName: operatorName,
      deviceId: deviceId,
      remark: 'Create database backup',
    );

    return BackupResult(
      file: target,
      message: '数据库备份已创建。',
      reason: reason,
      createdAt: now,
      prunedCount: prunedCount,
    );
  }

  Future<RestoreResult> restoreFromBackup(
    File backupFile, {
    String? operatorName,
    String? deviceId,
  }) async {
    if (!await backupFile.exists()) {
      throw StateError('备份文件不存在：${backupFile.path}');
    }

    final preRestore = await createBackup(
      reason: 'before_restore',
      operatorName: operatorName,
      deviceId: deviceId,
    );

    final restoredAt = DateTime.now();
    await _database?.close();
    await _removeDatabaseSidecarFiles();
    await backupFile.copy(AppDatabasePaths.databaseFile.path);
    await _recordRestoreAuditInRestoredDatabase(
      restoredFrom: backupFile,
      preRestoreBackup: preRestore.file,
      restoredAt: restoredAt,
      operatorName: operatorName,
      deviceId: deviceId,
    );

    return RestoreResult(
      restoredFrom: backupFile,
      preRestoreBackup: preRestore.file,
      restoredAt: restoredAt,
      message: '数据库已从备份恢复。',
    );
  }

  Future<List<BackupEntry>> listBackups() async {
    AppDatabasePaths.ensureRuntimeDirectories();
    if (!await _backupDirectory.exists()) {
      return const [];
    }

    final entries = <BackupEntry>[];
    await for (final entity in _backupDirectory.list()) {
      if (entity is! File || !_isBackupFile(entity)) {
        continue;
      }

      final stat = await entity.stat();
      entries.add(
        BackupEntry(
          file: entity,
          fileName: p.basename(entity.path),
          path: entity.path,
          createdAt: stat.modified,
          sizeBytes: stat.size,
          reason: _reasonFromFileName(p.basename(entity.path)),
        ),
      );
    }

    entries.sort((left, right) => right.createdAt.compareTo(left.createdAt));
    return entries;
  }

  Future<int> pruneOldBackups({int keepLatest = 30}) async {
    if (!await _backupDirectory.exists()) {
      return 0;
    }

    final backups = (await listBackups()).map((entry) => entry.file).toList();

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

  Future<void> _flushDatabase() async {
    final database = _database;
    if (database == null) {
      return;
    }

    await database.customStatement('PRAGMA wal_checkpoint(TRUNCATE)');
  }

  Future<File> _nextAvailableBackupFile(String fileName) async {
    final backupDirectory = _backupDirectory;
    await backupDirectory.create(recursive: true);

    final basePath = p.join(backupDirectory.path, fileName);
    final first = File(basePath);
    if (!await first.exists()) {
      return first;
    }

    final basename = p.basenameWithoutExtension(fileName);
    final extension = p.extension(fileName);
    var index = 1;
    while (true) {
      final candidate = File(
        p.join(backupDirectory.path, '$basename-$index$extension'),
      );
      if (!await candidate.exists()) {
        return candidate;
      }
      index += 1;
    }
  }

  Future<void> _removeDatabaseSidecarFiles() async {
    final databasePath = AppDatabasePaths.databaseFile.path;
    for (final path in ['$databasePath-wal', '$databasePath-shm']) {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    }
  }

  Future<void> _recordRestoreAuditInRestoredDatabase({
    required File restoredFrom,
    required File preRestoreBackup,
    required DateTime restoredAt,
    String? operatorName,
    String? deviceId,
  }) async {
    final database = AppDatabase();
    try {
      final auditService = AuditLogService(
        auditLogRepository: AuditLogRepository(database),
        uuidGenerator: _uuid,
      );
      await auditService.recordUpdate(
        entityType: 'backup',
        entityUuid: p.basename(restoredFrom.path),
        oldValue: {'pre_restore_backup': preRestoreBackup.path},
        newValue: {
          'restored_from': restoredFrom.path,
          'restored_at': restoredAt,
        },
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Restore database backup',
      );
    } finally {
      await database.close();
    }
  }

  bool _isBackupFile(File file) {
    final fileName = p.basename(file.path);
    return fileName.startsWith('inventory_backup_') &&
        p.extension(fileName).toLowerCase() == '.db';
  }

  String _backupFileName({
    required String reason,
    required DateTime createdAt,
  }) {
    return 'inventory_backup_${_timestamp(createdAt)}_${_safeReason(reason)}.db';
  }

  String _reasonFromFileName(String fileName) {
    final withoutExtension = p.basenameWithoutExtension(fileName);
    final prefix = RegExp(r'^inventory_backup_\d{8}_\d{6}(?:_\d{3})?_?');
    final reason = withoutExtension.replaceFirst(prefix, '');
    return reason.isEmpty ? 'backup' : reason;
  }

  String _safeReason(String reason) {
    final normalized = reason.trim().isEmpty ? 'backup' : reason.trim();
    return normalized.replaceAll(RegExp(r'[^A-Za-z0-9_\-]+'), '_');
  }

  bool _isSameDate(DateTime left, DateTime right) {
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }

  String _timestamp(DateTime value) {
    String two(int number) => number.toString().padLeft(2, '0');
    String three(int number) => number.toString().padLeft(3, '0');

    return '${value.year}${two(value.month)}${two(value.day)}_'
        '${two(value.hour)}${two(value.minute)}${two(value.second)}_'
        '${three(value.millisecond)}';
  }
}
