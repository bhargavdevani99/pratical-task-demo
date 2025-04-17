//The controller layer is represented by various Commands which contain the Application Logic of the app.
// Commands are used to complete any significant action within your app.

import 'dart:async';
import 'package:get/get.dart';
import 'package:guest_profile_demo/src/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(
        seconds: 2,
      ),
      () async {

        Get.offAllNamed(
          Routes.HOME_SCREEN,
        );
      },
    );
  }
}
