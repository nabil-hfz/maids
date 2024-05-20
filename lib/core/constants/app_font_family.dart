import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

abstract class AppFontFamily {
  const AppFontFamily._();

  static String? cairo = GoogleFonts.cairo().fontFamily;
  static String? ptSans = GoogleFonts.ptSans().fontFamily;
}

abstract class AppFontWeight {
  const AppFontWeight._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
