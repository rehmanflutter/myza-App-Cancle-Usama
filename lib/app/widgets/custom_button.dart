import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool? isBorder;
  final double? height, width;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.child,
    required this.onPressed,
    this.textStyle,
    this.borderColor,
    this.isBorder,
    this.height,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 4.8.h,
      width: width ?? 80.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isBorder == true
                ? BorderSide(color: borderColor ?? Colors.grey.shade400)
                : BorderSide.none,
          ),
          elevation: 1,
          shadowColor: Colors.black.withOpacity(0.6),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                fontFamily: 'Gilroy',
              ),
        ),
      ),
    );
  }
}
