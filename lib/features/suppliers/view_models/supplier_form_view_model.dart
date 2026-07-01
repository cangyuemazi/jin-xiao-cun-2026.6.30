import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/supplier_service.dart';

final supplierFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<SupplierFormViewModel, SupplierFormState, String?>(
      SupplierFormViewModel.new,
    );

class SupplierTypeOptionState {
  const SupplierTypeOptionState({required this.key, required this.label});

  final String key;
  final String label;

  factory SupplierTypeOptionState.fromOption(SupplierTypeOption option) {
    return SupplierTypeOptionState(key: option.key, label: option.label);
  }
}

class SupplierFormState {
  const SupplierFormState({
    this.supplierUuid,
    this.supplierName = '',
    this.contactName = '',
    this.phone = '',
    this.wechat = '',
    this.email = '',
    this.supplierType = 'manufacturer',
    this.specialtyProducts = '',
    this.defaultLeadDays = '',
    this.remark = '',
    this.supplierTypeOptions = const [],
    this.errorMessage,
  });

  final String? supplierUuid;
  final String supplierName;
  final String contactName;
  final String phone;
  final String wechat;
  final String email;
  final String supplierType;
  final String specialtyProducts;
  final String defaultLeadDays;
  final String remark;
  final List<SupplierTypeOptionState> supplierTypeOptions;
  final String? errorMessage;

  bool get isEditing => supplierUuid != null;

  SupplierFormState copyWith({
    String? supplierUuid,
    String? supplierName,
    String? contactName,
    String? phone,
    String? wechat,
    String? email,
    String? supplierType,
    String? specialtyProducts,
    String? defaultLeadDays,
    String? remark,
    List<SupplierTypeOptionState>? supplierTypeOptions,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SupplierFormState(
      supplierUuid: supplierUuid ?? this.supplierUuid,
      supplierName: supplierName ?? this.supplierName,
      contactName: contactName ?? this.contactName,
      phone: phone ?? this.phone,
      wechat: wechat ?? this.wechat,
      email: email ?? this.email,
      supplierType: supplierType ?? this.supplierType,
      specialtyProducts: specialtyProducts ?? this.specialtyProducts,
      defaultLeadDays: defaultLeadDays ?? this.defaultLeadDays,
      remark: remark ?? this.remark,
      supplierTypeOptions: supplierTypeOptions ?? this.supplierTypeOptions,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class SupplierFormViewModel extends AsyncNotifier<SupplierFormState> {
  SupplierFormViewModel(this.supplierUuid);

  final String? supplierUuid;

  @override
  Future<SupplierFormState> build() async {
    final supplierTypeOptions = await ref
        .read(supplierServiceProvider)
        .listSupplierTypes();
    final options = supplierTypeOptions
        .map(SupplierTypeOptionState.fromOption)
        .toList();

    if (supplierUuid == null) {
      return SupplierFormState(supplierTypeOptions: options);
    }

    final detail = await ref
        .read(supplierServiceProvider)
        .getSupplierDetail(supplierUuid!);
    if (detail == null) {
      return SupplierFormState(
        supplierUuid: supplierUuid,
        supplierTypeOptions: options,
        errorMessage: '厂家不存在或已删除。',
      );
    }

    return SupplierFormState(
      supplierUuid: detail.supplier.uuid,
      supplierName: detail.supplier.supplierName,
      contactName: detail.supplier.contactName ?? '',
      phone: detail.supplier.phone ?? '',
      wechat: detail.supplier.wechat ?? '',
      email: detail.supplier.email ?? '',
      supplierType: detail.supplier.supplierType,
      specialtyProducts: detail.supplier.specialtyProducts ?? '',
      defaultLeadDays: detail.supplier.defaultLeadDays?.toString() ?? '',
      remark: detail.supplier.remark ?? '',
      supplierTypeOptions: options,
    );
  }

  void updateFields({
    String? supplierName,
    String? contactName,
    String? phone,
    String? wechat,
    String? email,
    String? supplierType,
    String? specialtyProducts,
    String? defaultLeadDays,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        supplierName: supplierName,
        contactName: contactName,
        phone: phone,
        wechat: wechat,
        email: email,
        supplierType: supplierType,
        specialtyProducts: specialtyProducts,
        defaultLeadDays: defaultLeadDays,
        remark: remark,
        clearError: true,
      ),
    );
  }

  Future<String?> save() async {
    final current = state.value;
    if (current == null) {
      return null;
    }

    final validationError = _validate(current);
    if (validationError != null) {
      state = AsyncValue.data(current.copyWith(errorMessage: validationError));
      return null;
    }

    final defaultLeadDays = _parseLeadDays(current.defaultLeadDays);

    state = const AsyncValue.loading();
    try {
      final service = ref.read(supplierServiceProvider);

      if (current.isEditing) {
        await service.updateSupplier(
          current.supplierUuid!,
          UpdateSupplierInput(
            supplierName: current.supplierName,
            contactName: _blankToNull(current.contactName),
            phone: _blankToNull(current.phone),
            wechat: _blankToNull(current.wechat),
            email: _blankToNull(current.email),
            supplierType: current.supplierType,
            specialtyProducts: _blankToNull(current.specialtyProducts),
            defaultLeadDays: defaultLeadDays,
            remark: _blankToNull(current.remark),
          ),
        );
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.supplierUuid;
      }

      final supplier = await service.createSupplier(
        CreateSupplierInput(
          supplierName: current.supplierName,
          contactName: _blankToNull(current.contactName),
          phone: _blankToNull(current.phone),
          wechat: _blankToNull(current.wechat),
          email: _blankToNull(current.email),
          supplierType: current.supplierType,
          specialtyProducts: _blankToNull(current.specialtyProducts),
          defaultLeadDays: defaultLeadDays,
          remark: _blankToNull(current.remark),
        ),
      );

      final savedUuid = supplier?.uuid;
      state = AsyncValue.data(current.copyWith(supplierUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  String? _validate(SupplierFormState current) {
    if (current.supplierName.trim().isEmpty) {
      return '请填写厂家名称。';
    }

    if (current.supplierType.trim().isEmpty) {
      return '请选择厂家类型。';
    }

    final leadDays = current.defaultLeadDays.trim();
    if (leadDays.isNotEmpty) {
      final parsed = int.tryParse(leadDays);
      if (parsed == null || parsed <= 0) {
        return '默认交期天数必须是大于 0 的整数。';
      }
    }

    return null;
  }

  int? _parseLeadDays(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : int.parse(trimmed);
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
