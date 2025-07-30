import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/water_tracker.dart';
import 'package:myza_thougths/app/views/sleep/components/build_water_thought_field.dart';
import 'package:myza_thougths/app/views/water/components/build_water_tracker_field.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_divider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../model/tracker.dart';
import '../../widgets/custom_appbar.dart';

class WaterScreen extends StatelessWidget {
  WaterScreen({super.key});
  final cont = Get.put(WaterTrackerController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Water Tracker',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w)
                .copyWith(top: 3.h, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today\'s Date',
                    style: textTheme.headlineMedium!.copyWith(fontSize: 17.sp)),
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
                              fontSize: 14.sp,
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          AppImages.calendar,
                          scale: 3.5,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 2.h,
                ),
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
                Text('How Are You Feeling?',
                    style: textTheme.headlineMedium!.copyWith(fontSize: 17.sp)),
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
                builtHeader(context, AppImages.prompt, 'Prompt Of The Day',
                    'What Made You Smile Today?'),
                SizedBox(height: 2.h),
                BuildWaterTrackerField(),
                SizedBox(height: 1.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                builtHeader(
                    context, AppImages.textArea, 'Text Area', 'Your Thoughts'),
                SizedBox(height: 2.h),
                BuildWaterThoughtField(),
                SizedBox(height: 2.h),
                buildPrivacyTile('Save Publicly', cont.isSavePublicly,
                    cont.toggleSavePublicly),
                SizedBox(height: 2.h),
                buildPrivacyTile(
                    'Lock (Private Entry)', cont.isPrivate, cont.togglePrivate),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(text: 'Save Entry', onPressed: () {}),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'Discard',
                      onPressed: () {},
                      isBorder: true,
                      borderColor: AppColors.black,
                      backgroundColor: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPrivacyTile(String text, RxBool value, Function(bool) onChanged) {
    return Container(
      height: 5.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 4.w, right: 1.w),
      decoration: BoxDecoration(
        color: AppColors.lWhite,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w600),
        ),
        Obx(
          () => CupertinoSwitch(
            value: value.value,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.borderColor,
            onChanged: onChanged,
          ),
        )
      ]),
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
