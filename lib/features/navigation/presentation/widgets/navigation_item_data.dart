// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/features/navigation/presentation/controller/navigation_controller.dart';

class NavigationItem extends GetView<NavigationController> {
  final int index;
  final NavigationItemData itemData;

  const NavigationItem({
    super.key,
    required this.index,
    required this.itemData,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.selectedIndex == index;
    return Expanded(
      flex: isSelected ? 4 : 2,
      child: GestureDetector(
        onTap: () => controller.changePage(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: isSelected
                ? TColors.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 22),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SvgPicture.asset(itemData.iconPath,
                    color: isSelected ? TColors.primary : TColors.secondary),
              ),
              if (isSelected) ...[
                7.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.5),
                  child: Text(
                    itemData.label.tr,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: TColors.primary,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItemData {
  final String iconPath;
  final String label;
  final Widget screen;

  NavigationItemData({
    required this.iconPath,
    required this.screen,
    required this.label,
  });
}
