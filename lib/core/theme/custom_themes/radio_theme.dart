import 'package:nadros/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TRadioTheme {
  TRadioTheme._();

  static final lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(TColors.buttonPrimary),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );

  static final darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(TColors.buttonPrimary),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );
}
