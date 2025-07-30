import 'package:flutter/material.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/routes/app_pages.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../login/login.dart';
import 'components/slide_action_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.onboarding,
            fit: BoxFit.cover,
            height: 55.h,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
              child: ClipPath(
                clipper: CurvedClipper(),
                child: Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.h),
                        ImageIcon(AssetImage(AppImages.onboardingIcon),
                            size: 26.sp, color: Colors.brown),
                        // SizedBox(height: 2.h),
                        Text(
                          'Your Safe Space To',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 6.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19.sp),
                            color: Color(0xFFF8EEDF),
                          ),
                          child: Center(
                            child: Text(
                              'Breathe, Journal,',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.sp,
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'And Grow',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(height: 1.5.h),
                        Text(
                          'Gentle Tools For Your Thoughts, Moods, And Moments.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 80.w,
                          child: SlideActionButton(
                            height: 6.8.h,
                            elevation: 0,
                            reversed: false,
                            sliderRotate: false,
                            submittedIcon: null,
                            outerColor: Colors.white,
                            innerColor: AppColors.primary,
                            sliderButtonIcon: ImageIcon(
                              AssetImage(AppImages.doubleArrowIcon),
                              color: Colors.black87,
                              size: 18.sp,
                            ),
                            text: "Swipe To Start...",
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            alignment: Alignment.center,
                            onSubmit: () async {
                              print("Navigating...");
                              Get.toNamed(AppRoutes.LOGIN);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left with a rounded curve
    path.moveTo(0, 40);
    path.quadraticBezierTo(0, 0, 40, 0);

    // Dip in the center
    path.quadraticBezierTo(
      size.width / 2, 30, // Smaller dip for smoother curve
      size.width - 50, 0,
    );

    // Top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, 60);

    // Continue with bottom and sides
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
