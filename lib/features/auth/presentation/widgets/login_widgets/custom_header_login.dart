import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/font.dart';

class CustomHeaderLogin extends StatelessWidget {
  const CustomHeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          SvgAssets.nadrus,
          height: 56.h,
          width: 120.w,
        ),
        50.verticalSpace,
        Text(
          'أهلا بك',
          style: TextStyles.font24Primary700,
        ),
        8.verticalSpace,
        const Text(
          "قم بادخال اسم المستخدم و كلمة المرور التي تم ارسالها الى الواتس اب الخاص بك.",
          style: TextStyle(
              color: TColors.grey, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        54.verticalSpace,
      ],
    );
  }
}
