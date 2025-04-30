import 'package:flutter/material.dart';
import 'package:nadros/core/utils/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static final lightNavigationBarTheme = NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: TColors.accent);
        }
        return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF888888));
      },
    ),
  );

  static final darkNavigationBarTheme = NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: TColors.accent);
        }
        return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF888888));
      },
    ),
  );
}
