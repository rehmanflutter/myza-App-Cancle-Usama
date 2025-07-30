import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/views/water%20tracker%202/components/water_tracker_circle.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../constant/colors.dart';
import '../../controller/water_tracker_2.dart';
import 'components/build_water_tracker_quotes.dart';

class WaterTracker2Screen extends StatelessWidget {
  final WaterTracker2Controller cont = Get.put(WaterTracker2Controller());

   WaterTracker2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text("Water Tracker", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3.h),
            WaterTrackerCircle(controller: cont),
            SizedBox(height: 1.h),
            Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${cont.currentCups.value}/${cont.totalCups}",
                              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text("500ml Cups", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("${cont.totalMl} ML",
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      Text("Daily Glass", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            )),
            SizedBox(height: 2.h),
            Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  cont.totalCups,
                      (index) => Image.asset(
                        index < cont.currentCups.value ? AppImages.glassFilled : AppImages.glassEmpty,scale: 5,)
                ),
              ),
            )),
            SizedBox(height: 2.h),
            CustomButton(text: 'Add Glass', onPressed: cont.addGlass),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Text("Motivational Tip", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            BuildWaterTrackerQuotes(),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}