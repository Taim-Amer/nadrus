import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nadros/core/extensions/text_extensions.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/custom_arrow_back.dart';
import 'package:nadros/core/widgets/general_appbar.dart';
import 'package:nadros/core/widgets/grid_layout.dart';
import 'package:nadros/core/widgets/rounded_container.dart';
import 'package:nadros/core/widgets/rounded_image.dart';
import 'package:nadros/core/widgets/text_widget.dart';

class BoardImagesScreen extends StatelessWidget {
  const BoardImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TConsts.defaultPaddingSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (kToolbarHeight / 2).verticalSpace,
              Row(
                children: [
                  const CustomArrowBack(),
                  5.horizontalSpace,
                  TextWidget(
                    text: 'صور السبورة'.s12w400,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: TColors.black,
                  ),
                ],
              ),
              TConsts.md.verticalSpace,
              const TRoundedContainer(
                height: 1,
                width: double.infinity,
                backgroundColor: Color(0xFFE7E7E7),
              ),
              (TConsts.spaceBtwSections * 2).verticalSpace,
              TextWidget(
                text: 'الثلاثاء 2/18/2025'.s12w400,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFD0D0D0),
              ),
              8.verticalSpace,
              Expanded(
                child: TGridLayout(
                  itemCount: 12,
                  mainAxisExtent: 110,
                  crossAxisCount: 3,
                  itemBuilder: (context, index) => const TRoundedImage(
                    imageUrl: '',
                    useHero: false,
                    width: 110,
                    height: 110,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
