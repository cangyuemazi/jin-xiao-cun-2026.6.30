import 'package:flutter/material.dart';

import '../../../shared/widgets/status_badge.dart';

class CustomerTypeBadge extends StatelessWidget {
  const CustomerTypeBadge({super.key, required this.customerType});

  final String customerType;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(
      label: customerType,
      tone: StatusBadgeTone.info,
      icon: Icons.person_outline,
    );
  }
}
