import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/customer_service.dart';

final customerFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<CustomerFormViewModel, CustomerFormState, String?>(
      CustomerFormViewModel.new,
    );

class CustomerFormState {
  const CustomerFormState({
    this.customerUuid,
    this.customerName = '',
    this.phone = '',
    this.companyName = '',
    this.department = '',
    this.customerType = 'default',
    this.wechat = '',
    this.email = '',
    this.remark = '',
    this.errorMessage,
  });

  final String? customerUuid;
  final String customerName;
  final String phone;
  final String companyName;
  final String department;
  final String customerType;
  final String wechat;
  final String email;
  final String remark;
  final String? errorMessage;

  bool get isEditing => customerUuid != null;

  CustomerFormState copyWith({
    String? customerUuid,
    String? customerName,
    String? phone,
    String? companyName,
    String? department,
    String? customerType,
    String? wechat,
    String? email,
    String? remark,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CustomerFormState(
      customerUuid: customerUuid ?? this.customerUuid,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      department: department ?? this.department,
      customerType: customerType ?? this.customerType,
      wechat: wechat ?? this.wechat,
      email: email ?? this.email,
      remark: remark ?? this.remark,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class CustomerFormViewModel extends AsyncNotifier<CustomerFormState> {
  CustomerFormViewModel(this.customerUuid);

  final String? customerUuid;

  @override
  Future<CustomerFormState> build() async {
    if (customerUuid == null) {
      return const CustomerFormState();
    }

    final detail = await ref
        .read(customerServiceProvider)
        .getCustomerDetail(customerUuid!);
    if (detail == null) {
      return CustomerFormState(
        customerUuid: customerUuid,
        errorMessage: '客户不存在或已删除。',
      );
    }

    return CustomerFormState(
      customerUuid: detail.customer.uuid,
      customerName: detail.customer.customerName,
      phone: detail.customer.phone ?? '',
      companyName: detail.customer.companyName ?? '',
      department: detail.customer.department ?? '',
      customerType: detail.customer.customerType,
      wechat: detail.customer.wechat ?? '',
      email: detail.customer.email ?? '',
      remark: detail.customer.remark ?? '',
    );
  }

  void updateFields({
    String? customerName,
    String? phone,
    String? companyName,
    String? department,
    String? customerType,
    String? wechat,
    String? email,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        customerName: customerName,
        phone: phone,
        companyName: companyName,
        department: department,
        customerType: customerType,
        wechat: wechat,
        email: email,
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

    state = const AsyncValue.loading();
    try {
      final service = ref.read(customerServiceProvider);

      if (current.isEditing) {
        await service.updateCustomer(
          current.customerUuid!,
          UpdateCustomerInput(
            customerName: current.customerName,
            phone: _blankToNull(current.phone),
            companyName: _blankToNull(current.companyName),
            department: _blankToNull(current.department),
            customerType: current.customerType,
            wechat: _blankToNull(current.wechat),
            email: _blankToNull(current.email),
            remark: _blankToNull(current.remark),
          ),
        );
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.customerUuid;
      }

      final customer = await service.createCustomer(
        CreateCustomerInput(
          customerName: current.customerName,
          phone: _blankToNull(current.phone),
          companyName: _blankToNull(current.companyName),
          department: _blankToNull(current.department),
          customerType: current.customerType,
          wechat: _blankToNull(current.wechat),
          email: _blankToNull(current.email),
          remark: _blankToNull(current.remark),
        ),
      );

      final savedUuid = customer?.uuid;
      state = AsyncValue.data(current.copyWith(customerUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  String? _validate(CustomerFormState current) {
    if (current.customerName.trim().isEmpty) {
      return '请填写客户姓名。';
    }

    return null;
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
