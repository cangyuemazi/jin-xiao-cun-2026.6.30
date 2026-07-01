import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/customer_service.dart';

final customerListViewModelProvider =
    AsyncNotifierProvider.autoDispose<CustomerListViewModel, CustomerListState>(
      CustomerListViewModel.new,
    );

class CustomerListState {
  const CustomerListState({this.keyword = '', this.customers = const []});

  final String keyword;
  final List<CustomerListRowState> customers;
}

class CustomerListRowState {
  const CustomerListRowState({
    required this.uuid,
    required this.customerName,
    required this.customerType,
    required this.addressCount,
    this.phone,
    this.companyName,
    this.department,
    this.wechat,
    this.email,
    this.defaultAddress,
    this.remark,
  });

  final String uuid;
  final String customerName;
  final String? phone;
  final String? companyName;
  final String? department;
  final String customerType;
  final String? wechat;
  final String? email;
  final String? defaultAddress;
  final int addressCount;
  final String? remark;

  factory CustomerListRowState.fromEntry(CustomerListEntry entry) {
    return CustomerListRowState(
      uuid: entry.customer.uuid,
      customerName: entry.customer.customerName,
      phone: entry.customer.phone,
      companyName: entry.customer.companyName,
      department: entry.customer.department,
      customerType: entry.customer.customerType,
      wechat: entry.customer.wechat,
      email: entry.customer.email,
      defaultAddress: entry.defaultAddress?.fullAddress,
      addressCount: entry.addressCount,
      remark: entry.customer.remark,
    );
  }
}

class CustomerListViewModel extends AsyncNotifier<CustomerListState> {
  @override
  Future<CustomerListState> build() {
    return _load();
  }

  Future<void> setSearchKeyword(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<void> refresh() async {
    final keyword = state.value?.keyword ?? '';
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<void> softDeleteCustomer(String customerUuid) async {
    final keyword = state.value?.keyword ?? '';
    await ref.read(customerServiceProvider).softDeleteCustomer(customerUuid);
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<CustomerListState> _load({String keyword = ''}) async {
    final customers = await ref
        .read(customerServiceProvider)
        .listCustomers(keyword: keyword, limit: 100);

    return CustomerListState(
      keyword: keyword,
      customers: customers.map(CustomerListRowState.fromEntry).toList(),
    );
  }
}
