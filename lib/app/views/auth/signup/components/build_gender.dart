import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constant/colors.dart';

class BuildGender extends StatelessWidget {
  final String gender;
  final dynamic controller;

  const BuildGender({
    super.key,
    required this.gender,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectGender(gender),
      child: Container(
        height: 4.8.h,
        width: 25.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            color: AppColors.lightGrey,
            border: Border.all(
              color: AppColors.borderColor,
            )),
        child: Row(
          children: [
            SizedBox(width: 2.w),
            Obx(() {
              final isChecked = controller.selectedGender.value == gender;
              return GestureDetector(
                onTap: () {
                  controller.selectGender(isChecked ? '' : gender);
                },
                child: Container(
                  height: 2.2.h,
                  width: 5.w,
                  decoration: BoxDecoration(
                    color: isChecked
                        ? AppColors.primary
                        : AppColors.grey, // Fill based on state
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: isChecked
                        ? Colors.white
                        : Colors.white
                            .withOpacity(0.8), // Lighter tick when unselected
                  ),
                ),
              );
            }),
            SizedBox(width: 2.w),
            Text(
              gender,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
