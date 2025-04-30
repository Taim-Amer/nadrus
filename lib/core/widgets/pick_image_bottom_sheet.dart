import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadros/core/utils/colors.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.7,
          minChildSize: 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: openGallery,
                    icon: Row(
                      children: [
                        const Text("اضافة من الجهاز"),
                        5.horizontalSpace,
                        const Icon(
                          Icons.save_alt_outlined,
                          color: TColors.primary,
                        )
                      ],
                    ),
                  ),
                  20.horizontalSpace,
                  IconButton(
                    onPressed: takeAPhoto,
                    icon: Row(
                      children: [
                        const Text("التقاط صورة"),
                        5.horizontalSpace,
                        const Icon(
                          Icons.camera,
                          color: TColors.primary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  takeAPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Get.back(result: pickedFile);
    }
  }

  openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.back(result: pickedFile);
    }
  }
}
