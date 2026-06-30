import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> none = [];

  static const List<BoxShadow> soft = [
    BoxShadow(color: Color(0x0F17202A), blurRadius: 18, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> floating = [
    BoxShadow(color: Color(0x1417202A), blurRadius: 28, offset: Offset(0, 14)),
  ];
}
