import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/core/widgets/custom_button.dart';
import 'package:nadros/core/widgets/dotted_container.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/text_widget.dart';
import 'package:nadros/features/homeworks/presentation/controllers/homeworks_controller.dart';
import 'package:nadros/features/homeworks/presentation/widgets/date_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeworksScreen extends GetView<HomeworksController> {
  const HomeworksScreen({super.key});

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
              Expanded(
                child: GetBuilder<HomeworksController>(builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextWidget(
                        text: 'جـمـيـع الـواجـبـات'.s16w400,
                        fontSize: 22,
                      ),
                    ),
                    DatePicker(controller: controller.dateController,),
                    Expanded(
                      flex: 5,
                      child: PageView.builder(
                        itemCount: controller.homeworksModel.data?.length,
                        controller: controller.pageController,
                        itemBuilder: (context, index) => Skeletonizer(
                          enabled: controller.getHomeworksApiStatus == RequestState.loading,
                          child: Padding(
                            padding: const EdgeInsets.all(TConsts.spaceBtwItems),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.bottomCenter,
                              children: [
                                TDottedContainer(
                                  height: 300,
                                  backgroundColor: controller.homeworksModel.data![index].checked ?? false ? TColors.primary.withOpacity(.08) : const Color(0xFFE05D8A).withOpacity(.07),
                                  width: 300,
                                  borderColor: controller.homeworksModel.data![index].checked ?? false ? TColors.primary : const Color(0xFFE05D8A),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: TRoundedContainer(
                                            backgroundColor: TColors.white,
                                            showBorder: true,
                                            margin: const EdgeInsets.all(TConsts.spaceBtwItems),
                                            radius: 100,
                                            width: 30,
                                            height: 30,
                                            borderWidth: 1.5,
                                            borderColor: controller.homeworksModel.data![index].checked ?? false ? TColors.primary : const Color(0xFFE05D8A),
                                          ),
                                        ),
                                        TextWidget(
                                          text: controller.homeworksModel.data![index].content?.s16w400 ?? const Text(''),
                                          fontSize: 28,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  child: SizedBox(
                                    width: 160,
                                    height: 48,
                                    child: CustomButton(
                                      color: controller.homeworksModel.data![index].checked ?? false ? TColors.primary : const Color(0xFFE05D8A),
                                      title: controller.homeworksModel.data![index].checked ?? false ? 'تم الحل' : 'لم يتم حلها',
                                      radius: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Transform.scale(
                          scale: 1.5,
                          child: AnimatedSmoothIndicator(
                            count: controller.getHomeworksApiStatus != RequestState.success ? 1 : controller.homeworksModel.data?.length ?? 0,
                            activeIndex: 1,
                            effect: ExpandingDotsEffect(
                              activeDotColor: TColors.primary,
                              dotColor: TColors.borderPrimary,
                              dotWidth: 9.w,
                              expansionFactor: 2.56,
                              radius: 5.5.r,
                              dotHeight: 6.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
