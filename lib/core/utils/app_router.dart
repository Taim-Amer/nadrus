import 'package:get/get.dart';
import 'package:nadros/core/utils/cache_helper.dart';
import 'package:nadros/features/navigation/presentation/controller/navigation_bindings.dart';
import 'package:nadros/features/navigation/presentation/screens/navigation_menu.dart';

class AppRouter {
  static const String kLoginScreen = '/loginScreen';
  static const String kNavigationMenu = '/kNavigationMenu';

  static final List<GetPage> pages = [
    GetPage(
      name: kNavigationMenu,
      page: () => const NavigationMenu(),
      binding: NavigationBindings(),
      transition: Transition.noTransition,
    ),
  ];

  static String getInitialRoute() {
    return cache.read(CacheHelper.token) == null
        ? kLoginScreen
        : kLoginScreen;
  }
}
