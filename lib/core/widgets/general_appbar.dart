import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/custom_arrow_back.dart';

class GeneralAppbar extends StatelessWidget {
  const GeneralAppbar({
    super.key,
    required this.title,
    this.showArrowBack = true,
    this.showActionWidget = false,
    this.actionWidget,
  });

  final String title;
  final bool showArrowBack;
  final bool showActionWidget;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TConsts.secondaryPaddingSpace.w),
      child: Column(
        children: [
          TConsts.spaceBtwSections.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(showArrowBack) const CustomArrowBack(),
              title.s17w700,
              showActionWidget ? actionWidget ?? const SizedBox() : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
