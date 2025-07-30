import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/daily_goals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';
import '../../../controller/journal.dart';
import '../../../model/bg_sounds.dart';
import '../../../model/daily_goals.dart';

final cont = Get.put(DailyGoalsController());


Widget buildTodayGoals() {
  return GestureDetector(
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: SizedBox(
        height: 11.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: todayGoals.length,
          itemBuilder: (context, index) {
            final goal = todayGoals[index];
            return Obx(
                  () {
                return Padding(
                  padding:  EdgeInsets.only(right: 2.w),
                  child: Container(
                    width: 42.w,
                    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 2.h,
                              width: 6.w,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                activeColor: AppColors.primary,
                                  value: goal.isActive.value, onChanged: (value){
                                goal.isActive.value = value!;
                                cont.toggleTracker(index);
                              }),
                            ),
                            Text(
                              goal.time,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: 5),
                          child: Text(
                            goal.text,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}
