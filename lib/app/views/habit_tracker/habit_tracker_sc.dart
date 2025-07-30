import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/widgets/custom_appbar.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/habit_tracker.dart';
import '../../model/habit_tracker.dart';

class HabitTrackerScreen extends StatelessWidget {
  HabitTrackerScreen({super.key});
  final cont = Get.put(HabitTrackerController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Habit Tracker',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w)
                .copyWith(top: 5.h, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add New Habit Section
                Row(
                  children: [
                    Text('Add New Habit',
                        style: textTheme.headlineMedium!.copyWith(
                            fontSize: 17.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lTextField,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 75.w,
                        child: TextField(
                          controller: cont.habitController,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Enter Habit Name...',
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.filter_list_sharp,
                        size: 20.sp,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h),

                // Add Habit Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'Add Habit',
                      onPressed: () {},
                      width: 80.w,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),

                // Today's Checklist Section
                Row(
                  children: [
                    Text('Today\'s Checklist',
                        style: textTheme.headlineMedium!.copyWith(
                            fontSize: 17.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 2.h),

                // Habits List
                Obx(() => Column(
                      children: cont.habits
                          .map((habit) => buildHabitItem(habit))
                          .toList(),
                    )),
                SizedBox(height: 4.h),

                // Progress Calendar Section
                Row(
                  children: [
                    Text('Progress Calendar',
                        style: textTheme.headlineMedium!.copyWith(
                            fontSize: 17.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 2.h),

                // Calendar Widget
                buildCalendar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHabitItem(HabitModel habit) {
    return Obx(() => Container(
          margin: EdgeInsets.only(bottom: 1.5.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              // Habit Icon/Color Indicator
              Container(
                width: 4.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: habit.isCompleted.value
                      ? Color(0xFFFF8A00)
                      : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 3.w),

              // Habit Name and Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gilroy',
                        decoration: habit.isCompleted.value
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      habit.isCompleted.value ? 'Completed' : 'Not Done',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: habit.isCompleted.value
                            ? Colors.green
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Status Indicator
              if (habit.isCompleted.value)
                Container(
                  padding: EdgeInsets.all(0.5.h),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 12.sp,
                  ),
                )
              else
                GestureDetector(
                  onTap: () => cont.toggleHabit(habit.id),
                  child: Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }

  Widget buildCalendar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Calendar Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Oct 2023',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => cont.previousMonth(),
                    child: Icon(Icons.chevron_left, size: 20.sp),
                  ),
                  SizedBox(width: 2.w),
                  GestureDetector(
                    onTap: () => cont.nextMonth(),
                    child: Icon(Icons.chevron_right, size: 20.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h),

          // Days of Week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                .map((day) => Container(
                      width: 10.w,
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 1.h),

          // Calendar Days
          Obx(() => Column(
                children: List.generate(
                  6,
                  (weekIndex) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (dayIndex) {
                      int dayNumber = (weekIndex * 7) +
                          dayIndex -
                          6; // Adjust for October 2023
                      if (dayNumber <= 0 || dayNumber > 31) {
                        return Container(
                          width: 10.w,
                          height: 6.h,
                          child: Center(child: Text('')),
                        );
                      }

                      bool hasProgress = cont.getProgressForDay(dayNumber);
                      bool isToday = dayNumber == DateTime.now().day;

                      return GestureDetector(
                        onTap: () => cont.selectDay(dayNumber),
                        child: Container(
                          width: 10.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: isToday
                                ? Color(0xFFFF8A00).withOpacity(0.2)
                                : hasProgress
                                    ? Color(0xFFFF8A00).withOpacity(0.3)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              dayNumber.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight:
                                    isToday ? FontWeight.w600 : FontWeight.w400,
                                color:
                                    isToday ? Color(0xFFFF8A00) : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
