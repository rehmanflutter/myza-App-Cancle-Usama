import 'package:get/get.dart';

class SpeedTrackerController extends GetxController {
  RxInt steps = 7265.obs;
  RxString enteredSteps = ''.obs;

  RxList<Map<String, dynamic>> statsData = [
    {"time": "09:00", "value": 80},
    {"time": "11:00", "value": 115.23},
    {"time": "13:00", "value": 70},
    {"time": "15:00", "value": 90},
    {"time": "17:00", "value": 65},
    {"time": "19:00", "value": 110},
    {"time": "21:00", "value": 80},
  ].obs;

  void syncSteps() {
    if (enteredSteps.value.isNotEmpty) {
      steps.value = int.tryParse(enteredSteps.value) ?? steps.value;
    }
  }
}
