import 'package:flutter/material.dart';

class AppRadius {
  const AppRadius._();

  static const double xs = 4;
  static const double sm = 6;
  static const double md = 8;
  static const double lg = 12;
  static const double xl = 16;
  static const double pill = 999;

  static const BorderRadius none = BorderRadius.zero;

  static const BorderRadius borderXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderPill = BorderRadius.all(Radius.circular(pill));

  static const BorderRadius card = borderLg;
  static const BorderRadius button = borderMd;
  static const BorderRadius input = borderMd;
  static const BorderRadius dialog = borderLg;
  static const BorderRadius table = borderLg;
  static const BorderRadius badge = borderSm;
}
