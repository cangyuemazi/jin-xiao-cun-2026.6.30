import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/customer_service.dart';

final customerAddressFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<
      CustomerAddressFormViewModel,
      CustomerAddressFormState,
      CustomerAddressFormArgs
    >(CustomerAddressFormViewModel.new);

class CustomerAddressFormArgs {
  const CustomerAddressFormArgs({required this.customerUuid, this.addressUuid});

  final String customerUuid;
  final String? addressUuid;

  @override
  bool operator ==(Object other) {
    return other is CustomerAddressFormArgs &&
        other.customerUuid == customerUuid &&
        other.addressUuid == addressUuid;
  }

  @override
  int get hashCode => Object.hash(customerUuid, addressUuid);
}

class CustomerAddressFormState {
  const CustomerAddressFormState({
    required this.customerUuid,
    this.addressUuid,
    this.recipientName = '',
    this.phone = '',
    this.province = '',
    this.city = '',
    this.district = '',
    this.detailAddress = '',
    this.recipientCompany = '',
    this.isDefault = false,
    this.remark = '',
    this.errorMessage,
  });

  final String customerUuid;
  final String? addressUuid;
  final String recipientName;
  final String phone;
  final String province;
  final String city;
  final String district;
  final String detailAddress;
  final String recipientCompany;
  final bool isDefault;
  final String remark;
  final String? errorMessage;

  bool get isEditing => addressUuid != null;

  CustomerAddressFormState copyWith({
    String? addressUuid,
    String? recipientName,
    String? phone,
    String? province,
    String? city,
    String? district,
    String? detailAddress,
    String? recipientCompany,
    bool? isDefault,
    String? remark,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CustomerAddressFormState(
      customerUuid: customerUuid,
      addressUuid: addressUuid ?? this.addressUuid,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      detailAddress: detailAddress ?? this.detailAddress,
      recipientCompany: recipientCompany ?? this.recipientCompany,
      isDefault: isDefault ?? this.isDefault,
      remark: remark ?? this.remark,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class CustomerAddressFormViewModel
    extends AsyncNotifier<CustomerAddressFormState> {
  CustomerAddressFormViewModel(this.args);

  final CustomerAddressFormArgs args;

  @override
  Future<CustomerAddressFormState> build() async {
    if (args.addressUuid == null) {
      return CustomerAddressFormState(customerUuid: args.customerUuid);
    }

    final address = await ref
        .read(customerServiceProvider)
        .getAddressByUuid(args.addressUuid!);
    if (address == null || address.customerUuid != args.customerUuid) {
      return CustomerAddressFormState(
        customerUuid: args.customerUuid,
        addressUuid: args.addressUuid,
        errorMessage: '地址不存在或已删除。',
      );
    }

    return CustomerAddressFormState(
      customerUuid: args.customerUuid,
      addressUuid: address.uuid,
      recipientName: address.recipientName ?? '',
      phone: address.phone ?? '',
      province: address.province ?? '',
      city: address.city ?? '',
      district: address.district ?? '',
      detailAddress: address.detailAddress ?? '',
      recipientCompany: address.recipientCompany ?? '',
      isDefault: address.isDefault,
      remark: address.remark ?? '',
    );
  }

  void updateFields({
    String? recipientName,
    String? phone,
    String? province,
    String? city,
    String? district,
    String? detailAddress,
    String? recipientCompany,
    bool? isDefault,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        recipientName: recipientName,
        phone: phone,
        province: province,
        city: city,
        district: district,
        detailAddress: detailAddress,
        recipientCompany: recipientCompany,
        isDefault: isDefault,
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
        await service.updateAddress(
          current.addressUuid!,
          UpdateCustomerAddressInput(
            recipientName: _blankToNull(current.recipientName),
            phone: _blankToNull(current.phone),
            province: _blankToNull(current.province),
            city: _blankToNull(current.city),
            district: _blankToNull(current.district),
            detailAddress: _blankToNull(current.detailAddress),
            recipientCompany: _blankToNull(current.recipientCompany),
            isDefault: current.isDefault,
            remark: _blankToNull(current.remark),
          ),
        );
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.addressUuid;
      }

      final address = await service.createAddress(
        CreateCustomerAddressInput(
          customerUuid: current.customerUuid,
          recipientName: _blankToNull(current.recipientName),
          phone: _blankToNull(current.phone),
          province: _blankToNull(current.province),
          city: _blankToNull(current.city),
          district: _blankToNull(current.district),
          detailAddress: _blankToNull(current.detailAddress),
          recipientCompany: _blankToNull(current.recipientCompany),
          isDefault: current.isDefault,
          remark: _blankToNull(current.remark),
        ),
      );

      final savedUuid = address?.uuid;
      state = AsyncValue.data(current.copyWith(addressUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  String? _validate(CustomerAddressFormState current) {
    if (current.recipientName.trim().isEmpty) {
      return '请填写收件人。';
    }

    if (current.phone.trim().isEmpty) {
      return '请填写收件电话。';
    }

    return null;
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
