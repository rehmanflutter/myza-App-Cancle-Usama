import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colors.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.isExpanded = true,
  });

  final String hintText;

  final dynamic value;
  final List<DropdownMenuItem<dynamic>> items;
  final Function(dynamic)? onChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      onChanged: onChanged,
      isExpanded: isExpanded,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 15.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 4.w,
        ),
        fillColor: AppColors.lWhite,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
      dropdownColor: Colors.white,
      icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary),
      style: TextStyle(
          fontFamily: 'Gilroy', color: AppColors.black, fontSize: 15.sp),
    );
  }
}
