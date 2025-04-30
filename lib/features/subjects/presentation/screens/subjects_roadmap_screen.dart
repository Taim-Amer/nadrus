import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/text_widget.dart';
import 'package:nadros/features/subjects/presentation/widgets/subject_bottomsheet.dart';

class SubjectsRoadmapScreen extends StatelessWidget {
  const SubjectsRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<bool> completedLessons = [true, true, false, false, false, false, false, true, true, true, false];

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TConsts.defaultSpace),
            child: Column(
              children: [
                GeneralAppbar(
                  title: 'مرحبا تيم',
                  showArrowBack: false,
                  actionWidget: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset(SvgAssets.gallery),
                      ),
                      10.horizontalSpace,
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset(SvgAssets.doc),
                      ),
                      10.horizontalSpace,
                      TRoundedImage(
                        imageUrl: ImagesAssets.car,
                        backgroundColor: TColors.black,
                        width: 45.w,
                        borderRadius: 100,
                        height: 45.h,
                        useHero: false,
                      )
                    ],
                  ),
                  showActionWidget: true,
                ),
                (TConsts.spaceBtwSections * 2).verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'رياضيات'.s16w400,
                      fontSize: 22,
                    ),
                  ],
                ),
                TConsts.spaceBtwSections.verticalSpace,
                Column(
                  children: List.generate(completedLessons.length, (index) {
                    final bool isCompleted = completedLessons[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.bottomSheet(
                            const SubjectBottomsheet(),
                            backgroundColor: Colors.transparent,
                            isDismissible: true,
                            enableDrag: false,
                          ),
                          child: Container(
                            width: 150,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isCompleted ? TColors.primary : Colors.transparent,
                              border: Border.all(
                                color: isCompleted ? TColors.primary : const Color(0xFFD6D5DC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'اسم الدرس',
                              style: TextStyle(
                                color: isCompleted ? Colors.white : Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (index != completedLessons.length - 1)
                          Container(
                            width: 2,
                            height: 40,
                            color: const Color(0xFFD6D5DC),
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );  }
}
