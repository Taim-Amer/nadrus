import 'package:flutter/material.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? TColors.dark : Colors.grey[300]!,
      highlightColor: dark ? TColors.darkerGrey : Colors.grey[100]!,
      child: TRoundedContainer(
        radius: radius,
        width: width,
        height: height,
        backgroundColor: Colors.white,
        // backgroundColor: Colors.white,
      ),
    );
  }
}
