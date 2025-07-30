// models/tracker_model.dart
import 'package:get/get.dart';

import '../constant/app_images.dart';

class TodayGoalsModel {
  final String time;
  final String text;
  final RxBool isActive;

  TodayGoalsModel({
    required this.time,
    required this.text,
    bool isActive = false,
  }) : isActive = isActive.obs;

  void toggleActive() {
    isActive.value = !isActive.value;
  }
}

final List<TodayGoalsModel> todayGoals = [
  TodayGoalsModel(time: '4 Pm', text: 'Finish Client Proposal ⎯ High', isActive: true),
  TodayGoalsModel(time: '4 Pm', text: 'Finish Client Proposal ⎯ High', isActive: true),
  TodayGoalsModel(time: '4 Pm', text: 'Finish Client Proposal ⎯ High', isActive: true),
  TodayGoalsModel(time: '4 Pm', text: 'Finish Client Proposal ⎯ High', isActive: true),

];
