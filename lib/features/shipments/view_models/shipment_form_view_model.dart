import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../domain/services/shipment_service.dart';

final shipmentFormViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<ShipmentFormViewModel, ShipmentFormState, String?>(
      ShipmentFormViewModel.new,
    );

class ShipmentOptionState {
  const ShipmentOptionState({required this.key, required this.label});

  final String key;
  final String label;
}

class ShipmentOrderOptionState {
  const ShipmentOrderOptionState({
    required this.orderUuid,
    required this.orderNo,
    this.customerName,
  });

  final String orderUuid;
  final String orderNo;
  final String? customerName;

  String get label {
    return customerName == null || customerName!.isEmpty
        ? orderNo
        : '$orderNo / $customerName';
  }

  factory ShipmentOrderOptionState.fromOption(ShipmentOrderOption option) {
    return ShipmentOrderOptionState(
      orderUuid: option.orderUuid,
      orderNo: option.orderNo,
      customerName: option.customerName,
    );
  }
}

class ShipmentAddressOptionState {
  const ShipmentAddressOptionState({required this.uuid, required this.label});

  final String uuid;
  final String label;

  factory ShipmentAddressOptionState.fromOption(ShipmentAddressOption option) {
    return ShipmentAddressOptionState(uuid: option.uuid, label: option.label);
  }
}

class ShipmentFormItemState {
  const ShipmentFormItemState({
    required this.orderItemUuid,
    required this.productName,
    required this.shippedQuantityText,
    required this.remainingQuantityText,
    required this.isAlreadyFullyShipped,
    this.productUuid = '',
    this.productCode = '',
    this.specification = '',
    this.orderedQuantityText = '',
    this.quantityValue = '',
    this.quantityUnit = '',
    this.isSelected = false,
    this.isFullShipment = false,
    this.remark = '',
  });

  final String orderItemUuid;
  final String productUuid;
  final String productName;
  final String productCode;
  final String specification;
  final String orderedQuantityText;
  final String shippedQuantityText;
  final String remainingQuantityText;
  final String quantityValue;
  final String quantityUnit;
  final bool isSelected;
  final bool isFullShipment;
  final bool isAlreadyFullyShipped;
  final String remark;

  ShipmentFormItemState copyWith({
    String? quantityValue,
    String? quantityUnit,
    bool? isSelected,
    bool? isFullShipment,
    String? remark,
  }) {
    return ShipmentFormItemState(
      orderItemUuid: orderItemUuid,
      productUuid: productUuid,
      productName: productName,
      productCode: productCode,
      specification: specification,
      orderedQuantityText: orderedQuantityText,
      shippedQuantityText: shippedQuantityText,
      remainingQuantityText: remainingQuantityText,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      isSelected: isSelected ?? this.isSelected,
      isFullShipment: isFullShipment ?? this.isFullShipment,
      isAlreadyFullyShipped: isAlreadyFullyShipped,
      remark: remark ?? this.remark,
    );
  }

  factory ShipmentFormItemState.fromOption(ShipmentOrderItemOption option) {
    final suggestedQuantity = option.remainingQuantity ?? option.quantityValue;

    return ShipmentFormItemState(
      orderItemUuid: option.orderItemUuid,
      productUuid: option.productUuid ?? '',
      productName: option.productNameSnapshot,
      productCode: option.productCodeSnapshot ?? '',
      specification: option.specificationSnapshot ?? '',
      orderedQuantityText: _formatQuantity(option.quantityValue),
      shippedQuantityText: _formatQuantity(option.shippedQuantity),
      remainingQuantityText: _formatQuantity(option.remainingQuantity),
      quantityValue: option.isFullyShipped
          ? ''
          : _formatQuantity(suggestedQuantity),
      quantityUnit: option.quantityUnit ?? '',
      isAlreadyFullyShipped: option.isFullyShipped,
    );
  }

