import 'package:get/get.dart';
import 'package:nadros/features/homeworks/presentation/controllers/homeworks_controller.dart';
import 'package:nadros/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:nadros/features/program/presentation/controllers/program_controller.dart';
import 'package:nadros/features/subjects/presentation/controllers/subjects_controller.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeworksController>(HomeworksController());
    Get.put<ProgramController>(ProgramController());
    Get.put<SubjectsController>(SubjectsController());
  }
}
