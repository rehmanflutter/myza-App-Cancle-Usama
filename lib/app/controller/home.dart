import 'package:flutter/material.dart';
import 'package:flutter_instagram_stories/flutter_instagram_stories.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = (1).obs;

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  var currentIndex = 0.obs;
}
