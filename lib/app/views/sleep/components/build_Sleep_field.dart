import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constant/app_images.dart';
import '../../../constant/colors.dart';
import '../../../model/tracker.dart';

class BuildSleepField extends StatelessWidget {
  const BuildSleepField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 13.h,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
          decoration: BoxDecoration(
            color: AppColors.textField,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: TextField(
            // controller: textController,
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
        buildSuggestions(),
      ],
    );
  }
}

Widget buildSuggestions() {
  return SizedBox(
      height: 7.4.h,
      width: 85.w,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: textFieldSuggestions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              // padding: EdgeInsets.only(left: 2.w, top: 0.7.h),
              margin: EdgeInsets.symmetric(horizontal: 0.7.w, vertical: 1.8.h),
              width: 20.w,
              decoration: BoxDecoration(
                color: AppColors.textField,
                borderRadius: BorderRadius.circular(18.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textFieldSuggestions[index],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ));
}
