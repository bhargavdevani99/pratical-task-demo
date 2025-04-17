// App Pages

import 'package:get/get.dart';
import 'package:guest_profile_demo/src/view/home/binding/home_binding.dart';
import 'package:guest_profile_demo/src/view/home/view/home_view.dart';
import 'package:guest_profile_demo/src/view/splash/binding/splash_binding.dart';
import 'package:guest_profile_demo/src/view/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
