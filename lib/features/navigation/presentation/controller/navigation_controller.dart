import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/texts.dart';
import 'package:nadros/features/home/presentation/screens/home_screen.dart';
import 'package:nadros/features/homeworks/presentation/screens/homeworks_screen.dart';
import 'package:nadros/features/navigation/presentation/widgets/navigation_item_data.dart';
import 'package:nadros/features/program/presentation/screens/program_screen.dart';
import 'package:nadros/features/quizzes/presentation/screens/quizzes_screen.dart';
import 'package:nadros/features/subjects/presentation/screens/subjects_screen.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  // void changeSelectedIndex(int index) {
  //   selectedIndex = index;
  //   update();
  // }

  void changePage(int index){
    selectedIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  final List<NavigationItemData> navItems = [
    NavigationItemData(
      iconPath: SvgAssets.home,
      label: 'الرئيسية',
      screen: const HomeScreen(),
    ),
    NavigationItemData(
      label: 'الواجبات',
      iconPath: SvgAssets.homeworks,
      screen: const HomeworksScreen(),
    ),
    NavigationItemData(
      iconPath: SvgAssets.program,
      label: 'البرنامج',
      screen: const ProgramScreen(),
    ),
    NavigationItemData(
      iconPath: SvgAssets.book,
      label: 'المواد', screen: const SubjectsScreen()
    ),
    NavigationItemData(
      iconPath: SvgAssets.tests,
      label: 'الاختبارات',
      screen: const QuizzesScreen(),
    ),
  ];
}