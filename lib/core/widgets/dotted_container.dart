import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';

class TDottedContainer extends StatelessWidget {
  const TDottedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TConsts.cardRadiusLg,
    this.child,
    this.borderColor = TColors.borderPrimary,
    this.backgroundColor = Colors.transparent,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [12, 8],
      strokeWidth: 3,
      borderType: BorderType.RRect,
      radius: Radius.circular(radius),
      padding: const EdgeInsets.all(6),
      color: borderColor,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
