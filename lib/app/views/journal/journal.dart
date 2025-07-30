import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/home.dart';
import 'package:myza_thougths/app/controller/journal.dart';
import 'package:myza_thougths/app/model/bg_sounds.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constant/colors.dart';
import '../../controller/breathing.dart';
import '../../widgets/custom_appbar.dart';
import 'components/breathing_circle.dart';
import 'components/build_sounds.dart';

class JournalScreen extends StatelessWidget {
  JournalScreen({super.key});
  final cont = Get.put(JournalController());
  final BreathingController controller = Get.put(BreathingController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Reset Room',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(
                      'Background Sound',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              buildBgSounds(bgSounds, cont),
              SizedBox(height: 2.h),
              CustomButton(text: 'Start 1-Min Reset Timer', onPressed: () {}),
              SizedBox(height: 2.h),
              Divider(
                height: 1.h,
                thickness: 1,
                color: AppColors.unFocusGreyClr,
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(
                      'Breathing Test',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              BreathingCircle(
                controller: controller,
                size: 0.5,
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(
                      'How do you feel now?',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              _buildTexField(cont.textFieldController),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTexField(TextEditingController cont) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Stack(children: [
        Container(
          height: 14.h,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F1EC), // Light grey background
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 4.h),
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
        ),
        Positioned(
          top: 9.h,
          left: 66.w,
          child: Container(
            height: 5.5.h,
            width: 28.w,
            padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.backgroundColor,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Handle save
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
                elevation: 0,
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
