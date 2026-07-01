import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/product_service.dart';

final productListViewModelProvider =
    AsyncNotifierProvider.autoDispose<ProductListViewModel, ProductListState>(
      ProductListViewModel.new,
    );

final productDetailProvider = FutureProvider.autoDispose
    .family<ProductDetailViewState?, String>((ref, productUuid) async {
      final detail = await ref
          .watch(productServiceProvider)
          .getProductDetail(productUuid);
      return detail == null ? null : ProductDetailViewState.fromDetail(detail);
    });

class ProductListState {
  const ProductListState({this.keyword = '', this.products = const []});

  final String keyword;
  final List<ProductListRowState> products;
}

class ProductListRowState {
  const ProductListRowState({
    required this.uuid,
    required this.productName,
    required this.productType,
    required this.productTypeLabel,
    required this.isCustomProduct,
    required this.trackInventory,
    this.productCode,
    this.materialCategory,
    this.specification,
    this.quantityUnit,
    this.defaultSupplierUuid,
    this.remark,
  });

  final String uuid;
  final String productName;
  final String? productCode;
  final String productType;
  final String productTypeLabel;
  final String? materialCategory;
  final String? specification;
  final String? quantityUnit;
  final String? defaultSupplierUuid;
  final bool isCustomProduct;
  final bool trackInventory;
  final String? remark;

  factory ProductListRowState.fromEntry(ProductListEntry entry) {
    return ProductListRowState(
      uuid: entry.product.uuid,
      productName: entry.product.productName,
      productCode: entry.product.productCode,
      productType: entry.product.productType,
      productTypeLabel: entry.productTypeLabel,
      materialCategory: entry.product.materialCategory,
      specification: entry.product.specification,
      quantityUnit: entry.product.quantityUnit,
      defaultSupplierUuid: entry.product.defaultSupplierUuid,
      isCustomProduct: entry.product.isCustomProduct,
      trackInventory: entry.product.trackInventory,
      remark: entry.product.remark,
    );
  }
}

class ProductDetailViewState {
  const ProductDetailViewState({
    required this.uuid,
    required this.productName,
    required this.productType,
    required this.productTypeLabel,
    required this.isCustomProduct,
    required this.trackInventory,
    this.productCode,
    this.materialCategory,
    this.specification,
    this.quantityUnit,
    this.defaultSupplierUuid,
    this.remark,
  });

  final String uuid;
  final String productName;
  final String? productCode;
  final String productType;
  final String productTypeLabel;
  final String? materialCategory;
  final String? specification;
  final String? quantityUnit;
  final String? defaultSupplierUuid;
  final bool isCustomProduct;
  final bool trackInventory;
  final String? remark;

  factory ProductDetailViewState.fromDetail(ProductDetail detail) {
    return ProductDetailViewState(
      uuid: detail.product.uuid,
      productName: detail.product.productName,
      productCode: detail.product.productCode,
      productType: detail.product.productType,
      productTypeLabel: detail.productTypeLabel,
      materialCategory: detail.product.materialCategory,
      specification: detail.product.specification,
      quantityUnit: detail.product.quantityUnit,
      defaultSupplierUuid: detail.product.defaultSupplierUuid,
      isCustomProduct: detail.product.isCustomProduct,
      trackInventory: detail.product.trackInventory,
      remark: detail.product.remark,
    );
  }
}

class ProductListViewModel extends AsyncNotifier<ProductListState> {
  @override
  Future<ProductListState> build() {
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

  Future<void> softDeleteProduct(String productUuid) async {
    final keyword = state.value?.keyword ?? '';
    await ref.read(productServiceProvider).softDeleteProduct(productUuid);
    state = await AsyncValue.guard(() => _load(keyword: keyword));
  }

  Future<ProductListState> _load({String keyword = ''}) async {
    final products = await ref
        .read(productServiceProvider)
        .listProducts(keyword: keyword, limit: 100);

    return ProductListState(
      keyword: keyword,
      products: products.map(ProductListRowState.fromEntry).toList(),
    );
  }
}
