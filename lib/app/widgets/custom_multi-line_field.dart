import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colors.dart';

class CustomMultiLineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  final double? height;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomMultiLineTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.maxLines = 5,
    this.height,
    this.textStyle,
    this.hintStyle,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 11.h,
      width: double.infinity,
      padding: padding ??
          const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: backgroundColor?? AppColors.lTextField,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:  AppColors.borderColor),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: textStyle ??
            TextStyle(
              fontSize: 15.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
            ),
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}