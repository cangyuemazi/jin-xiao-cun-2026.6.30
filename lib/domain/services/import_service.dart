class ImportPreviewIssue {
  const ImportPreviewIssue({
    required this.rowNumber,
    required this.field,
    required this.code,
    required this.message,
  });

  final int rowNumber;
  final String field;
  final String code;
  final String message;
}

class ImportPreviewReport {
  const ImportPreviewReport({required this.totalRows, required this.issues});

  final int totalRows;
  final List<ImportPreviewIssue> issues;

  bool get hasIssues => issues.isNotEmpty;
}

class QuantityParseResult {
  const QuantityParseResult({required this.value, required this.unit});

  final double value;
  final String unit;
}

class ImportService {
  static const orderImportHeaders = [
    '序号',
    '产品名称',
    '货号',
    '规格',
    '重量',
    '客户下单时间',
    '给客户发货时间',
    '成本价',
    '销售金额',
    '收件人信息',
    '厂家',
    '发货方式',
    '快递单号',
    '备注',
  ];

  ImportPreviewReport buildOrderImportPreview(List<Map<String, String?>> rows) {
    final issues = <ImportPreviewIssue>[];
    final orderNumbers = <String>{};
    final trackingNumbers = <String>{};

    for (var index = 0; index < rows.length; index += 1) {
      final row = rows[index];
      final rowNumber = index + 2;

      _checkDuplicate(
        issues: issues,
        rowNumber: rowNumber,
        field: '序号',
        value: row['序号'],
        seenValues: orderNumbers,
        code: 'duplicate_order_no',
        message: '重复订单号。',
      );
      _checkDuplicate(
        issues: issues,
        rowNumber: rowNumber,
        field: '快递单号',
        value: row['快递单号'],
        seenValues: trackingNumbers,
        code: 'duplicate_tracking_no',
        message: '重复快递单号。',
      );

      if (_isBlank(row['销售金额'])) {
        issues.add(_issue(rowNumber, '销售金额', 'missing_sale_amount', '销售金额为空。'));
      } else if (parseMoneyToFen(row['销售金额']) == null) {
        issues.add(_issue(rowNumber, '销售金额', 'invalid_money', '无法识别金额。'));
      }

      if (_isBlank(row['成本价'])) {
        issues.add(_issue(rowNumber, '成本价', 'missing_cost', '成本为空。'));
      } else if (parseMoneyToFen(row['成本价']) == null) {
        issues.add(_issue(rowNumber, '成本价', 'invalid_money', '无法识别金额。'));
      }

      if (!_isBlank(row['重量']) && parseQuantity(row['重量']) == null) {
        issues.add(_issue(rowNumber, '重量', 'invalid_quantity', '无法识别数量单位。'));
      }

      if (_isBlank(row['收件人信息'])) {
        issues.add(
          _issue(rowNumber, '收件人信息', 'missing_customer_phone', '客户电话为空。'),
        );
      }

      if (_isBlank(row['厂家'])) {
        issues.add(_issue(rowNumber, '厂家', 'missing_supplier', '厂家为空。'));
      }

      if (_isBlank(row['快递单号'])) {
        issues.add(_issue(rowNumber, '快递单号', 'missing_tracking_no', '快递单号为空。'));
      }

      _checkDate(issues, rowNumber, '客户下单时间', row['客户下单时间']);
      _checkDate(issues, rowNumber, '给客户发货时间', row['给客户发货时间']);
    }

    return ImportPreviewReport(totalRows: rows.length, issues: issues);
  }

  int? parseMoneyToFen(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final normalized = value.replaceAll(RegExp(r'[,\s¥￥]'), '');
    final match = RegExp(r'^(-)?(\d+)(?:\.(\d{1,2}))?$').firstMatch(normalized);
    if (match == null) {
      return null;
    }

    final sign = match.group(1) == '-' ? -1 : 1;
    final yuan = int.parse(match.group(2)!);
    final centsText = (match.group(3) ?? '').padRight(2, '0');
    final cents = centsText.isEmpty ? 0 : int.parse(centsText);

    return sign * (yuan * 100 + cents);
  }

  QuantityParseResult? parseQuantity(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final match = RegExp(
      r'^([0-9]+(?:\.[0-9]+)?)\s*([a-zA-Zμµ\u4e00-\u9fa5]+)$',
    ).firstMatch(value);
    if (match == null) {
      return null;
    }

    return QuantityParseResult(
      value: double.parse(match.group(1)!),
      unit: match.group(2)!,
    );
  }

  DateTime? parseDate(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    final normalized = value.replaceAll('/', '-').replaceAll('.', '-');
    return DateTime.tryParse(normalized);
  }

  void _checkDuplicate({
    required List<ImportPreviewIssue> issues,
    required int rowNumber,
    required String field,
    required String? value,
    required Set<String> seenValues,
    required String code,
    required String message,
  }) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return;
    }

    if (!seenValues.add(normalized)) {
      issues.add(_issue(rowNumber, field, code, message));
    }
  }

  void _checkDate(
    List<ImportPreviewIssue> issues,
    int rowNumber,
    String field,
    String? value,
  ) {
    if (_isBlank(value)) {
      return;
    }

    if (parseDate(value) == null) {
      issues.add(_issue(rowNumber, field, 'invalid_date', '日期格式异常。'));
    }
  }

  ImportPreviewIssue _issue(
    int rowNumber,
    String field,
    String code,
    String message,
  ) {
    return ImportPreviewIssue(
      rowNumber: rowNumber,
      field: field,
      code: code,
      message: message,
    );
  }

  bool _isBlank(String? value) {
    return value == null || value.trim().isEmpty;
  }
}
