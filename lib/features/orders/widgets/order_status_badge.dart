import 'package:flutter/material.dart';

import '../../../shared/widgets/status_badge.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({super.key, required this.status, this.label});

  final String status;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(label: label ?? status, tone: _tone(status));
  }

  StatusBadgeTone _tone(String status) {
    return switch (status) {
      'completed' || 'shipped' => StatusBadgeTone.success,
      'partial_shipped' ||
      'purchasing' ||
      'in_production' ||
      'ready_to_ship' => StatusBadgeTone.warning,
      'cancelled' || 'after_sales' => StatusBadgeTone.danger,
      'confirmed' => StatusBadgeTone.info,
      _ => StatusBadgeTone.neutral,
    };
  }
}

class ShipmentStatusBadge extends StatelessWidget {
  const ShipmentStatusBadge({super.key, required this.status, this.label});

  final String status;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(label: label ?? status, tone: _tone(status));
  }

  StatusBadgeTone _tone(String status) {
    return switch (status) {
      'shipped' => StatusBadgeTone.success,
      'partial_shipped' => StatusBadgeTone.warning,
      'pending' => StatusBadgeTone.info,
      'cancelled' => StatusBadgeTone.danger,
      _ => StatusBadgeTone.neutral,
    };
  }
}
