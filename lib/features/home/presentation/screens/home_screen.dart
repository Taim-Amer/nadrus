import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/circular_icon.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/grid_layout.dart';
import 'package:nadros/core/widgets/list_layout.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/text_widget.dart';
import 'package:nadros/features/homeworks/presentation/controllers/homeworks_controller.dart';
import 'package:nadros/features/subjects/presentation/controllers/subjects_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TConsts.defaultPaddingSpace),
          child: SingleChildScrollView(
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
                TConsts.spaceBtwSections.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TRoundedContainer(
                      backgroundColor: TColors.primary,
                      width: double.infinity,
                      height: 150.h,
                      radius: 8.r,
                      padding: const EdgeInsets.all(TConsts.secondaryPaddingSpace),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextWidget(
                            text: 'إشعار مهم جدا على الجميع ان يقرأه'.s17w700,
                            color: TColors.white,
                          ),
                          const TCircularIcon(
                            icon: Icons.arrow_forward,
                            width: 27,
                            height: 27,
                            size: 20,
                            color: TColors.primary,
                          )
                        ],
                      ),
                    ),
                    TConsts.spaceBtwSections.verticalSpace,
                    'مواد غد'.s16w400,
                    5.verticalSpace,
                    GetBuilder<SubjectsController>(
                      builder: (controller) => SizedBox(
                      height: 90.h,
                      child: TListView(
                        itemCount: controller.subjectsModel.data?.length ?? 0,
                        direction: Axis.horizontal,
                        itemBuilder: (context, index) => TRoundedContainer(
                          showBorder: true,
                          // borderColor: Colors.yellow,
                          borderWidth: 1,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          borderColor: const Color(0xFFEFE2E6),
                          radius: 5,
                          width: 74.w,
                          backgroundColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TRoundedImage(
                                imageUrl: '${DataConsts.serverUrl}/${controller.subjectsModel.data![index].pngIcon}',
                                isNetworkImage: true,
                                height: 45,
                                width: 45,
                                backgroundColor: Colors.transparent,
                                useHero: false,
                                isImageClickable: false,
                              ),
                              controller.subjectsModel.data![index].name?.s14w400 ?? const Text('')
                            ],
                          ),
                        ),
                        separatorBuilder: (context, _) => 10.horizontalSpace,
                      ),
                    ),
                    ),
                    TConsts.spaceBtwSections.verticalSpace,
                    'واجبات اليوم'.s16w400,
                    5.verticalSpace,
                    GetBuilder<HomeworksController>(
                      builder: (controller) => TGridLayout(
                        itemCount: controller.homeworksModel.data?.length ?? 0,
                        shrink: true,
                        isNeverScroll: true,
                        mainAxisExtent: 150,
                        itemBuilder: (context, index) =>  TRoundedContainer(
                          showBorder: true,
                          // height: 300,
                          // borderColor: Colors.yellow,
                          borderWidth: 1,
                          borderColor: const Color(0xFFEFE2E6),
                          radius: 5,
                          width: 74.w,
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(TConsts.md),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: 'الجبر'.s12w400, color: const Color(0xFFD6D5DC),),
                                  const TRoundedContainer(
                                    width: 11,
                                    height: 11,
                                    backgroundColor: TColors.primary,
                                    radius: 2,
                                  )
                                ],
                              ),
                              controller.homeworksModel.data![index].content?.s17w700 ?? const Text(''),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(SvgAssets.arrow),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    TConsts.spaceBtwSections.verticalSpace,
                    'صور السبورة اليوم'.s16w400,
                    SizedBox(
                      height: 170,
                      child: TListView(
                        itemCount: 6,
                        shrink: true,
                        direction: Axis.horizontal,
                        // isNeverScroll: true,
                        itemBuilder: (context, index) =>  TRoundedImage(
                          // showBorder: true,
                          // borderColor: Colors.yellow,
                          // borderWidth: 1,
                          // borderColor: const Color(0xFFEFE2E6),
                          // radius: 5,
                          width: 165.w,
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(TConsts.md),
                          imageUrl: '',
                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         TextWidget(text: 'الجبر'.s12w400, color: const Color(0xFFD6D5DC),),
                          //         TRoundedContainer(
                          //           width: 11,
                          //           height: 11,
                          //           backgroundColor: TColors.primary,
                          //           radius: 2,
                          //         )
                          //       ],
                          //     ),
                          //     'الصفحة 144 و 145 من الكتاب'.s17w700,
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         SvgPicture.asset(SvgAssets.arrow),
                          //       ],
                          //     )
                          //   ],
                          // ),
                        ), separatorBuilder: (context,_) => TConsts.spaceBtwItems.verticalSpace,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

