// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nadros/core/utils/colors.dart';

class TStyle {
  TStyle._();

  static BoxDecoration TLinearGradient() => const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.topLeft,
        colors: [
          TColors.secondary,
          TColors.primary,
        ],
      ));
}
