import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/views/auth/login/login.dart';
import 'package:myza_thougths/app/views/auth/onboarding/onboarding.dart';
import 'package:myza_thougths/app/views/gratitude/gratitude_list_sc.dart';
import 'package:myza_thougths/app/views/habit_tracker/habit_tracker_sc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/bindings/initial_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
        );
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          themeMode: ThemeMode.light,
          theme: AppThemes.primaryTheme,
          getPages: AppPages.routes,
          home:
              OnboardingScreen(), // CustomNavBar() //  GratitudeListScreen() //  LoginScreen() //
        );
      },
    );
  }
}





















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HabitTrackerPage(),
//     );
//   }
// }

// class HabitController extends GetxController {
//   var habits = ['Drink Water', 'Morning Stretch', 'No Sugar'].obs;
//   var completed = <String>{}.obs;
//   var reminderTimes = {
//     'Drink Water': TimeOfDay(hour: 9, minute: 0),
//     'No Sugar': TimeOfDay(hour: 9, minute: 0),
//   }.obs;
//   var reminders = <String, bool>{'Drink Water': false, 'No Sugar': false}.obs;

//   void toggleHabit(String habit) {
//     if (completed.contains(habit)) {
//       completed.remove(habit);
//     } else {
//       completed.add(habit);
//     }
//   }

//   void toggleReminder(String habit, bool value) {
//     reminders[habit] = value;
//     reminders.refresh();
//   }

//   void setReminderTime(String habit, TimeOfDay time) {
//     reminderTimes[habit] = time;
//     reminderTimes.refresh();
//   }
// }

// class HabitTrackerPage extends StatelessWidget {
//   final HabitController controller = Get.put(HabitController());
//   final TextEditingController habitNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {},
//         ),
//         centerTitle: true,
//         title: Text('Habit Tracker', style: TextStyle(color: Colors.black)),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Add New Habit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: habitNameController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter Habit Name...',
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Icon(Icons.filter_list, color: Colors.black),
//               ],
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 final name = habitNameController.text.trim();
//                 if (name.isNotEmpty) {
//                   controller.habits.add(name);
//                   habitNameController.clear();
//                 }
//               },
//               child: Text('Add Habit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 minimumSize: Size(double.infinity, 45),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text("Today's Checklist", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Obx(() => Column(
//                   children: controller.habits.map((habit) {
//                     return Card(
//                       color: controller.completed.contains(habit) ? Colors.amber[100] : Colors.grey[200],
//                       child: CheckboxListTile(
//                         title: Text(habit),
//                         value: controller.completed.contains(habit),
//                         onChanged: (_) => controller.toggleHabit(habit),
//                         controlAffinity: ListTileControlAffinity.leading,
//                       ),
//                     );
//                   }).toList(),
//                 )),
//             Divider(height: 40),
//             Text('Progress Calendar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             CalendarDatePicker(
//               initialDate: DateTime.now(),
//               firstDate: DateTime(2020),
//               lastDate: DateTime(2030),
//               onDateChanged: (date) {},
//             ),
//             SizedBox(height: 10),
//             Text('Time', style: TextStyle(fontSize: 16)),
//             ElevatedButton(
//               onPressed: () async {
//                 final picked = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );
//                 if (picked != null) {
//                   controller.setReminderTime('Drink Water', picked);
//                 }
//               },
//               child: Obx(() => Text('${controller.reminderTimes['Drink Water']!.format(context)}')),
//             ),
//             Divider(height: 40),
//             Text('Reminder Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Obx(() => Column(
//                   children: controller.reminders.keys.map((habit) {
//                     return SwitchListTile(
//                       title: Row(
//                         children: [
//                           Icon(Icons.local_drink, color: Colors.blue),
//                           SizedBox(width: 10),
//                           Text(habit),
//                         ],
//                       ),
//                       subtitle: Text('${controller.reminderTimes[habit]?.format(context) ?? '00:00'}'),
//                       value: controller.reminders[habit]!,
//                       onChanged: (val) => controller.toggleReminder(habit, val),
//                     );
//                   }).toList(),
//                 )),
//           ],
//         ),
//       ),
     
//     );
//   }
// }
