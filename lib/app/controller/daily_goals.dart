import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/model/daily_goals.dart';

class DailyGoalsController extends GetxController {
  Rxn<String> selectedVehicleType = Rxn<String>();

  var selectedIndex = (1).obs; // Use RxInt for type safety

  // Make bgSounds observable
  RxList<TodayGoalsModel> dailyGoals = <TodayGoalsModel>[].obs;

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  void toggleTracker(int index) {
    selectContainer(index);
    dailyGoals[index].isActive.value = !dailyGoals[index].isActive.value;
  }
}
