import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/colors.dart';

class AppThemes {
  static final ThemeData primaryTheme = ThemeData(
    cardColor: Colors.white,
    primaryColor: AppColors.primary,
    primaryColorLight: Colors.black,
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.blue,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade50),
    scaffoldBackgroundColor: Color(0XFFF4F4F4),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 17.5.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 11.5.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: "Manier",
  );
}
