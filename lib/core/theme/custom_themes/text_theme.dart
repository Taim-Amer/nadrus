import 'package:flutter/material.dart';
import 'package:nadros/core/utils/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: TColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: TColors.textSecondary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: TColors.textSecondary),
    titleLarge: const TextStyle().copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: TColors.textPrimary),
    titleMedium: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: TColors.textPrimary),
    titleSmall: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: TColors.textSecondary),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: TColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: TColors.textPrimary),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.black.withOpacity(.5)),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Almarai',
        color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.white.withOpacity(.5)),
  );
}
