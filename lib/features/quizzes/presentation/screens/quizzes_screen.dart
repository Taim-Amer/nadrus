import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/list_layout.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/tabbar.dart';
import 'package:nadros/core/widgets/text_widget.dart';
import 'package:nadros/features/quizzes/presentation/widgets/quizzes_list.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TConsts.defaultPaddingSpace),
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
                        child: SvgPicture.asset(SvgAssets.gallery)),
                    10.horizontalSpace,
                    SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset(SvgAssets.doc)),
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
              TTabBar(
                tabColor: TColors.primary,
                selectedTextColor: TColors.white,
                backgroundColor: const Color(0xFFF4F4F4).withOpacity(.4),
                tabs: const [
                  'الاختبارات المكتملة',
                  'الاختبارات القادمة'
                ],
                tabViews: [
                  Column(
                    children: [
                      const QuizzesList(),
                      TConsts.spaceBtwSections.verticalSpace,
                      Expanded(
                        child: TListView(
                          itemCount: 12,
                          itemBuilder: (context, index) => TRoundedContainer(
                            borderColor: const Color(0xFFD0D0D0),
                            showBorder: true,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                            borderWidth: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(SvgAssets.ttt),
                                    8.horizontalSpace,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextWidget(
                                          text: 'التحليل'.s16w700,
                                          color: TColors.secondary,
                                        ),
                                        TextWidget(
                                          text: 'الأحد 2/16/2025'.s16w700,
                                          color: const Color(0xFFC1C0C4),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                                18.verticalSpace,
                                TextWidget(
                                  text: 'أسم الدرس'.s16w700,
                                  color: TColors.secondary,
                                ),
                                6.verticalSpace,
                                TextWidget(
                                  text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس هذا النص هو مثال لنص يمكن أن يستبدل في نفس'.s16w700,
                                  color: TColors.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, _) => TConsts.spaceBtwItems.verticalSpace,
                        ),
                      )
                    ],
                  ),
                  Container(color: Colors.lightBlueAccent,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//