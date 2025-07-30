import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/model/manage_notifications_Model.dart';

class NotificationController extends GetxController {
  RxList<int> selectedIndexes = <int>[].obs;

  List<ManageNotificationsModel> manageNotificationsList = [
    ManageNotificationsModel(
        images: AppImages.reminders, title: 'Journaling Reminder'),
    ManageNotificationsModel(
        images: AppImages.hydration, title: 'Hydration Reminder'),
    ManageNotificationsModel(images: AppImages.sleep, title: 'Sleep Reminder'),
    ManageNotificationsModel(
        images: AppImages.mood, title: 'Mood Tracker Reminde')
  ];
}
