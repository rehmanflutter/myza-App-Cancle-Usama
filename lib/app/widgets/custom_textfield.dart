import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextfield(
      {super.key,
      this.controller,
      required this.label,
      this.width,
      this.hintText,
      this.height,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, fontFamily: ''),
        ),
        SizedBox(
          width: width ?? 80.w,
          height: height ?? 4.8.h,
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.name,
              maxLength: maxLines ?? 50,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  fontFamily: ''),
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(
                    color: Colors.black45,
                  ),
                ),
                isCollapsed: true,
                counterText: '',
                hintText: hintText ?? 'Type Here',
                hintStyle: TextStyle(
                    color: AppColors.unFocusGreyClr,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
                border: InputBorder.none,
                filled: true,
                fillColor: AppColors.lightGrey,
                focusColor: Colors.grey,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 1.5.h,
                  horizontal: 2.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
