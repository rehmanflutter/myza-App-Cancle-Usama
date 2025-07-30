import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/views/daily%20goals/daily_goals_sc.dart';
import 'package:myza_thougths/app/views/sleep/sleep_tracker_screen.dart';
import 'package:myza_thougths/app/views/water%20tracker%202/water_tracker_2.dart';
import 'package:myza_thougths/app/views/water/water_tracker.dart';
import 'package:myza_thougths/app/widgets/custom_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../model/tracker.dart';
import '../../tracker/tracker.dart';

class TrackersScreen extends StatelessWidget {
  const TrackersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4F4F4),
      appBar: CustomAppBar(title: 'Trackers'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),
              SizedBox(
                height: 40.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    itemCount: trackers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          switch (trackers[index]['text']) {
                            case 'Mood Tracker':
                              Get.to(() => TrackerScreen());
                              break;
                            case 'Sleep Tracker':
                              Get.to(() => SleepTrackerScreen());
                              break;
                            case 'Water Tracker':
                              Get.to(() => WaterTracker2Screen());
                              break;
                            case 'Daily Goals':
                              Get.to(() => DailyGoalsScreen());
                              break;
                          }
                          ;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                trackers[index]['img'],
                                height: 36,
                                width: 36,
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                trackers[index]['text'],
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Gilroy'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
