import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import 'audit_log_service.dart';

class ExportService {
  ExportService({AuditLogService? auditLogService, Uuid? uuidGenerator})
    : _auditLogService = auditLogService,
      _uuid = uuidGenerator ?? const Uuid();

  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  List<Map<String, Object?>> buildOrderExportRows({
    required List<SalesOrder> orders,
    Map<String, List<SalesOrderItem>> itemsByOrderUuid = const {},
    Map<String, String> customerNamesByUuid = const {},
    Map<String, String> supplierNamesByUuid = const {},
    Map<String, String> carrierNamesByKey = const {},
    Map<String, String> trackingNoByOrderUuid = const {},
  }) {
    final rows = <Map<String, Object?>>[];

    for (final order in orders) {
      final items = itemsByOrderUuid[order.uuid] ?? const <SalesOrderItem>[];
      if (items.isEmpty) {
        rows.add(_buildOrderRow(order: order));
        continue;
      }

      for (final item in items) {
        rows.add(
          _buildOrderRow(
            order: order,
            item: item,
            customerNamesByUuid: customerNamesByUuid,
            supplierNamesByUuid: supplierNamesByUuid,
            carrierNamesByKey: carrierNamesByKey,
            trackingNoByOrderUuid: trackingNoByOrderUuid,
          ),
        );
      }
    }

    return rows;
  }

  Future<String?> recordOrderExport({
    required int rowCount,
    String? operatorName,
    String? deviceId,
    String? remark,
  }) {
    final exportUuid = _uuid.v4();
    final auditLogService = _auditLogService;
    if (auditLogService == null) {
      return Future.value(null);
    }

    return auditLogService.recordExport(
      exportUuid: exportUuid,
      newValue: {'row_count': rowCount},
      operatorName: operatorName,
      deviceId: deviceId,
      remark: remark ?? 'Export orders',
    );
  }

  Map<String, Object?> _buildOrderRow({
    required SalesOrder order,
    SalesOrderItem? item,
    Map<String, String> customerNamesByUuid = const {},
    Map<String, String> supplierNamesByUuid = const {},
    Map<String, String> carrierNamesByKey = const {},
    Map<String, String> trackingNoByOrderUuid = const {},
  }) {
    return {
      '订单号': order.orderNo,
      '客户': customerNamesByUuid[order.customerUuid] ?? order.customerUuid,
      '产品名称': item?.productNameSnapshot,
      '货号': item?.productCodeSnapshot,
      '规格': item?.specificationSnapshot,
      '数量': item?.quantityValue,
      '单位': item?.quantityUnit,
      '下单时间': order.orderDate?.toIso8601String(),
      '成本': formatFen(item?.costAmount ?? order.totalCostAmount),
      '销售金额': formatFen(item?.saleAmount ?? order.totalSaleAmount),
      '毛利': formatFen(order.totalProfitAmount),
      '厂家': supplierNamesByUuid[item?.supplierUuid] ?? item?.supplierUuid,
      '快递公司': carrierNamesByKey[order.uuid],
      '快递单号': trackingNoByOrderUuid[order.uuid],
      '订单状态': order.orderStatus,
      '备注': item?.remark ?? order.remark,
    };
  }

  String formatFen(int amount) {
    final sign = amount < 0 ? '-' : '';
    final absolute = amount.abs();
    final yuan = absolute ~/ 100;
    final cents = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$yuan.$cents';
  }
}
