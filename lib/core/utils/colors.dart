import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF19A7CE);
  // static const Color primary = TColors.blue;
  static const Color secondary = Color(0xFF060C3D);
  static const Color accent = Color(0xFFFFA500);

  static const Color redColor = Color(0xFFFF7A7A);
  static const Color greenColor = Color(0xFF71BA4E);
  static const Color orangeColor = Color(0xffFEAA4E);

  // Text Colors
  static const Color textPrimary = Color(0xFF3C3C3C);
  static Color textSecondary = const Color(0xFF000000).withOpacity(.5);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF5F5F5);
  static const Color dark = Color(0xFF272727);
  static const Color backgroundColor = Color(0xffF8F8FF);
  static const Color greyBackgroundColor = Color(0xffEFEFEF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(.1);

  // Button Colors
  // static const Color buttonPrimary = Color(0xFF4B68FF);
  static const Color buttonPrimary = Color(0xFF00B99C);

  static const Color buttonSecondary = Color(0xFF1BB1C7);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color info = Color(0xFF1976D2);

  // Neutral shades
  static const Color blue = Color(0xFF36B4FE);
  static const Color black2 = Color(0xFF232323);
  static const Color black = Color(0xff121212);
  static const Color deepBlack = Colors.black;
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFA7A7A7);
  static const Color softGrey = Color(0xFFFCFAFA);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkBlue = Color(0xFF013C6D);
  static Color lightPurple = const Color(0xff6A5ACD).withOpacity(0.15);
  static Color textFeild = const Color(0xffF8F8FA);
}
