import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/affirm.dart';
import 'package:myza_thougths/app/model/affirm.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_divider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgets/custom_appbar.dart';
import 'components/build_focus_time.dart';

class FocusModeSc extends StatelessWidget {
  FocusModeSc({super.key});

  final cont = Get.put(AffirmController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Focus Mode',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'What do you want to focus on?',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                _buildTexField(cont.focusModeTextController),
                SizedBox(height: 2.h),
                CustomDivider(),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      'Choose Your Focus Time',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                buildFocusTime(cont),
                SizedBox(height: 2.h),
                CustomButton(text: 'Start Focus Session', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildTexField(TextEditingController cont) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Container(
        height: 14.h,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F1EC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: cont,
          maxLines: 5,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration.collapsed(
            hintText: 'Type Here',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
