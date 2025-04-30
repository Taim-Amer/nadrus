import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:nadros/features/navigation/presentation/widgets/navigation_item_data.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 22,
                    color: TColors.black.withOpacity(.05),
                    offset: const Offset(0, -4))
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              color: dark ? TColors.darkContainer : TColors.white,
            ),
            child: Row(
              children: List.generate(
                controller.navItems.length,
                    (index) => NavigationItem(
                  index: index,
                  itemData: controller.navItems[index],
                ),
              ),
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.changePage,
            children: controller.navItems.map((item) => item.screen).toList(),
          ),
        );
      },
    );
  }
}