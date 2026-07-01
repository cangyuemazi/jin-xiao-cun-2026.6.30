import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/product_service.dart';

final productFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<ProductFormViewModel, ProductFormState, String?>(
      ProductFormViewModel.new,
    );

class ProductTypeOptionState {
  const ProductTypeOptionState({required this.key, required this.label});

  final String key;
  final String label;

  factory ProductTypeOptionState.fromOption(ProductTypeOption option) {
    return ProductTypeOptionState(key: option.key, label: option.label);
  }
}

class ProductFormState {
  const ProductFormState({
    this.productUuid,
    this.productCode = '',
    this.productName = '',
    this.productType = 'material',
    this.materialCategory = '',
    this.specification = '',
    this.quantityUnit = '',
    this.defaultSupplierUuid = '',
    this.isCustomProduct = false,
    this.trackInventory = true,
    this.remark = '',
    this.productTypeOptions = const [],
    this.errorMessage,
  });

  final String? productUuid;
  final String productCode;
  final String productName;
  final String productType;
  final String materialCategory;
  final String specification;
  final String quantityUnit;
  final String defaultSupplierUuid;
  final bool isCustomProduct;
  final bool trackInventory;
  final String remark;
  final List<ProductTypeOptionState> productTypeOptions;
  final String? errorMessage;

  bool get isEditing => productUuid != null;

  ProductFormState copyWith({
    String? productUuid,
    String? productCode,
    String? productName,
    String? productType,
    String? materialCategory,
    String? specification,
    String? quantityUnit,
    String? defaultSupplierUuid,
    bool? isCustomProduct,
    bool? trackInventory,
    String? remark,
    List<ProductTypeOptionState>? productTypeOptions,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ProductFormState(
      productUuid: productUuid ?? this.productUuid,
      productCode: productCode ?? this.productCode,
      productName: productName ?? this.productName,
      productType: productType ?? this.productType,
      materialCategory: materialCategory ?? this.materialCategory,
      specification: specification ?? this.specification,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      defaultSupplierUuid: defaultSupplierUuid ?? this.defaultSupplierUuid,
      isCustomProduct: isCustomProduct ?? this.isCustomProduct,
      trackInventory: trackInventory ?? this.trackInventory,
      remark: remark ?? this.remark,
      productTypeOptions: productTypeOptions ?? this.productTypeOptions,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class ProductFormViewModel extends AsyncNotifier<ProductFormState> {
  ProductFormViewModel(this.productUuid);

  final String? productUuid;

  @override
  Future<ProductFormState> build() async {
    final productTypeOptions = await ref
        .read(productServiceProvider)
        .listProductTypes();
    final options = productTypeOptions
        .map(ProductTypeOptionState.fromOption)
        .toList();

    if (productUuid == null) {
      return ProductFormState(productTypeOptions: options);
    }

    final detail = await ref
        .read(productServiceProvider)
        .getProductDetail(productUuid!);
    if (detail == null) {
      return ProductFormState(
        productUuid: productUuid,
        productTypeOptions: options,
        errorMessage: '产品不存在或已删除。',
      );
    }

    return ProductFormState(
      productUuid: detail.product.uuid,
      productCode: detail.product.productCode ?? '',
      productName: detail.product.productName,
      productType: detail.product.productType,
      materialCategory: detail.product.materialCategory ?? '',
      specification: detail.product.specification ?? '',
      quantityUnit: detail.product.quantityUnit ?? '',
      defaultSupplierUuid: detail.product.defaultSupplierUuid ?? '',
      isCustomProduct: detail.product.isCustomProduct,
      trackInventory: detail.product.trackInventory,
      remark: detail.product.remark ?? '',
      productTypeOptions: options,
    );
  }

  void updateFields({
    String? productCode,
    String? productName,
    String? productType,
    String? materialCategory,
    String? specification,
    String? quantityUnit,
    String? defaultSupplierUuid,
    bool? isCustomProduct,
    bool? trackInventory,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        productCode: productCode,
        productName: productName,
        productType: productType,
        materialCategory: materialCategory,
        specification: specification,
        quantityUnit: quantityUnit,
        defaultSupplierUuid: defaultSupplierUuid,
        isCustomProduct: isCustomProduct,
        trackInventory: trackInventory,
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
      final service = ref.read(productServiceProvider);

      if (current.isEditing) {
        await service.updateProduct(
          current.productUuid!,
          UpdateProductInput(
            productName: current.productName,
            productCode: _blankToNull(current.productCode),
            productType: current.productType,
            materialCategory: _blankToNull(current.materialCategory),
            specification: _blankToNull(current.specification),
            quantityUnit: _blankToNull(current.quantityUnit),
            defaultSupplierUuid: _blankToNull(current.defaultSupplierUuid),
            isCustomProduct: current.isCustomProduct,
            trackInventory: current.trackInventory,
            remark: _blankToNull(current.remark),
          ),
        );
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.productUuid;
      }

      final product = await service.createProduct(
        CreateProductInput(
          productName: current.productName,
          productCode: _blankToNull(current.productCode),
          productType: current.productType,
          materialCategory: _blankToNull(current.materialCategory),
          specification: _blankToNull(current.specification),
          quantityUnit: _blankToNull(current.quantityUnit),
          defaultSupplierUuid: _blankToNull(current.defaultSupplierUuid),
          isCustomProduct: current.isCustomProduct,
          trackInventory: current.trackInventory,
          remark: _blankToNull(current.remark),
        ),
      );

      final savedUuid = product?.uuid;
      state = AsyncValue.data(current.copyWith(productUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  String? _validate(ProductFormState current) {
    if (current.productName.trim().isEmpty) {
      return '请填写产品名称。';
    }

    if (current.productType.trim().isEmpty) {
      return '请选择产品类型。';
    }

    return null;
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