  static String _formatQuantity(double? value) {
    if (value == null) {
      return '-';
    }

    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toString();
  }
}

class ShipmentFormState {
  const ShipmentFormState({
    this.shipmentUuid,
    this.shipmentNo = '',
    this.orderUuid = '',
    this.customerUuid = '',
    this.customerName = '',
    this.addressUuid = '',
    this.carrier = '',
    this.trackingNo = '',
    this.shipDateText = '',
    this.shippingFeeYuan = '',
    this.remark = '',
    this.orderOptions = const [],
    this.addressOptions = const [],
    this.carrierOptions = const [],
    this.items = const [],
    this.errorMessage,
  });

  final String? shipmentUuid;
  final String shipmentNo;
  final String orderUuid;
  final String customerUuid;
  final String customerName;
  final String addressUuid;
  final String carrier;
  final String trackingNo;
  final String shipDateText;
  final String shippingFeeYuan;
  final String remark;
  final List<ShipmentOrderOptionState> orderOptions;
  final List<ShipmentAddressOptionState> addressOptions;
  final List<ShipmentOptionState> carrierOptions;
  final List<ShipmentFormItemState> items;
  final String? errorMessage;

  bool get isEditing => shipmentUuid != null;

  ShipmentFormState copyWith({
    String? shipmentUuid,
    String? shipmentNo,
    String? orderUuid,
    String? customerUuid,
    String? customerName,
    String? addressUuid,
    String? carrier,
    String? trackingNo,
    String? shipDateText,
    String? shippingFeeYuan,
    String? remark,
    List<ShipmentOrderOptionState>? orderOptions,
    List<ShipmentAddressOptionState>? addressOptions,
    List<ShipmentOptionState>? carrierOptions,
    List<ShipmentFormItemState>? items,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ShipmentFormState(
      shipmentUuid: shipmentUuid ?? this.shipmentUuid,
      shipmentNo: shipmentNo ?? this.shipmentNo,
      orderUuid: orderUuid ?? this.orderUuid,
      customerUuid: customerUuid ?? this.customerUuid,
      customerName: customerName ?? this.customerName,
      addressUuid: addressUuid ?? this.addressUuid,
      carrier: carrier ?? this.carrier,
      trackingNo: trackingNo ?? this.trackingNo,
      shipDateText: shipDateText ?? this.shipDateText,
      shippingFeeYuan: shippingFeeYuan ?? this.shippingFeeYuan,
      remark: remark ?? this.remark,
      orderOptions: orderOptions ?? this.orderOptions,
      addressOptions: addressOptions ?? this.addressOptions,
      carrierOptions: carrierOptions ?? this.carrierOptions,
      items: items ?? this.items,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class ShipmentFormViewModel extends AsyncNotifier<ShipmentFormState> {
  ShipmentFormViewModel(this.shipmentUuid);

  final String? shipmentUuid;

  @override
  Future<ShipmentFormState> build() async {
    final service = ref.read(shipmentServiceProvider);
    final orderOptions = (await service.listOrderOptions())
        .map(ShipmentOrderOptionState.fromOption)
        .toList();
    final carrierOptions = (await service.listCarrierOptions())
        .map(
          (option) => ShipmentOptionState(key: option.key, label: option.label),
        )
        .toList();

    if (shipmentUuid == null) {
      return ShipmentFormState(
        shipmentNo: _generateShipmentNo(),
        orderOptions: orderOptions,
        carrierOptions: carrierOptions,
      );
    }

    final detail = await service.getShipmentDetail(shipmentUuid!);
    if (detail == null) {
      return ShipmentFormState(
        shipmentUuid: shipmentUuid,
        orderOptions: orderOptions,
        carrierOptions: carrierOptions,
        errorMessage: '发货单不存在或已删除。',
      );
    }

    final context = detail.shipment.orderUuid == null
        ? null
        : await service.getOrderContext(detail.shipment.orderUuid!);

    return ShipmentFormState(
      shipmentUuid: detail.shipment.uuid,
      shipmentNo: detail.shipment.shipmentNo,
      orderUuid: detail.shipment.orderUuid ?? '',
      customerUuid: detail.shipment.customerUuid ?? '',
      customerName: detail.customerName ?? '',
      addressUuid: detail.shipment.addressUuid ?? '',
      carrier: detail.shipment.carrier ?? '',
      trackingNo: detail.shipment.trackingNo ?? '',
      shipDateText: _formatDate(detail.shipment.shipDate),
      shippingFeeYuan: formatFenToYuan(detail.shipment.shippingFee),
      remark: detail.shipment.remark ?? '',
      orderOptions: orderOptions,
      addressOptions:
          context?.addresses
              .map(ShipmentAddressOptionState.fromOption)
              .toList() ??
          const [],
      carrierOptions: carrierOptions,
      items: detail.items
          .map(
            (item) => ShipmentFormItemState(
              orderItemUuid: item.orderItemUuid,
              productUuid: item.productUuid ?? '',
              productName: item.productNameSnapshot ?? item.productUuid ?? '-',
              shippedQuantityText: '-',
              remainingQuantityText: '-',
              quantityValue: item.quantityValue?.toString() ?? '',
              quantityUnit: item.quantityUnit ?? '',
              isSelected: true,
              isFullShipment: item.isFullShipment,
              isAlreadyFullyShipped: false,
              remark: item.remark ?? '',
            ),
          )
          .toList(),
    );
  }

  Future<void> selectOrder(String orderUuid) async {
    final current = state.value;
    if (current == null || current.isEditing) {
      return;
    }

    final context = await ref
        .read(shipmentServiceProvider)
        .getOrderContext(orderUuid);
    if (context == null) {
      state = AsyncValue.data(current.copyWith(errorMessage: '订单不存在或已删除。'));
      return;
    }

    final addressOptions = context.addresses
        .map(ShipmentAddressOptionState.fromOption)
        .toList();

    state = AsyncValue.data(
      current.copyWith(
        orderUuid: context.orderUuid,
        customerUuid: context.customerUuid ?? '',
        customerName: context.customerName ?? '',
        addressUuid: addressOptions.isEmpty ? '' : addressOptions.first.uuid,
        addressOptions: addressOptions,
        items: context.items.map(ShipmentFormItemState.fromOption).toList(),
        clearError: true,
      ),
    );
  }

  void updateBasic({
    String? shipmentNo,
    String? addressUuid,
    String? carrier,
    String? trackingNo,
    String? shipDateText,
    String? shippingFeeYuan,
    String? remark,
  }) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(
        shipmentNo: shipmentNo,
        addressUuid: addressUuid,
        carrier: carrier,
        trackingNo: trackingNo,
        shipDateText: shipDateText,
        shippingFeeYuan: shippingFeeYuan,
        remark: remark,
        clearError: true,
      ),
    );
  }

  void updateItem(
    int index, {
    String? quantityValue,
    String? quantityUnit,
    bool? isSelected,
    bool? isFullShipment,
    String? remark,
  }) {
    final current = state.value;
    if (current == null || index < 0 || index >= current.items.length) {
      return;
    }

    final items = [...current.items];
    items[index] = items[index].copyWith(
      quantityValue: quantityValue,
      quantityUnit: quantityUnit,
      isSelected: isSelected,
      isFullShipment: isFullShipment,
      remark: remark,
    );
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
      final service = ref.read(shipmentServiceProvider);

      if (current.isEditing) {
        await service.updateShipment(
          current.shipmentUuid!,
          UpdateShipmentInput(
            addressUuid: _blankToNull(current.addressUuid),
            carrier: _blankToNull(current.carrier),
            trackingNo: _blankToNull(current.trackingNo),
            shipDate: _parseDate(current.shipDateText),
            shippingFee: parseYuanToFen(current.shippingFeeYuan),
            remark: _blankToNull(current.remark),
          ),
        );
        state = AsyncValue.data(current.copyWith(clearError: true));
        return current.shipmentUuid;
      }

      final shipment = await service.createShipment(
        CreateShipmentInput(
          shipmentNo: current.shipmentNo.trim(),
          orderUuid: _blankToNull(current.orderUuid),
          customerUuid: _blankToNull(current.customerUuid),
          addressUuid: _blankToNull(current.addressUuid),
          carrier: _blankToNull(current.carrier),
          trackingNo: _blankToNull(current.trackingNo),
          shipDate: _parseDate(current.shipDateText),
          shippingFee: parseYuanToFen(current.shippingFeeYuan),
          remark: _blankToNull(current.remark),
          items: _buildItemInputs(current),
        ),
      );

      final savedUuid = shipment?.uuid;
      state = AsyncValue.data(current.copyWith(shipmentUuid: savedUuid));
      return savedUuid;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  List<CreateShipmentItemInput> _buildItemInputs(ShipmentFormState current) {
    return current.items
        .where((item) => item.isSelected && !item.isAlreadyFullyShipped)
        .map(
          (item) => CreateShipmentItemInput(
            orderUuid: current.orderUuid,
            orderItemUuid: item.orderItemUuid,
            productUuid: _blankToNull(item.productUuid),
            productNameSnapshot: item.productName,
            quantityValue: _parseQuantity(item.quantityValue),
            quantityUnit: _blankToNull(item.quantityUnit),
            isFullShipment: item.isFullShipment,
            remark: _blankToNull(item.remark),
          ),
        )
        .toList();
  }

  String? _validate(ShipmentFormState current) {
    if (current.shipmentNo.trim().isEmpty) {
      return '请填写发货单号。';
    }

    if (!current.isEditing && current.orderUuid.trim().isEmpty) {
      return '请选择关联订单。';
    }

    if (_parseDate(current.shipDateText) == null &&
        current.shipDateText.trim().isNotEmpty) {
      return '发货时间格式应为 YYYY-MM-DD。';
    }

    if (!isValidMoney(current.shippingFeeYuan)) {
      return '运费必须是有效金额。';
    }

    if (current.isEditing) {
      return null;
    }

    final selectedItems = current.items
        .where((item) => item.isSelected && !item.isAlreadyFullyShipped)
        .toList();
    if (selectedItems.isEmpty) {
      return '至少选择一个要发货的产品明细。';
    }

    for (final item in selectedItems) {
      if (!item.isFullShipment &&
          (_parseQuantity(item.quantityValue) == null ||
              _parseQuantity(item.quantityValue)! <= 0)) {
        return '发货数量必须是大于 0 的数字。';
      }
    }

    return null;
  }

  static bool isValidMoney(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return true;
    }

    return RegExp(r'^\d+(?:\.\d{1,2})?$').hasMatch(trimmed);
  }

  static int parseYuanToFen(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 0;
    }

    final match = RegExp(r'^(\d+)(?:\.(\d{1,2}))?$').firstMatch(trimmed);
    if (match == null) {
      return 0;
    }

    final yuan = int.parse(match.group(1)!);
    final fenText = (match.group(2) ?? '').padRight(2, '0');
    final fen = fenText.isEmpty ? 0 : int.parse(fenText);
    return yuan * 100 + fen;
  }

  static String formatFenToYuan(int amount) {
    final yuan = amount ~/ 100;
    final fen = (amount % 100).toString().padLeft(2, '0');
    return '$yuan.$fen';
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

  String _generateShipmentNo() {
    final now = DateTime.now();
    String two(int number) => number.toString().padLeft(2, '0');
    return 'FH${now.year}${two(now.month)}${two(now.day)}'
        '${two(now.hour)}${two(now.minute)}${two(now.second)}';
  }

  String? _blankToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
