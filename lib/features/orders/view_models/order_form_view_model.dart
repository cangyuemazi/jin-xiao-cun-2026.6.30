import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/order_service.dart';

final orderFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<OrderFormViewModel, OrderFormState, String?>(
      OrderFormViewModel.new,
    );

class OrderFormState {
  const OrderFormState({
    this.orderUuid,
    this.orderNo = '',
    this.customerUuid = '',
    this.orderDateText = '',
    this.orderStatus = 'draft',
    this.paymentStatus = 'unpaid',
    this.invoiceStatus = 'none',
    this.remark = '',
    this.items = const [OrderFormItemState()],
    this.errorMessage,
  });

  final String? orderUuid;
  final String orderNo;
  final String customerUuid;
  final String orderDateText;
  final String orderStatus;
  final String paymentStatus;
  final String invoiceStatus;
  final String remark;
  final List<OrderFormItemState> items;
  final String? errorMessage;

  bool get isEditing => orderUuid != null;

  OrderFormState copyWith({
    String? orderUuid,
    String? orderNo,
    String? customerUuid,
    String? orderDateText,
    String? orderStatus,
    String? paymentStatus,
    String? invoiceStatus,
    String? remark,
    List<OrderFormItemState>? items,
    String? errorMessage,
    bool clearError = false,
  }) {
    return OrderFormState(
      orderUuid: orderUuid ?? this.orderUuid,
      orderNo: orderNo ?? this.orderNo,
      customerUuid: customerUuid ?? this.customerUuid,
      orderDateText: orderDateText ?? this.orderDateText,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      invoiceStatus: invoiceStatus ?? this.invoiceStatus,
      remark: remark ?? this.remark,
      items: items ?? this.items,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class OrderFormItemState {
  const OrderFormItemState({
    this.productUuid = '',
    this.productName = '',
    this.productCode = '',
    this.specification = '',
    this.quantityValue = '',
    this.quantityUnit = '',
    this.saleAmountYuan = '',
    this.costAmountYuan = '',
    this.supplierUuid = '',
    this.remark = '',
  });

  final String productUuid;
  final String productName;
  final String productCode;
  final String specification;
  final String quantityValue;
  final String quantityUnit;
  final String saleAmountYuan;
  final String costAmountYuan;
  final String supplierUuid;
  final String remark;

  OrderFormItemState copyWith({
    String? productUuid,
    String? productName,
    String? productCode,
    String? specification,
    String? quantityValue,
    String? quantityUnit,
    String? saleAmountYuan,
    String? costAmountYuan,
    String? supplierUuid,
    String? remark,
  }) {
    return OrderFormItemState(
      productUuid: productUuid ?? this.productUuid,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      specification: specification ?? this.specification,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      saleAmountYuan: saleAmountYuan ?? this.saleAmountYuan,
      costAmountYuan: costAmountYuan ?? this.costAmountYuan,
      supplierUuid: supplierUuid ?? this.supplierUuid,
      remark: remark ?? this.remark,
    );
  }
}

class OrderFormViewModel extends AsyncNotifier<OrderFormState> {
  OrderFormViewModel(this.orderUuid);

  final String? orderUuid;

  @override
  Future<OrderFormState> build() async {
    if (orderUuid == null) {
      return const OrderFormState();
    }

    final detail = await ref
        .read(orderServiceProvider)
        .getOrderDetail(orderUuid!);
    if (detail == null) {
      return OrderFormState(orderUuid: orderUuid, errorMessage: '订单不存在或已删除。');
    }

    return OrderFormState(
      orderUuid: detail.order.uuid,
      orderNo: detail.order.orderNo,
      customerUuid: detail.order.customerUuid ?? '',
      orderDateText: _formatDate(detail.order.orderDate),
      orderStatus: detail.order.orderStatus,
      paymentStatus: detail.order.paymentStatus,
      invoiceStatus: detail.order.invoiceStatus,
      remark: detail.order.remark ?? '',
      items: detail.items.isEmpty
          ? const [OrderFormItemState()]
          : detail.items
                .map(
                  (item) => OrderFormItemState(
                    productUuid: item.productUuid ?? '',
                    productName: item.productNameSnapshot,
                    productCode: item.productCodeSnapshot ?? '',
                    specification: item.specificationSnapshot ?? '',
                    quantityValue: item.quantityValue?.toString() ?? '',
                    quantityUnit: item.quantityUnit ?? '',
                    saleAmountYuan: formatFenToYuan(item.saleAmount),
                    costAmountYuan: formatFenToYuan(item.costAmount),
                    supplierUuid: item.supplierUuid ?? '',
                    remark: item.remark ?? '',
                  ),
                )
                .toList(),
    );
  }

  void updateBasic({
    String? orderNo,
    String? customerUuid,
    String? orderDateText,
    String? orderStatus,
    String? paymentStatus,
    String? invoiceStatus,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        orderNo: orderNo,
        customerUuid: customerUuid,
        orderDateText: orderDateText,
        orderStatus: orderStatus,
        paymentStatus: paymentStatus,
        invoiceStatus: invoiceStatus,
        remark: remark,
        clearError: true,
      ),
    );
  }

  void addItem() {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        items: [...current.items, const OrderFormItemState()],
        clearError: true,
      ),
    );
  }

