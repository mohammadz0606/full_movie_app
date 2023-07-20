import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteTitleLarge =>
      _poppinsTextTheme.titleLarge!.copyWith(
        fontSize: 20.sp,
        color: Colors.white,
      );

  static TextStyle get whiteTitleMedium =>
      _poppinsTextTheme.titleMedium!.copyWith(
        fontSize: 16.sp,
        color: Colors.white,
      );

  static TextStyle get whiteBodyMedium =>
      _poppinsTextTheme.bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _whiteHeadlineSmall =>
      _poppinsTextTheme.headlineSmall!.copyWith(
        fontSize: 24.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteLabelLarge =>
      _poppinsTextTheme.labelLarge!.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(
        titleLarge: _whiteTitleLarge,
        bodyMedium: whiteBodyMedium,
        titleMedium: whiteTitleMedium,
        headlineSmall: _whiteHeadlineSmall,
        labelLarge: _whiteLabelLarge,
      );
}
