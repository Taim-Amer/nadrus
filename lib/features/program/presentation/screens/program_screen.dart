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

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                      text: 'جـمـيـع الـواجـبـات'.s16w400,
                      fontSize: 22,
                    ),
                  ],
                ),
                (TConsts.spaceBtwSections * 2).verticalSpace,
                TTabBar(
                  tabs: const[
                    "الأحد",
                    "الإثنين",
                    "الثلاثاء",
                    "الأربعاء",
                    "الخميس",
                    "الجمعة",
                    "السبت",
                  ],
                  tabViews: [
                    TListView(itemCount: 12,
                      itemBuilder: (context, index) => TRoundedContainer(
                        borderColor: const Color(0xFFD6D5DC),
                        showBorder: true,
                        borderWidth: 1,
                        padding: const EdgeInsets.all(TConsts.defaultSpace),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'الحصة الأولى'.s12w400,
                                  color: const Color(0xFFD6D5DC),
                                ),
                                const TRoundedContainer(
                                  backgroundColor: Colors.transparent,
                                  showBorder: true,
                                  margin: EdgeInsets.all(TConsts.spaceBtwItems),
                                  radius: 100,
                                  width: 30,
                                  height: 30,
                                  borderWidth: 1.5,
                                  borderColor: TColors.primary,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TRoundedContainer(
                                  backgroundColor: Colors.transparent,
                                  showBorder: true,
                                  // margin: const EdgeInsets.all(TConsts.spaceBtwItems),
                                  radius: 100,
                                  width: 15,
                                  height: 15,
                                  borderWidth: 1.5,
                                  borderColor: const Color(0xFFD6D5DC),
                                  child: Center(child: TextWidget(text: '1'.s12w400, color: const Color(0xFFD6D5DC),),),
                                ),
                                5.horizontalSpace,
                                TextWidget(
                                  text: 'رياضيات ــــ جبر'.s16w400,
                                  fontSize: 18,
                                  color: TColors.secondary,
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      separatorBuilder: (context, _) => TConsts.spaceBtwItems.verticalSpace,
                    ),
                    const Center(child: Text("الواجبات المنجزة")),
                    const Center(child: Text("الواجبات غير المنجزة")),
                    const Center(child: Text("كل الواجبات")),
                    const Center(child: Text("الواجبات المنجزة")),
                    const Center(child: Text("الواجبات غير المنجزة")),
                    const Center(child: Text("الواجبات غير المنجزة")),
                  ], tabColor: const Color(0xFFE6F9FF),
                ),
                (TConsts.spaceBtwItems).verticalSpace,
                // Expanded(
                //   child: TabBarView(
                //     children: ,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
