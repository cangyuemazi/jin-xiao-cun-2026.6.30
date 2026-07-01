import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/supplier_repository.dart';
import 'audit_log_service.dart';
import 'dictionary_service.dart';

class SupplierTypeOption {
  const SupplierTypeOption({required this.key, required this.label});

  final String key;
  final String label;
}

class SupplierListEntry {
  const SupplierListEntry({
    required this.supplier,
    required this.supplierTypeLabel,
  });

  final Supplier supplier;
  final String supplierTypeLabel;
}

class SupplierDetail {
  const SupplierDetail({
    required this.supplier,
    required this.supplierTypeLabel,
  });

  final Supplier supplier;
  final String supplierTypeLabel;
}

class CreateSupplierInput {
  const CreateSupplierInput({
    this.uuid,
    required this.supplierName,
    this.contactName,
    this.phone,
    this.wechat,
    this.email,
    this.supplierType = 'manufacturer',
    this.specialtyProducts,
    this.defaultLeadDays,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String supplierName;
  final String? contactName;
  final String? phone;
  final String? wechat;
  final String? email;
  final String supplierType;
  final String? specialtyProducts;
  final int? defaultLeadDays;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class UpdateSupplierInput {
  const UpdateSupplierInput({
    required this.supplierName,
    this.contactName,
    this.phone,
    this.wechat,
    this.email,
    this.supplierType = 'manufacturer',
    this.specialtyProducts,
    this.defaultLeadDays,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String supplierName;
  final String? contactName;
  final String? phone;
  final String? wechat;
  final String? email;
  final String supplierType;
  final String? specialtyProducts;
  final int? defaultLeadDays;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class SupplierService {
  SupplierService({
    required SupplierRepository supplierRepository,
    required DictionaryService dictionaryService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _supplierRepository = supplierRepository,
       _dictionaryService = dictionaryService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  final SupplierRepository _supplierRepository;
  final DictionaryService _dictionaryService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<SupplierTypeOption>> listSupplierTypes() async {
    await _dictionaryService.initializeDefaultDictionaries();
    final dictionaries = await _dictionaryService.listEnabledByType(
      'supplier_type',
    );

    return dictionaries
        .map(
          (dictionary) => SupplierTypeOption(
            key: dictionary.dictKey,
            label: dictionary.dictLabel,
          ),
        )
        .toList();
  }

  Future<List<SupplierListEntry>> listSuppliers({
    String keyword = '',
    int limit = 50,
    int offset = 0,
  }) async {
    final suppliers = keyword.trim().isEmpty
        ? await _supplierRepository.list(limit: limit, offset: offset)
        : await _supplierRepository.search(
            keyword,
            limit: limit,
            offset: offset,
          );
    final labels = await _supplierTypeLabels();

    return [
      for (final supplier in suppliers)
        SupplierListEntry(
          supplier: supplier,
          supplierTypeLabel:
              labels[supplier.supplierType] ?? supplier.supplierType,
        ),
    ];
  }

  Future<SupplierDetail?> getSupplierDetail(String supplierUuid) async {
    final supplier = await _supplierRepository.getByUuid(supplierUuid);
    if (supplier == null) {
      return null;
    }

    final labels = await _supplierTypeLabels();
    return SupplierDetail(
      supplier: supplier,
      supplierTypeLabel: labels[supplier.supplierType] ?? supplier.supplierType,
    );
  }

  Future<Supplier?> createSupplier(CreateSupplierInput input) async {
    final supplierUuid = input.uuid ?? _uuid.v4();

    await _supplierRepository.create(
      SuppliersCompanion.insert(
        uuid: supplierUuid,
        supplierName: input.supplierName.trim(),
        supplierType: Value(_normalSupplierType(input.supplierType)),
        contactName: Value(_blankToNull(input.contactName)),
        phone: Value(_blankToNull(input.phone)),
        wechat: Value(_blankToNull(input.wechat)),
        email: Value(_blankToNull(input.email)),
        specialtyProducts: Value(_blankToNull(input.specialtyProducts)),
        defaultLeadDays: Value(_normalLeadDays(input.defaultLeadDays)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    await _auditLogService?.recordCreate(
      entityType: 'supplier',
      entityUuid: supplierUuid,
      newValue: {
        'supplier_name': input.supplierName.trim(),
        'supplier_type': input.supplierType,
      },
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create supplier',
    );

    return _supplierRepository.getByUuid(supplierUuid);
  }

  Future<bool> updateSupplier(
    String supplierUuid,
    UpdateSupplierInput input,
  ) async {
    final oldSupplier = await _supplierRepository.getByUuid(supplierUuid);
    final updated = await _supplierRepository.update(
      supplierUuid,
      SuppliersCompanion(
        supplierName: Value(input.supplierName.trim()),
        supplierType: Value(_normalSupplierType(input.supplierType)),
        contactName: Value(_blankToNull(input.contactName)),
        phone: Value(_blankToNull(input.phone)),
        wechat: Value(_blankToNull(input.wechat)),
        email: Value(_blankToNull(input.email)),
        specialtyProducts: Value(_blankToNull(input.specialtyProducts)),
        defaultLeadDays: Value(_normalLeadDays(input.defaultLeadDays)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'supplier',
        entityUuid: supplierUuid,
        oldValue: _supplierSnapshot(oldSupplier),
        newValue: _supplierInputSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update supplier',
      );
    }

    return updated;
  }

  Future<bool> softDeleteSupplier(
    String supplierUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldSupplier = await _supplierRepository.getByUuid(supplierUuid);
    final deleted = await _supplierRepository.softDelete(supplierUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'supplier',
        entityUuid: supplierUuid,
        oldValue: _supplierSnapshot(oldSupplier),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete supplier',
      );
    }

    return deleted;
  }

  Future<Map<String, String>> _supplierTypeLabels() async {
    final options = await listSupplierTypes();
    return {for (final option in options) option.key: option.label};
  }

  String _normalSupplierType(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'manufacturer' : trimmed;
  }

  int? _normalLeadDays(int? value) {
    if (value == null || value <= 0) {
      return null;
    }

    return value;
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Map<String, Object?>? _supplierSnapshot(Supplier? supplier) {
    if (supplier == null) {
      return null;
    }

    return {
      'uuid': supplier.uuid,
      'supplier_name': supplier.supplierName,
      'supplier_type': supplier.supplierType,
      'contact_name': supplier.contactName,
      'phone': supplier.phone,
      'wechat': supplier.wechat,
      'email': supplier.email,
      'specialty_products': supplier.specialtyProducts,
      'default_lead_days': supplier.defaultLeadDays,
      'remark': supplier.remark,
    };
  }

  Map<String, Object?> _supplierInputSnapshot(UpdateSupplierInput input) {
    return {
      'supplier_name': input.supplierName,
      'supplier_type': input.supplierType,
      'contact_name': input.contactName,
      'phone': input.phone,
      'wechat': input.wechat,
      'email': input.email,
      'specialty_products': input.specialtyProducts,
      'default_lead_days': input.defaultLeadDays,
      'remark': input.remark,
    };
  }
}
