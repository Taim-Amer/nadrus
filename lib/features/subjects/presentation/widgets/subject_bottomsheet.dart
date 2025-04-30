import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/custom_button.dart';
import 'package:nadros/core/widgets/list_layout.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/text_widget.dart';

class SubjectBottomsheet extends GetView {
  const SubjectBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TRoundedContainer(
        padding: EdgeInsets.symmetric(vertical: (TConsts.secondaryPaddingSpace * 2).w, horizontal: TConsts.secondaryPaddingSpace.w),
        radius: 0,
        backgroundColor: TColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'اسم الدرس'.s12w400,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: TColors.black,
                ),
                TextWidget(
                  text: '10/07/2024 الأحد'.s12w400,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFD6D5DC),
                ),
              ],
            ),
            TConsts.spaceBtwSections.verticalSpace,
            'واجبات الدرس'.s16w400,
            8.verticalSpace,
            SizedBox(
              height: 110,
              child: TListView(
                itemCount: 12,
                direction: Axis.horizontal,
                itemBuilder: (context, index) => TRoundedContainer(
                  showBorder: true,
                  borderColor: const Color(0xFFD6D5DC),
                  height: 104,
                  width: 160,
                  borderWidth: 1,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextWidget(
                              text: 'تم تفقده'.s12w400,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFF19A7CE),
                            ),
                          ],
                        ),
                      ),
                      13.verticalSpace,
                      TextWidget(
                        text: 'الصفحة 144 و 145 من الكتاب'.s12w400,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: TColors.secondary,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, _) => TConsts.spaceBtwItems.horizontalSpace,
              ),
            ),
            TConsts.spaceBtwSections.verticalSpace,
            TextWidget(
              text: 'سبور حصلت لهذا الدرس'.s12w400,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: TColors.secondary,
            ),
            8.verticalSpace,
            TRoundedContainer(
              borderWidth: 1,
              borderColor: const Color(0xFFD6D5DC),
              showBorder: true,
              radius: 8,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'درجات من اصل  8 20'.s12w400,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: TColors.secondary,
                  ),
                  TextWidget(
                    text: 'وسط'.s12w400,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: TColors.primary,
                  ),
      
                ],
              ),
            ),
            TConsts.spaceBtwSections.verticalSpace,
            TextWidget(
              text: 'سبع صور'.s12w400,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: TColors.secondary,
            ),
            8.verticalSpace,
            TRoundedContainer(
              borderWidth: 1,
              borderColor: const Color(0xFFD6D5DC),
              showBorder: true,
              radius: 8,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'رؤية الكل'.s12w400,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: TColors.secondary,
                  ),
                  TextWidget(
                    text: 'وسط'.s12w400,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: TColors.primary,
                  ),
      
                ],
              ),
            ),
            TConsts.spaceBtwSections.verticalSpace,
            const SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: 'تم',
                radius: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}