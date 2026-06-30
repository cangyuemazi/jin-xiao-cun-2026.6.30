import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/inventory_repository.dart';

class CreateInventoryItemInput {
  const CreateInventoryItemInput({
    this.uuid,
    this.productUuid,
    required this.productNameSnapshot,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    this.quantityValue = 0,
    this.quantityUnit,
    this.warehouseName,
    this.inventoryStatus = 'active',
    this.remark,
    this.deviceId,
  });

  final String? uuid;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double quantityValue;
  final String? quantityUnit;
  final String? warehouseName;
  final String inventoryStatus;
  final String? remark;
  final String? deviceId;
}

class InventoryChangeInput {
  const InventoryChangeInput({
    required this.inventoryItemUuid,
    required this.changeType,
    required this.quantityChangeValue,
    this.relatedType,
    this.relatedUuid,
    this.operatorName,
    this.deviceId,
    this.remark,
  });

  final String inventoryItemUuid;
  final String changeType;
  final double quantityChangeValue;
  final String? relatedType;
  final String? relatedUuid;
  final String? operatorName;
  final String? deviceId;
  final String? remark;
}

class InventoryService {
  InventoryService({
    required InventoryRepository inventoryRepository,
    Uuid? uuidGenerator,
  }) : _inventoryRepository = inventoryRepository,
       _uuid = uuidGenerator ?? const Uuid();

  final InventoryRepository _inventoryRepository;
  final Uuid _uuid;

  Future<InventoryItem?> createInventoryItem(
    CreateInventoryItemInput input,
  ) async {
    final inventoryUuid = input.uuid ?? _uuid.v4();

    await _inventoryRepository.create(
      InventoryItemsCompanion.insert(
        uuid: inventoryUuid,
        productUuid: Value(input.productUuid),
        productNameSnapshot: input.productNameSnapshot,
        productCodeSnapshot: Value(input.productCodeSnapshot),
        specificationSnapshot: Value(input.specificationSnapshot),
        quantityValue: Value(input.quantityValue),
        quantityUnit: Value(input.quantityUnit),
        warehouseName: Value(input.warehouseName),
        inventoryStatus: Value(input.inventoryStatus),
        remark: Value(input.remark),
        deviceId: Value(input.deviceId),
      ),
    );

    return _inventoryRepository.getByUuid(inventoryUuid);
  }

  Future<bool> updateInventoryItem(
    String inventoryUuid,
    InventoryItemsCompanion changes,
  ) {
    return _inventoryRepository.update(inventoryUuid, changes);
  }

  Future<bool> softDeleteInventoryItem(String inventoryUuid) {
    return _inventoryRepository.softDelete(inventoryUuid);
  }

  Future<InventoryItem?> applyQuantityChange(InventoryChangeInput input) async {
    final item = await _inventoryRepository.getByUuid(input.inventoryItemUuid);
    if (item == null) {
      throw StateError('Inventory item not found: ${input.inventoryItemUuid}');
    }

    final beforeQuantity = item.quantityValue;
    final afterQuantity = beforeQuantity + input.quantityChangeValue;
    if (afterQuantity < 0) {
      throw StateError('库存数量不能小于 0。');
    }

    await _inventoryRepository.update(
      input.inventoryItemUuid,
      InventoryItemsCompanion(quantityValue: Value(afterQuantity)),
    );

    await _inventoryRepository.createLog(
      InventoryLogsCompanion.insert(
        uuid: _uuid.v4(),
        inventoryItemUuid: Value(input.inventoryItemUuid),
        productUuid: Value(item.productUuid),
        relatedType: Value(input.relatedType),
        relatedUuid: Value(input.relatedUuid),
        changeType: input.changeType,
        quantityChangeValue: input.quantityChangeValue,
        quantityUnit: Value(item.quantityUnit),
        beforeQuantityValue: Value(beforeQuantity),
        afterQuantityValue: Value(afterQuantity),
        operatedAt: Value(DateTime.now()),
        operatorName: Value(input.operatorName),
        remark: Value(input.remark),
        deviceId: Value(input.deviceId),
      ),
    );

    return _inventoryRepository.getByUuid(input.inventoryItemUuid);
  }
}
