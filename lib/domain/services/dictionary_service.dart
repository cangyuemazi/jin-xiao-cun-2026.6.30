import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/repositories/dictionary_repository.dart';
import '../../data/database/app_database.dart';

class DictionarySeed {
  const DictionarySeed({
    required this.type,
    required this.key,
    required this.label,
    required this.sortOrder,
  });

  final String type;
  final String key;
  final String label;
  final int sortOrder;
}

class DictionaryService {
  DictionaryService({
    required DictionaryRepository dictionaryRepository,
    Uuid? uuidGenerator,
  }) : _dictionaryRepository = dictionaryRepository,
       _uuid = uuidGenerator ?? const Uuid();

  final DictionaryRepository _dictionaryRepository;
  final Uuid _uuid;

  Future<int> initializeDefaultDictionaries({String? deviceId}) async {
    var createdCount = 0;

    for (final seed in defaultDictionarySeeds) {
      final existing = await _dictionaryRepository.getByTypeAndKey(
        seed.type,
        seed.key,
        includeDeleted: true,
      );

      if (existing != null) {
        continue;
      }

      await _dictionaryRepository.create(
        DictionariesCompanion.insert(
          uuid: _uuid.v4(),
          dictType: seed.type,
          dictKey: seed.key,
          dictLabel: seed.label,
          sortOrder: Value(seed.sortOrder),
          deviceId: Value(deviceId),
        ),
      );
      createdCount += 1;
    }

    return createdCount;
  }

  Future<List<Dictionary>> listEnabledByType(String dictType) {
    return _dictionaryRepository.listByType(dictType);
  }
}

const defaultDictionarySeeds = [
  DictionarySeed(
    type: 'order_status',
    key: 'draft',
    label: '草稿',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'confirmed',
    label: '已确认',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'purchasing',
    label: '待采购/待加工',
    sortOrder: 30,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'in_production',
    label: '厂家生产中',
    sortOrder: 40,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'ready_to_ship',
    label: '待发货',
    sortOrder: 50,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'partial_shipped',
    label: '部分发货',
    sortOrder: 60,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'shipped',
    label: '已发货',
    sortOrder: 70,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'completed',
    label: '已完成',
    sortOrder: 80,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'cancelled',
    label: '已取消',
    sortOrder: 90,
  ),
  DictionarySeed(
    type: 'order_status',
    key: 'after_sales',
    label: '售后中',
    sortOrder: 100,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'product_cost',
    label: '产品成本',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'processing_fee',
    label: '加工费',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'shipping_fee',
    label: '运费',
    sortOrder: 30,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'packing_fee',
    label: '包装费',
    sortOrder: 40,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'testing_fee',
    label: '检测费',
    sortOrder: 50,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'tax_fee',
    label: '税费',
    sortOrder: 60,
  ),
  DictionarySeed(
    type: 'expense_type',
    key: 'other_fee',
    label: '其他费用',
    sortOrder: 70,
  ),
  DictionarySeed(
    type: 'customer_type',
    key: 'default',
    label: '默认客户',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'customer_type',
    key: 'organization',
    label: '单位客户',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'customer_type',
    key: 'individual',
    label: '个人客户',
    sortOrder: 30,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'material',
    label: '科研材料',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'alloy_sample',
    label: '合金样品',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'target',
    label: '靶材',
    sortOrder: 30,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'metal_particle',
    label: '金属颗粒',
    sortOrder: 40,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'custom_processing',
    label: '定制加工产品',
    sortOrder: 50,
  ),
  DictionarySeed(
    type: 'product_type',
    key: 'secondary_processing',
    label: '二次加工产品',
    sortOrder: 60,
  ),
  DictionarySeed(
    type: 'supplier_type',
    key: 'manufacturer',
    label: '厂家',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'supplier_type',
    key: 'processor',
    label: '加工方',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'supplier_type',
    key: 'other',
    label: '其他',
    sortOrder: 90,
  ),
  DictionarySeed(
    type: 'shipment_status',
    key: 'draft',
    label: '草稿',
    sortOrder: 10,
  ),
  DictionarySeed(
    type: 'shipment_status',
    key: 'pending',
    label: '待发货',
    sortOrder: 20,
  ),
  DictionarySeed(
    type: 'shipment_status',
    key: 'partial_shipped',
    label: '部分发货',
    sortOrder: 30,
  ),
  DictionarySeed(
    type: 'shipment_status',
    key: 'shipped',
    label: '已发货',
    sortOrder: 40,
  ),
  DictionarySeed(
    type: 'shipment_status',
    key: 'cancelled',
    label: '已取消',
    sortOrder: 90,
  ),
  DictionarySeed(type: 'carrier', key: 'sf', label: '顺丰', sortOrder: 10),
  DictionarySeed(type: 'carrier', key: 'jd', label: '京东', sortOrder: 20),
  DictionarySeed(type: 'carrier', key: 'zt', label: '中通', sortOrder: 30),
  DictionarySeed(type: 'carrier', key: 'yt', label: '圆通', sortOrder: 40),
  DictionarySeed(type: 'carrier', key: 'sto', label: '申通', sortOrder: 50),
  DictionarySeed(type: 'carrier', key: 'yd', label: '韵达', sortOrder: 60),
  DictionarySeed(type: 'carrier', key: 'ems', label: 'EMS', sortOrder: 70),
  DictionarySeed(type: 'carrier', key: 'other', label: '其他', sortOrder: 90),
];
