import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/affirm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../model/tracker.dart';
import '../../widgets/custom_appbar.dart';
import 'components/build_Sleep_field.dart';

class SleepTrackerScreen extends StatelessWidget {
  SleepTrackerScreen({super.key});
  final cont = Get.put(AffirmController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Sleep Tracker',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w).copyWith(top: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                builtHeader(context, AppImages.sleepStart, 'Sleep Start Time',
                    'When Did You Go To Sleep?'),
                SizedBox(height: 1.h),
                Container(
                  height: 4.5.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColors.textField,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:30 PM',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 13.sp,
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          AppImages.alarm,
                          scale: 3.5,
                        ),
                      ]),
                ),
                SizedBox(height: 3.h),
                builtHeader(context, AppImages.wakeUp, 'Wake-Up Time',
                    'When Did You Wake Up?'),
                SizedBox(height: 2.h),
                Container(
                  height: 4.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColors.textField,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:30 PM',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 12.sp,
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          AppImages.alarm,
                          scale: 3.5,
                        ),
                      ]),
                ),
                SizedBox(height: 3.h),
                builtHeader(context, AppImages.sleepQuality, 'Sleep Quality',
                    'How Was Your Sleep?'),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        5, (index) => Image.asset(mood[index], height: 5.5.h))
                  ],
                ),
                SizedBox(height: 2.h),
                builtHeader(context, AppImages.notes, 'Notes',
                    'Any Dream, Notes, Or Disturbances'),
                SizedBox(height: 3.h),
                BuildSleepField(),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget builtHeader(context, String img, String title, String subtitle) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              img,
              scale: 3.5,
            ),
            SizedBox(width: 1.w),
            Text(title, style: textTheme.headlineSmall),
          ],
        ),
        SizedBox(height: 1.h),
        Text(subtitle,
            style: textTheme.headlineMedium!.copyWith(fontSize: 17.sp)),
      ],
    );
  }
}
