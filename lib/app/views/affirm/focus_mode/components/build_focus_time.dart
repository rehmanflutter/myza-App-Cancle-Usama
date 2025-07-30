import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/affirm.dart';
import 'package:myza_thougths/app/model/affirm.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../constant/colors.dart';

Widget buildFocusTime(AffirmController cont) {
  return SizedBox(
    height: 8.h,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: focusTime.length,
      itemBuilder: (context, index) {
        final time = focusTime[index];
        return Obx(
          () {
            final isSelected = cont.focusTime.value == index;
            return GestureDetector(
              onTap: () {
                Duration(milliseconds: 300).delay().then((value) {
                  Get.toNamed(AppRoutes.FOCUSMODE);
                });
                cont.focusTime(index);
              },
              child: AnimatedContainer(
                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                duration: Duration(milliseconds: 300),
                margin:
                    EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.8.h),
                width: 20.w,
                decoration: BoxDecoration(
                    color: isSelected ? Colors.orangeAccent[100] : Colors.white,
                    borderRadius: BorderRadius.circular(18.sp),
                    border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.borderColor)),
                child: Padding(
                  padding: EdgeInsets.only(left: 1.5.w),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
