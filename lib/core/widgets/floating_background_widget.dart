import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingBackgroundWidget extends StatelessWidget {
  const FloatingBackgroundWidget({
    super.key,
    required Animation<double> animatedScale,
    required this.height,
    required this.width,
    required this.colorCircle,
  }) : _animatedScale = animatedScale;

  final Animation<double> _animatedScale;
  final double height;
  final double width;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animatedScale,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          color: colorCircle,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
