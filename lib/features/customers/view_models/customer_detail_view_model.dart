import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/customer_service.dart';

final customerDetailViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<CustomerDetailViewModel, CustomerDetailState?, String>(
      CustomerDetailViewModel.new,
    );

class CustomerDetailState {
  const CustomerDetailState({
    required this.uuid,
    required this.customerName,
    required this.customerType,
    this.phone,
    this.companyName,
    this.department,
    this.wechat,
    this.email,
    this.remark,
    this.addresses = const [],
  });

  final String uuid;
  final String customerName;
  final String? phone;
  final String? companyName;
  final String? department;
  final String customerType;
  final String? wechat;
  final String? email;
  final String? remark;
  final List<CustomerAddressRowState> addresses;

  factory CustomerDetailState.fromDetail(CustomerDetail detail) {
    return CustomerDetailState(
      uuid: detail.customer.uuid,
      customerName: detail.customer.customerName,
      phone: detail.customer.phone,
      companyName: detail.customer.companyName,
      department: detail.customer.department,
      customerType: detail.customer.customerType,
      wechat: detail.customer.wechat,
      email: detail.customer.email,
      remark: detail.customer.remark,
      addresses: [
        for (final address in detail.addresses)
          CustomerAddressRowState(
            uuid: address.uuid,
            customerUuid: address.customerUuid,
            recipientName: address.recipientName,
            phone: address.phone,
            province: address.province,
            city: address.city,
            district: address.district,
            detailAddress: address.detailAddress,
            recipientCompany: address.recipientCompany,
            fullAddress: address.fullAddress,
            isDefault: address.isDefault,
            remark: address.remark,
          ),
      ],
    );
  }
}

class CustomerAddressRowState {
  const CustomerAddressRowState({
    required this.uuid,
    required this.customerUuid,
    required this.isDefault,
    this.recipientName,
    this.phone,
    this.province,
    this.city,
    this.district,
    this.detailAddress,
    this.recipientCompany,
    this.fullAddress,
    this.remark,
  });

  final String uuid;
  final String customerUuid;
  final String? recipientName;
  final String? phone;
  final String? province;
  final String? city;
  final String? district;
  final String? detailAddress;
  final String? recipientCompany;
  final String? fullAddress;
  final bool isDefault;
  final String? remark;
}

class CustomerDetailViewModel extends AsyncNotifier<CustomerDetailState?> {
  CustomerDetailViewModel(this.customerUuid);

  final String customerUuid;

  @override
  Future<CustomerDetailState?> build() {
    return _load();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_load);
  }

  Future<void> setDefaultAddress(String addressUuid) async {
    await ref
        .read(customerServiceProvider)
        .setDefaultAddress(customerUuid, addressUuid);
    state = await AsyncValue.guard(_load);
  }

  Future<void> softDeleteAddress(String addressUuid) async {
    await ref.read(customerServiceProvider).softDeleteAddress(addressUuid);
    state = await AsyncValue.guard(_load);
  }

  Future<CustomerDetailState?> _load() async {
    final detail = await ref
        .read(customerServiceProvider)
        .getCustomerDetail(customerUuid);
    return detail == null ? null : CustomerDetailState.fromDetail(detail);
  }
}
