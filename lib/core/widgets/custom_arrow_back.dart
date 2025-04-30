// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';

class CustomArrowBack extends StatelessWidget {
  final Color? backgroundColor;
  final Color? arrowColor;

  const CustomArrowBack({
    super.key,
    this.backgroundColor,
    this.arrowColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return GestureDetector(
      onTap: () => Get.back(),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Transform.flip(
          flipX: Get.locale == const Locale('ar'),
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
