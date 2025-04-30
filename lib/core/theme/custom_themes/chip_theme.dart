import 'package:nadros/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme(bool isSelected) {
    return ChipThemeData(
      disabledColor: const Color(0xFFF4F4F4),
      backgroundColor: isSelected ? Colors.transparent : const Color(0xFFF4F4F4),
      labelStyle: TextStyle(
        color: isSelected
            ? TColors.primary
            : TColors.secondary, // Dynamically set the text color
      ),
      selectedColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      checkmarkColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          color: isSelected ? Color(0xFF19A7CE): Colors.transparent,
          width: 1.5,
        ),
      ),
    );
  }

  static ChipThemeData darkChipTheme(bool isSelected) {
    return ChipThemeData(
      disabledColor: Colors.white,
      backgroundColor: isSelected ? TColors.buttonPrimary : Colors.white,
      labelStyle: TextStyle(
        color: isSelected
            ? Colors.white
            : TColors.buttonPrimary, // Dynamically set the text color
      ),
      selectedColor: TColors.buttonPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: isSelected ? Colors.white : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: isSelected ? Colors.transparent : TColors.buttonPrimary,
          width: 1.5,
        ),
      ),
    );
  }
}
