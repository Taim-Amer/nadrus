import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/core/widgets/custom_button.dart';
import 'package:nadros/core/widgets/dotted_container.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/grid_layout.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/text_widget.dart';
import 'package:nadros/core/widgets/view_state_widget.dart';
import 'package:nadros/features/subjects/presentation/controllers/subjects_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TConsts.defaultPaddingSpace),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.find<SubjectsController>().getSubjects(),
                child: GeneralAppbar(
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
              ),
              (TConsts.spaceBtwSections * 2).verticalSpace,
              GetBuilder<SubjectsController>(
                builder: (controller) => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'جميع المواد'.s16w400,
                        fontSize: 22,
                      ),
                      TConsts.spaceBtwSections.verticalSpace,
                      Expanded(
                        child: ViewStateWidget(
                          requestState: controller.getSubjectsApiStatus,
                          child: Skeletonizer(
                            enabled: controller.getSubjectsApiStatus == RequestState.loading,
                            child: TGridLayout(
                              itemCount: controller.subjectsModel.data?.length ?? 0,
                              mainAxisExtent: 165.h,
                              itemBuilder: (context, index) => TRoundedContainer(
                                showBorder: true,
                                // borderColor: Colors.yellow,
                                borderWidth: 1,
                                borderColor: const Color(0xFFEFE2E6),
                                radius: 5,
                                width: 74.w,
                                backgroundColor: Colors.transparent,
                                child: Column(
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
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
