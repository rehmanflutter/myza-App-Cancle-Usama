import 'package:get/get.dart';

class WaterTracker2Controller extends GetxController {
  final progress = 0.0.obs;
  final pulseScale = 1.0.obs;


  final selectedIndex = (1).obs;

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  var currentIndex = 0.obs;

  final int totalCups = 8;
  final int mlPerCup = 500;

  RxInt currentCups = 0.obs;

  int get totalMl => mlPerCup * totalCups;
  int get currentMl => currentCups.value * mlPerCup;
  double get progressPercent => currentCups.value / totalCups;

  void addGlass() {
    if (currentCups.value < totalCups) {
      currentCups.value++;
      progress.value = progressPercent;
    }
  }

}
