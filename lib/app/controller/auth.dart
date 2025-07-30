import 'dart:async';
import 'package:get/get.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import '../views/auth/onboarding/onboarding.dart';

class AuthController extends GetxController {
  // Gender
  var selectedGender = ''.obs;
  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  //PIN CONTROLLER>>>>>>>>>>>>>>>>>>>>>>>
  var pin = ''.obs;

  void addDigit(String digit) {
    if (pin.value.length < 4) {
      pin.value += digit;

      if (pin.value.length == 4) {
        Future.delayed(Duration(milliseconds: 300), () {
          Get.toNamed(AppRoutes.BOTTOMENAVBAR);
        });
      }
    }
  }

  void deleteDigit() {
    if (pin.value.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }
}

class SplashController extends GetxController {
  var isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 500), () {
      isVisible.value = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      Get.to(OnboardingScreen());
    });
  }
}
