// Simplifies Bindings generation from a single callback.

import 'package:get/get.dart';
import 'package:guest_profile_demo/src/view/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
