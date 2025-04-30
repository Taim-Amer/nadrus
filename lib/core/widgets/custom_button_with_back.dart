import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/widgets/custom_loading_widget.dart';
import 'package:nadros/core/widgets/wraper_widget.dart';

class CustomButtonWithBack extends StatefulWidget {
  final String title;
  final String? svg;
  final double? radius;
  final double? svgSize;
  final Color color;
  final bool isColorsToggled;
  final void Function()? onTap;
  final bool isLoading;
  final void Function()? onBackTap;
  final Color? backColor;
  final Color? backIconColor;
  final double? backIconSize;
  final IconData? backIcon;

  const CustomButtonWithBack({
    super.key,
    this.color = TColors.primary,
    required this.title,
    this.onTap,
    this.isColorsToggled = false,
    this.svg,
    this.radius,
    this.backColor,
    this.backIconColor,
    this.onBackTap,
    this.backIcon,
    this.backIconSize,
    this.isLoading = false,
    this.svgSize,
  });

  @override
  State<CustomButtonWithBack> createState() => _CustomButtonWithBackState();
}

class _CustomButtonWithBackState extends State<CustomButtonWithBack> {
  double height = 51;

  @override
  void initState() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
          setState(() {});
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: double.infinity,
      child: WrapperWidget(
        condition: widget.isLoading,
        widget: (child) => CustomLoadingWidget(height: height.h, child: child),
        fallBack: (child) => child,
        child: MeasureSizeBuilder(builder: (context, size) {
          height = size.height;
          return GestureDetector(
            onTap: widget.onTap,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: widget.onBackTap ?? () => Get.back(),
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: widget.backColor ?? const Color(0xff9B9B9B),
                        borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(widget.radius ?? 38.r)),
                      ),
                      child: Center(
                        child: Icon(
                          size: widget.backIconSize ?? 14.sp,
                          color: widget.backIconColor ?? Colors.white,
                          widget.backIcon ?? Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                  ),
                ),
                3.horizontalSpace,
                Expanded(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.horizontal(
                          end: Radius.circular(widget.radius ?? 38.r)),
                      color:
                          widget.isColorsToggled ? TColors.white : widget.color,
                      border: widget.isColorsToggled
                          ? Border.all(width: 1, color: widget.color)
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.svg != null) ...[
                          SizedBox(
                            width: widget.svgSize ?? 45.h,
                            height: widget.svgSize ?? 45.h,
                            child: SvgPicture.asset(widget.svg!),
                          ),
                          8.horizontalSpace,
                        ],
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: !widget.isColorsToggled
                                ? TColors.white
                                : widget.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
