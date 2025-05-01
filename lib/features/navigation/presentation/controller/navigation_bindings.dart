import 'package:get/get.dart';
import 'package:nadros/features/homeworks/presentation/controllers/homeworks_controller.dart';
import 'package:nadros/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:nadros/features/program/presentation/controllers/program_controller.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeworksController>(HomeworksController());
    Get.put<ProgramController>(ProgramController());
    // Get.put<HomeController>(HomeController());
    // Get.put<SettingsController>(SettingsController());
    // Get.put<BagController>(BagController());
    // Get.put<OrdersController>(OrdersController());
    // Get.put<ReturnedController>(ReturnedController());

    // Get.put<SettingController>(SettingController());
    // Get.put<AppInfoController>(AppInfoController());
  }
}
