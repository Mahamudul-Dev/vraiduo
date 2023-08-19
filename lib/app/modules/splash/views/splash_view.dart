import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vraiduo/app/data/style.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // Replace the next line with the appropriate route for your app
      Get.offNamed(Routes.HOME);
    });
    return Scaffold(
      backgroundColor: AppColor.ACCENT_COLOR,
        body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset('assets/splash_logo.png',
                  fit: BoxFit.cover,
                ),
            )));
  }
}
