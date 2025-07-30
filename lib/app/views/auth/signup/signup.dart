import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constant/colors.dart';
import '../../../controller/auth.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../components/signin_options.dart';
import '../pin/pin_screen.dart';
import 'components/build_gender.dart';
import 'components/terms.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final authCont = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.signupScreen,
              fit: BoxFit.cover,
              height: 100.h,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(top: 64.sp),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.sp),
                ),
                child: Container(
                  height: 66.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(21.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 18.sp,
                      right: 18.sp,
                      top: 18.sp,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextfield(label: 'First Name', width: 38.w),
                            CustomTextfield(label: 'Last Name', width: 38.w),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(label: 'Email'), //
                        SizedBox(height: 1.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildGender(gender: 'Male', controller: authCont),
                            BuildGender(gender: 'Female', controller: authCont),
                            BuildGender(gender: 'others', controller: authCont),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(label: 'Password'),
                        SizedBox(height: 1.h),
                        CustomTextfield(label: 'Confirm Password'),
                        SizedBox(height: 1.h),
                        BuildTerms(),
                        SizedBox(height: 1.h),
                        CustomButton(
                          text: 'Sign Up',
                          onPressed: () {
                            Get.to(PinScreen());
                          },
                        ),
                        SizedBox(height: 0.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 0.5.w),
                            Container(
                              color: AppColors.textGrey,
                              height: 0.1.h,
                              width: 28.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sign in with',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.textGrey,
                              height: 0.1.h,
                              width: 28.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        SignInOptionsRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
