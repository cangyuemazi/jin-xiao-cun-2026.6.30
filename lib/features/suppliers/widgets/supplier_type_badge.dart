import 'package:flutter/material.dart';

import '../../../shared/widgets/status_badge.dart';

class SupplierTypeBadge extends StatelessWidget {
  const SupplierTypeBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(
      label: label,
      tone: StatusBadgeTone.info,
      icon: Icons.factory_outlined,
    );
  }
}
