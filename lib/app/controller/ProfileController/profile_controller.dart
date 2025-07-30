import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firstName = TextEditingController();

  final lastName = TextEditingController();
  final userName = TextEditingController();
  final bio = TextEditingController();

  RxBool profileVisibility = false.obs;
  RxBool enableNotifications = false.obs;
  RxBool dailyReminders = false.obs;
  RxBool meditationAlerts = false.obs;
  RxBool darkMood = false.obs;
}
