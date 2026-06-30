import 'package:flutter/material.dart';

class AppRadius {
  const AppRadius._();

  static const double noneValue = 0;
  static const double xsValue = 4;
  static const double smValue = 6;
  static const double mdValue = 8;

  static const BorderRadius none = BorderRadius.zero;
  static const BorderRadius xs = BorderRadius.all(Radius.circular(xsValue));
  static const BorderRadius sm = BorderRadius.all(Radius.circular(smValue));
  static const BorderRadius md = BorderRadius.all(Radius.circular(mdValue));

  static const BorderRadius card = md;
  static const BorderRadius button = sm;
  static const BorderRadius input = sm;
  static const BorderRadius dialog = md;
  static const BorderRadius table = md;
}
