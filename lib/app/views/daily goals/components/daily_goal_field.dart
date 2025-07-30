import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constant/app_images.dart';
import '../../../constant/colors.dart';
import '../../../model/tracker.dart';

class DailyGoalField extends StatelessWidget {
  const DailyGoalField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0),
          child: Container(
            height: 17.h,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
            decoration: BoxDecoration(
              color: AppColors.textField,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                TextField(
                  // controller: textController,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'WHAT WILL I DO TO MAKE TODAY GREAT!',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppImages.galleryIcon, scale: 2.2),
                    ),
                    Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSuggestions(),
          ],
        ),
      ],
    );
  }
}

Widget buildSuggestions() {
  return SizedBox(
      height: 8.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: textFieldSuggestions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              padding: EdgeInsets.only(left: 3.w, top: 1.2.h, right: 2.w),
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.8.h),
              width: 20.w,
              decoration: BoxDecoration(
                color: AppColors.textField,
                borderRadius: BorderRadius.circular(18.sp),
              ),
              child: Text(
                textFieldSuggestions[index],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ));
}
