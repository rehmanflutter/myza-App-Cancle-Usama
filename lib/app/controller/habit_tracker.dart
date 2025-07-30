import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/habit_tracker.dart';

class HabitTrackerController extends GetxController {
  final TextEditingController habitController = TextEditingController();
  final RxList<HabitModel> habits = <HabitModel>[].obs;
  final RxInt selectedMonth = DateTime.now().month.obs;
  final RxInt selectedYear = DateTime.now().year.obs;
  final RxInt selectedDay = DateTime.now().day.obs;
  final RxMap<String, bool> progressData = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Add some sample habits
    addSampleHabits();
  }

  void addSampleHabits() {
    habits.addAll([
      HabitModel(
        id: '1',
        name: 'Drink Water',
        completed: false,
        createdAt: DateTime.now(),
      ),
      HabitModel(
        id: '2',
        name: 'Morning Stretch',
        completed: true,
        createdAt: DateTime.now(),
      ),
    ]);
  }

  void addHabit() {
    if (habitController.text.trim().isNotEmpty) {
      habits.add(HabitModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: habitController.text.trim(),
        createdAt: DateTime.now(),
      ));
      habitController.clear();
      Get.snackbar(
        'Success',
        'Habit added successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFFF8A00),
        colorText: Colors.white,
      );
    }
  }

  void toggleHabit(String habitId) {
    final habit = habits.firstWhere((h) => h.id == habitId);
    habit.isCompleted.value = !habit.isCompleted.value;

    // Update progress data
    String key = '${selectedYear.value}-${selectedMonth.value}-${selectedDay.value}';
    progressData[key] = habits.any((h) => h.isCompleted.value);
  }

  void previousMonth() {
    if (selectedMonth.value == 1) {
      selectedMonth.value = 12;
      selectedYear.value--;
    } else {
      selectedMonth.value--;
    }
  }

  void nextMonth() {
    if (selectedMonth.value == 12) {
      selectedMonth.value = 1;
      selectedYear.value++;
    } else {
      selectedMonth.value++;
    }
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  bool getProgressForDay(int day) {
    String key = '${selectedYear.value}-${selectedMonth.value}-$day';
    return progressData[key] ?? false;
  }

  @override
  void onClose() {
    habitController.dispose();
    super.onClose();
  }
}