  void removeItem(int index) {
    final current = state.value;
    if (current == null || current.items.length == 1) {
      return;
    }

    final items = [...current.items]..removeAt(index);
    state = AsyncValue.data(current.copyWith(items: items, clearError: true));
  }

  void updateItem(int index, OrderFormItemState item) {
    final current = state.value;
    if (current == null || index < 0 || index >= current.items.length) {
      return;
    }

    final items = [...current.items];
    items[index] = item;
    state = AsyncValue.data(current.copyWith(items: items, clearError: true));
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
      final service = ref.read(orderServiceProvider);
      final items = _buildItemInputs(current);

      if (current.isEditing) {
        await service.updateOrder(
          current.orderUuid!,
          UpdateOrderInput(
            customerUuid: _blankToNull(current.customerUuid),
            orderDate: _parseDate(current.orderDateText),
            orderStatus: current.orderStatus,
            paymentStatus: current.paymentStatus,
            invoiceStatus: current.invoiceStatus,
            remark: _blankToNull(current.remark),
          ),
        );
        await service.replaceOrderItems(current.orderUuid!, items);
        await service.refreshOrderStatus(current.orderUuid!);
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.orderUuid;
      }

      final order = await service.createOrder(
        CreateOrderInput(
          orderNo: current.orderNo.trim(),
          customerUuid: _blankToNull(current.customerUuid),
          orderDate: _parseDate(current.orderDateText),
          orderStatus: current.orderStatus,
          paymentStatus: current.paymentStatus,
          invoiceStatus: current.invoiceStatus,
          remark: _blankToNull(current.remark),
          items: items,
        ),
      );
      final savedUuid = order?.uuid;
      state = AsyncValue.data(current.copyWith(orderUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  List<CreateOrderItemInput> _buildItemInputs(OrderFormState current) {
    return current.items
        .where((item) => item.productName.trim().isNotEmpty)
        .map(
          (item) => CreateOrderItemInput(
            productUuid: _blankToNull(item.productUuid),
            productNameSnapshot: item.productName.trim(),
            productCodeSnapshot: _blankToNull(item.productCode),
            specificationSnapshot: _blankToNull(item.specification),
            quantityValue: _parseQuantity(item.quantityValue),
            quantityUnit: _blankToNull(item.quantityUnit),
            saleAmount: parseYuanToFen(item.saleAmountYuan),
            costAmount: parseYuanToFen(item.costAmountYuan),
            supplierUuid: _blankToNull(item.supplierUuid),
            remark: _blankToNull(item.remark),
          ),
        )
        .toList();
  }

  String? _validate(OrderFormState current) {
    if (current.orderNo.trim().isEmpty) {
      return '请填写订单号。';
    }

    if (_parseDate(current.orderDateText) == null &&
        current.orderDateText.trim().isNotEmpty) {
      return '下单时间格式应为 YYYY-MM-DD。';
    }

    final validItems = current.items
        .where((item) => item.productName.trim().isNotEmpty)
        .toList();
    if (validItems.isEmpty) {
      return '至少添加一条产品明细。';
    }

    for (final item in validItems) {
      if (_parseQuantity(item.quantityValue) == null &&
          item.quantityValue.trim().isNotEmpty) {
        return '数量必须是数字。';
      }
    }

    return null;
  }

  static int parseYuanToFen(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 0;
    }

    final normalized = trimmed.replaceAll(RegExp(r'[,\s¥￥]'), '');
    final match = RegExp(r'^(-)?(\d+)(?:\.(\d{1,2}))?$').firstMatch(normalized);
    if (match == null) {
      return 0;
    }

    final sign = match.group(1) == '-' ? -1 : 1;
    final yuan = int.parse(match.group(2)!);
    final fenText = (match.group(3) ?? '').padRight(2, '0');
    final fen = fenText.isEmpty ? 0 : int.parse(fenText);
    return sign * (yuan * 100 + fen);
  }

  static String formatFenToYuan(int amount) {
    final sign = amount < 0 ? '-' : '';
    final absolute = amount.abs();
    final yuan = absolute ~/ 100;
    final fen = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$yuan.$fen';
  }

  double? _parseQuantity(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    return double.tryParse(trimmed);
  }

  DateTime? _parseDate(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    return DateTime.tryParse(trimmed);
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '';
    }

    String two(int number) => number.toString().padLeft(2, '0');
    return '${value.year}-${two(value.month)}-${two(value.day)}';
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
