import 'package:get/get.dart';

class WaterTrackerController extends GetxController {
  RxBool isSavePublicly = false.obs;
  RxBool isPrivate = false.obs;

  void toggleSavePublicly(bool value) {
    isSavePublicly.value = !isSavePublicly.value;
  }

  void togglePrivate(bool value) {
    isPrivate.value = !isPrivate.value;
  }
}
