import 'package:flutter/material.dart';

class TConsts {
  // Padding and margin sizes
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  // Icon sizes
  static const double iconXs = 12;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 32;

  // Font sizes
  static const double fontSizeSm = 14;
  static const double fontSizeMd = 16;
  static const double fontSizeLg = 18;

  // Button sizes
  static const double buttonHeight = 18;
  static const double buttonRadius = 12;
  static const double buttonWidth = 120;

  // AppBar height
  static const double appBarHeight = 40;

  // Image sizes
  static const double imageThumbSize = 80;

  // Default spacing between sections
  static const double defaultPaddingSpace = 16;
  static const double secondaryPaddingSpace = 24;
  static const double defaultSpace = 16;
  static const double spaceBtwItems = 14;
  static const double spaceBtwSections = 24;
  static const double spaceBtwTitleSub = 21;
  static const double spaceBtwInputField = 20;

  // Border radius
  static const double borderRadiusSm = 4;
  static const double borderRadiusMd = 8;
  static const double borderRadiusLg = 12;

  // Divider height
  static const double dividerHeight = 1;

  // Input field
  static const double inputFieldRadius = 12;

  // Card sizes
  static const double cardRadiusLg = 16;
  static const double cardRadiusMd = 12;
  static const double cardRadiusSm = 10;
  static const double cardRadiusXs = 6;
  static const double cardElevation = 2;

  // Image carousel height
  static const double imageCarouselHeight = 200;

  // Loading indicator size
  static const double loadingIndicatorSize = 36;

  // Grid view spacing
  static const double gridViewSpacing = 16;

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 15,
      offset: const Offset(0, 2),
      color: Colors.grey.withOpacity(0.5),
    ),
  ];

  static const String uiCountryCode = '+963';
  static const String apiCountryCode = '+963';
  static const String supportPhoneNumber = "963997421905";
  static const List<String> arabicAlphabets = [
    'أ',
    "ب",
    "ت",
    "ج",
    "د",
    "و",
    "ز"
  ];
}
