// Simplifies Bindings generation from a single callback.

import 'package:get/get.dart';
import 'package:guest_profile_demo/src/view/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
