import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nadros/core/utils/font.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomElevetadButton extends StatelessWidget {
  const CustomElevetadButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: ZoomTapAnimation(
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              title,
              style: TextStyles.font16white600,
            ),
          ),
        ),
      ),
    );
  }
}
