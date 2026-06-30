import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/audit_log_repository.dart';

class AuditLogService {
  AuditLogService({
    required AuditLogRepository auditLogRepository,
    Uuid? uuidGenerator,
  }) : _auditLogRepository = auditLogRepository,
       _uuid = uuidGenerator ?? const Uuid();

  final AuditLogRepository _auditLogRepository;
  final Uuid _uuid;

  Future<String> recordCreate({
    required String entityType,
    required String entityUuid,
    Map<String, Object?>? newValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    return _record(
      entityType: entityType,
      entityUuid: entityUuid,
      actionType: 'create',
      newValue: newValue,
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark,
    );
  }

  Future<String> recordUpdate({
    required String entityType,
    required String entityUuid,
    Map<String, Object?>? oldValue,
    Map<String, Object?>? newValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    return _record(
      entityType: entityType,
      entityUuid: entityUuid,
      actionType: 'update',
      oldValue: oldValue,
      newValue: newValue,
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark,
    );
  }

  Future<String> recordDelete({
    required String entityType,
    required String entityUuid,
    Map<String, Object?>? oldValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    return _record(
      entityType: entityType,
      entityUuid: entityUuid,
      actionType: 'delete',
      oldValue: oldValue,
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark,
    );
  }

  Future<String> recordImport({
    required String importUuid,
    Map<String, Object?>? newValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    return _record(
      entityType: 'import',
      entityUuid: importUuid,
      actionType: 'import',
      newValue: newValue,
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark,
    );
  }

  Future<String> recordExport({
    required String exportUuid,
    Map<String, Object?>? newValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    return _record(
      entityType: 'export',
      entityUuid: exportUuid,
      actionType: 'export',
      newValue: newValue,
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark,
    );
  }

  Future<String> _record({
    required String entityType,
    required String entityUuid,
    required String actionType,
    Map<String, Object?>? oldValue,
    Map<String, Object?>? newValue,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) async {
    final logUuid = _uuid.v4();
    final now = DateTime.now();

    await _auditLogRepository.create(
      AuditLogsCompanion.insert(
        uuid: logUuid,
        entityType: entityType,
        entityUuid: entityUuid,
        actionType: actionType,
        oldValue: Value(_encodeValue(oldValue)),
        newValue: Value(_encodeValue(newValue)),
        operatorName: Value(operatorName),
        operatedAt: Value(now),
        deviceId: Value(deviceId),
        remark: Value(remark),
      ),
    );

    return logUuid;
  }

  String? _encodeValue(Map<String, Object?>? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return jsonEncode(_jsonSafe(value));
  }

  Object? _jsonSafe(Object? value) {
    if (value is DateTime) {
      return value.toIso8601String();
    }

    if (value is Map) {
      return value.map((key, child) => MapEntry('$key', _jsonSafe(child)));
    }

    if (value is Iterable) {
      return value.map(_jsonSafe).toList();
    }

    return value;
  }
}
