import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/water_tracker.dart';
import 'package:myza_thougths/app/views/daily%20goals/components/daily_goal_field.dart';
import 'package:myza_thougths/app/views/daily%20goals/components/priority_selector.dart';
import 'package:myza_thougths/app/views/daily%20goals/components/thought_field.dart';
import 'package:myza_thougths/app/views/sleep/components/build_today_goal.dart';
import 'package:myza_thougths/app/views/sleep/components/build_water_thought_field.dart';
import 'package:myza_thougths/app/views/water/components/build_water_tracker_field.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_divider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../model/tracker.dart';
import '../../widgets/custom_appbar.dart';

class DailyGoalsScreen extends StatelessWidget {
  DailyGoalsScreen({super.key});
  final cont = Get.put(WaterTrackerController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Daily Goals',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w)
                .copyWith(top: 3.h, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Enter Your Goal',
                        style: textTheme.headlineMedium!
                            .copyWith(fontSize: 17.sp)),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.5.h),
                  decoration: BoxDecoration(
                    color: AppColors.lWhite,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: TextField(
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type Here',
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                PerioritySelector(),
                SizedBox(height: 1.h),
                DailyThoughtField(
                  hintText: 'Text Area Optional',
                ),
                SizedBox(height: 3.h),
                CustomButton(text: 'Add Goals', onPressed: () {}),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text('Today\'s Goal',
                        style: textTheme.headlineMedium!
                            .copyWith(fontSize: 17.sp)),
                  ],
                ),
                SizedBox(height: 2.h),
                buildTodayGoals(),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text('Partner Name',
                        style: textTheme.headlineMedium!
                            .copyWith(fontSize: 17.sp)),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.5.h),
                  decoration: BoxDecoration(
                    color: AppColors.lWhite,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: TextField(
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Jhon Doe',
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Image.asset(
                      AppImages.moodIndicator,
                      scale: 3.5,
                    ),
                    SizedBox(width: 1.w),
                    Text('Mood Indicator', style: textTheme.headlineSmall),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('(optional)',
                        style: textTheme.headlineSmall!.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Text('How Are You Feeling?',
                        style: textTheme.headlineMedium!
                            .copyWith(fontSize: 17.sp)),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        5, (index) => Image.asset(mood[index], height: 5.5.h))
                  ],
                ),
                SizedBox(height: 2.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                builtHeader(context, AppImages.prompt, 'Prompt Of The Partner',
                    'Your Partner Made You Smile Today?'),
                SizedBox(height: 2.h),
                DailyGoalField(),
                SizedBox(height: 1.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                builtHeader(context, AppImages.textArea, 'Text Area',
                    'Your Thoughts About Your Partner'),
                SizedBox(height: 2.h),
                DailyThoughtField(
                  hintText: 'Type Here',
                ),
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
