import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guest_profile_demo/global/constants/app_string.dart';
import 'package:guest_profile_demo/src/routes/app_pages.dart';

void main() {
  // Environment Control System

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
      BuildContext context,
      ) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale(
        'en',
        'US',
      ),
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}