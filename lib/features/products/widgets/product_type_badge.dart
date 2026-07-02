import 'package:flutter/material.dart';

import '../../../shared/widgets/status_badge.dart';

class ProductTypeBadge extends StatelessWidget {
  const ProductTypeBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return StatusBadge(
      label: label,
      tone: StatusBadgeTone.purple,
      icon: Icons.category_outlined,
    );
  }
}
