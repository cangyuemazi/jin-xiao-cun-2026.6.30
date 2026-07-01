import 'package:flutter/material.dart';

import '../../../shared/widgets/status_badge.dart';

class ShipmentStatusBadge extends StatelessWidget {
  const ShipmentStatusBadge({
    super.key,
    required this.status,
    required this.label,
  });

  final String status;
  final String label;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(label: label, tone: _tone(status), icon: _icon(status));
  }

  StatusBadgeTone _tone(String status) {
    return switch (status) {
      'shipped' || 'completed' => StatusBadgeTone.success,
      'partial_shipped' => StatusBadgeTone.warning,
      'pending' => StatusBadgeTone.info,
      'cancelled' => StatusBadgeTone.danger,
      _ => StatusBadgeTone.neutral,
    };
  }

  IconData _icon(String status) {
    return switch (status) {
      'shipped' || 'completed' => Icons.check_circle_outline,
      'partial_shipped' => Icons.call_split_outlined,
      'pending' => Icons.local_shipping_outlined,
      'cancelled' => Icons.cancel_outlined,
      _ => Icons.circle_outlined,
    };
  }
}
