import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';

class Forgotpasswordcontroller extends GetxController {
  TextEditingController forgotEmail = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  //PIN CONTROLLER>>>>>>>>>>>>>>>>>>>>>>>
  var forgotOTP = ''.obs;

  void addDigit(String digit) {
    if (forgotOTP.value.length < 6) {
      forgotOTP.value += digit;

      if (forgotOTP.value.length == 6) {
        Future.delayed(Duration(milliseconds: 300), () {
          Get.toNamed(AppRoutes.setNewPassword);
        });
      }
    }
  }

  void deleteDigit() {
    if (forgotOTP.value.isNotEmpty) {
      forgotOTP.value =
          forgotOTP.value.substring(0, forgotOTP.value.length - 1);
    }
  }
}
