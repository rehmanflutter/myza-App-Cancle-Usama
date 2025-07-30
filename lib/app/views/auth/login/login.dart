import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constant/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../components/signin_options.dart';
import '../signup/signup.dart';
import 'components/register_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.loginScreen,
              fit: BoxFit.cover,
              height: 100.h,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.sp),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21.sp),
                    ),
                    child: Container(
                      height: 45.h,
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
                            CustomTextfield(label: 'Email'),
                            SizedBox(height: 1.h),
                            CustomTextfield(label: 'Password'),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                RegisterWidget(
                                  onPressed: () => Get.to(SignupScreen()),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.forgotPassword);
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            CustomButton(text: 'Login', onPressed: () {}),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: AppColors.textGrey,
                                  height: 0.1.h,
                                  width: 28.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Or login with',
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
          ],
        ),
      ),
    );
  }
}
