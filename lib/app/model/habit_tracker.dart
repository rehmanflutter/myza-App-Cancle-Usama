import 'package:get/get.dart';

class HabitModel {
  final String id;
  final String name;
  final RxBool isCompleted;
  final DateTime createdAt;

  HabitModel({
    required this.id,
    required this.name,
    bool completed = false,
    required this.createdAt,
  }) : isCompleted = completed.obs;
}
