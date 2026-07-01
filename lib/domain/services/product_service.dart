import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/product_repository.dart';
import 'audit_log_service.dart';
import 'dictionary_service.dart';

class ProductTypeOption {
  const ProductTypeOption({required this.key, required this.label});

  final String key;
  final String label;
}

class ProductListEntry {
  const ProductListEntry({
    required this.product,
    required this.productTypeLabel,
  });

  final Product product;
  final String productTypeLabel;
}

class ProductDetail {
  const ProductDetail({required this.product, required this.productTypeLabel});

  final Product product;
  final String productTypeLabel;
}

class CreateProductInput {
  const CreateProductInput({
    this.uuid,
    required this.productName,
    this.productCode,
    this.productType = 'material',
    this.materialCategory,
    this.specification,
    this.quantityUnit,
    this.defaultSupplierUuid,
    this.isCustomProduct = false,
    this.trackInventory = true,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String productName;
  final String? productCode;
  final String productType;
  final String? materialCategory;
  final String? specification;
  final String? quantityUnit;
  final String? defaultSupplierUuid;
  final bool isCustomProduct;
  final bool trackInventory;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class UpdateProductInput {
  const UpdateProductInput({
    required this.productName,
    this.productCode,
    this.productType = 'material',
    this.materialCategory,
    this.specification,
    this.quantityUnit,
    this.defaultSupplierUuid,
    this.isCustomProduct = false,
    this.trackInventory = true,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String productName;
  final String? productCode;
  final String productType;
  final String? materialCategory;
  final String? specification;
  final String? quantityUnit;
  final String? defaultSupplierUuid;
  final bool isCustomProduct;
  final bool trackInventory;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class ProductService {
  ProductService({
    required ProductRepository productRepository,
    required DictionaryService dictionaryService,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _productRepository = productRepository,
       _dictionaryService = dictionaryService,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  final ProductRepository _productRepository;
  final DictionaryService _dictionaryService;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<ProductTypeOption>> listProductTypes() async {
    await _dictionaryService.initializeDefaultDictionaries();
    final dictionaries = await _dictionaryService.listEnabledByType(
      'product_type',
    );

    return dictionaries
        .map(
          (dictionary) => ProductTypeOption(
            key: dictionary.dictKey,
            label: dictionary.dictLabel,
          ),
        )
        .toList();
  }

  Future<List<ProductListEntry>> listProducts({
    String keyword = '',
    int limit = 50,
    int offset = 0,
  }) async {
    final products = keyword.trim().isEmpty
        ? await _productRepository.list(limit: limit, offset: offset)
        : await _productRepository.search(
            keyword,
            limit: limit,
            offset: offset,
          );
    final labels = await _productTypeLabels();

    return [
      for (final product in products)
        ProductListEntry(
          product: product,
          productTypeLabel: labels[product.productType] ?? product.productType,
        ),
    ];
  }

  Future<ProductDetail?> getProductDetail(String productUuid) async {
    final product = await _productRepository.getByUuid(productUuid);
    if (product == null) {
      return null;
    }

    final labels = await _productTypeLabels();
    return ProductDetail(
      product: product,
      productTypeLabel: labels[product.productType] ?? product.productType,
    );
  }

  Future<Product?> createProduct(CreateProductInput input) async {
    final productUuid = input.uuid ?? _uuid.v4();

    await _productRepository.create(
      ProductsCompanion.insert(
        uuid: productUuid,
        productName: input.productName.trim(),
        productCode: Value(_blankToNull(input.productCode)),
        productType: Value(_normalProductType(input.productType)),
        materialCategory: Value(_blankToNull(input.materialCategory)),
        specification: Value(_blankToNull(input.specification)),
        quantityUnit: Value(_blankToNull(input.quantityUnit)),
        defaultSupplierUuid: Value(_blankToNull(input.defaultSupplierUuid)),
        isCustomProduct: Value(input.isCustomProduct),
        trackInventory: Value(input.trackInventory),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    await _auditLogService?.recordCreate(
      entityType: 'product',
      entityUuid: productUuid,
      newValue: {
        'product_name': input.productName.trim(),
        'product_code': input.productCode,
        'product_type': input.productType,
      },
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create product',
    );

    return _productRepository.getByUuid(productUuid);
  }

  Future<bool> updateProduct(
    String productUuid,
    UpdateProductInput input,
  ) async {
    final oldProduct = await _productRepository.getByUuid(productUuid);
    final updated = await _productRepository.update(
      productUuid,
      ProductsCompanion(
        productName: Value(input.productName.trim()),
        productCode: Value(_blankToNull(input.productCode)),
        productType: Value(_normalProductType(input.productType)),
        materialCategory: Value(_blankToNull(input.materialCategory)),
        specification: Value(_blankToNull(input.specification)),
        quantityUnit: Value(_blankToNull(input.quantityUnit)),
        defaultSupplierUuid: Value(_blankToNull(input.defaultSupplierUuid)),
        isCustomProduct: Value(input.isCustomProduct),
        trackInventory: Value(input.trackInventory),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'product',
        entityUuid: productUuid,
        oldValue: _productSnapshot(oldProduct),
        newValue: _productInputSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update product',
      );
    }

    return updated;
  }

  Future<bool> softDeleteProduct(
    String productUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldProduct = await _productRepository.getByUuid(productUuid);
    final deleted = await _productRepository.softDelete(productUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'product',
        entityUuid: productUuid,
        oldValue: _productSnapshot(oldProduct),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete product',
      );
    }

    return deleted;
  }

  Future<Map<String, String>> _productTypeLabels() async {
    final options = await listProductTypes();
    return {for (final option in options) option.key: option.label};
  }

  String _normalProductType(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'material' : trimmed;
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Map<String, Object?>? _productSnapshot(Product? product) {
    if (product == null) {
      return null;
    }

    return {
      'uuid': product.uuid,
      'product_name': product.productName,
      'product_code': product.productCode,
      'product_type': product.productType,
      'material_category': product.materialCategory,
      'specification': product.specification,
      'quantity_unit': product.quantityUnit,
      'default_supplier_uuid': product.defaultSupplierUuid,
      'is_custom_product': product.isCustomProduct,
      'track_inventory': product.trackInventory,
      'remark': product.remark,
    };
  }

  Map<String, Object?> _productInputSnapshot(UpdateProductInput input) {
    return {
      'product_name': input.productName,
      'product_code': input.productCode,
      'product_type': input.productType,
      'material_category': input.materialCategory,
      'specification': input.specification,
      'quantity_unit': input.quantityUnit,
      'default_supplier_uuid': input.defaultSupplierUuid,
      'is_custom_product': input.isCustomProduct,
      'track_inventory': input.trackInventory,
      'remark': input.remark,
    };
  }
}
