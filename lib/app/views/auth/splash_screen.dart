import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/app_images.dart';
import '../../controller/auth.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => AnimatedOpacity(
        opacity: controller.isVisible.value ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: Stack(
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                AppImages.splashScreen,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    ));
  }
}
