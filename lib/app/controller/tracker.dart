import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  final textController = TextEditingController();
  final selectedIndex = (0).obs;

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  var currentIndex = 0.obs;
}
