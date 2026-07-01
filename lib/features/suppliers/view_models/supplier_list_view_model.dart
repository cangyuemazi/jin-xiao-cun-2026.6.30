import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/supplier_service.dart';

final supplierListViewModelProvider =
    AsyncNotifierProvider.autoDispose<SupplierListViewModel, SupplierListState>(
      SupplierListViewModel.new,
    );

final supplierDetailProvider = FutureProvider.autoDispose
    .family<SupplierDetailViewState?, String>((ref, supplierUuid) async {
      final detail = await ref
          .watch(supplierServiceProvider)
          .getSupplierDetail(supplierUuid);
      return detail == null ? null : SupplierDetailViewState.fromDetail(detail);
    });

class SupplierListState {
  const SupplierListState({this.keyword = '', this.suppliers = const []});

  final String keyword;
  final List<SupplierListRowState> suppliers;
}

class SupplierListRowState {
  const SupplierListRowState({
    required this.uuid,
    required this.supplierName,
    required this.supplierType,
    required this.supplierTypeLabel,
    this.contactName,
    this.phone,
    this.wechat,
    this.email,
    this.specialtyProducts,
    this.defaultLeadDays,
    this.remark,
  });

  final String uuid;
  final String supplierName;
  final String supplierType;
  final String supplierTypeLabel;
  final String? contactName;
  final String? phone;
  final String? wechat;
  final String? email;
  final String? specialtyProducts;
  final int? defaultLeadDays;
  final String? remark;

  factory SupplierListRowState.fromEntry(SupplierListEntry entry) {
    return SupplierListRowState(
      uuid: entry.supplier.uuid,
      supplierName: entry.supplier.supplierName,
      supplierType: entry.supplier.supplierType,
      supplierTypeLabel: entry.supplierTypeLabel,
      contactName: entry.supplier.contactName,
      phone: entry.supplier.phone,
      wechat: entry.supplier.wechat,
      email: entry.supplier.email,
      specialtyProducts: entry.supplier.specialtyProducts,
      defaultLeadDays: entry.supplier.defaultLeadDays,
      remark: entry.supplier.remark,
    );
  }
}

class SupplierDetailViewState {
  const SupplierDetailViewState({
    required this.uuid,
    required this.supplierName,
    required this.supplierType,
    required this.supplierTypeLabel,
    this.contactName,
    this.phone,
    this.wechat,
    this.email,
    this.specialtyProducts,
    this.defaultLeadDays,
    this.remark,
  });

  final String uuid;
  final String supplierName;
  final String supplierType;
  final String supplierTypeLabel;
  final String? contactName;
  final String? phone;
  final String? wechat;
  final String? email;
  final String? specialtyProducts;
  final int? defaultLeadDays;
  final String? remark;

  factory SupplierDetailViewState.fromDetail(SupplierDetail detail) {
    return SupplierDetailViewState(
      uuid: detail.supplier.uuid,
      supplierName: detail.supplier.supplierName,
      supplierType: detail.supplier.supplierType,
      supplierTypeLabel: detail.supplierTypeLabel,
      contactName: detail.supplier.contactName,
      phone: detail.supplier.phone,
      wechat: detail.supplier.wechat,
      email: detail.supplier.email,
      specialtyProducts: detail.supplier.specialtyProducts,
      defaultLeadDays: detail.supplier.defaultLeadDays,
      remark: detail.supplier.remark,
    );
  }
}

class SupplierListViewModel extends AsyncNotifier<SupplierListState> {
  @override
  Future<SupplierListState> build() {
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

  Future<void> softDeleteSupplier(String supplierUuid) async {
    final keyword = state.value?.keyword ?? '';
    await ref.read(supplierServiceProvider).softDeleteSupplier(supplierUuid);
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<SupplierListState> _load({String keyword = ''}) async {
    final suppliers = await ref
        .read(supplierServiceProvider)
        .listSuppliers(keyword: keyword, limit: 100);

    return SupplierListState(
      keyword: keyword,
      suppliers: suppliers.map(SupplierListRowState.fromEntry).toList(),
    );
  }
}
