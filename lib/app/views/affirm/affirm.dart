import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/affirm.dart';
import 'package:myza_thougths/app/model/affirm.dart';
import 'package:myza_thougths/app/widgets/custom_divider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constant/colors.dart';
import '../../widgets/custom_appbar.dart';
import 'components/build_action_buttons.dart';
import 'components/build_categories.dart';
import 'components/build_quotes.dart';

class AffirmSc extends StatelessWidget {
  AffirmSc({super.key});
  final cont = Get.put(AffirmController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Affirmations',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2.h),
                BuildAffirmQuotes(),
                BuildActionButtons(),
                SizedBox(height: 2.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'Add New Affirmation',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                _buildTexField(cont.textController),
                SizedBox(height: 2.h),
                CustomDivider(),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'Browse Categories',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                buildCategories(affirmCategories, cont),
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
      child: Stack(children: [
        Container(
          height: 14.h,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F1EC),
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
          left: 64.w,
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
