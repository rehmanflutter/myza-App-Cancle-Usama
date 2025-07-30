import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AffirmController extends GetxController {
  TextEditingController textController = TextEditingController();
  TextEditingController focusModeTextController = TextEditingController();
  var selectedIndexCat = (1).obs; // Use RxInt for type safety
  var focusTime = (0).obs; // Use RxInt for type safety

  void selectContainerCat(int index) {
    selectedIndexCat.value = index;
  }

  void selectFocusTime(int index) {
    selectedIndexCat.value = index;
  }
}
