import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_images.dart';
import '../../../constant/colors.dart';

class BuildWaterThoughtField extends StatelessWidget {
  const BuildWaterThoughtField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      width: double.infinity,
      padding:
          const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.lTextField,
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
          hintText: 'Text Area Optional',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
