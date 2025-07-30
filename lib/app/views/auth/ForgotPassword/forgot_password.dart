import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/AuthController/forgotPasswordController.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:myza_thougths/app/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final controller = Get.put(Forgotpasswordcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          CustomContainer(
            height: 50.h,
            width: double.infinity,
            col: Color(0xffF8EEDF),
            imageDecoration: DecorationImage(image: AssetImage(AppImages.leaf)),
            cir: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo),
                CustomText(
                  text: 'Forgot Password',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: 'Enter Your Email To reset Password',
                  fontSize: 10,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomContainer(
                    height: 45.h,
                    width: double.infinity,
                    col: Colors.white,
                    shadow: true,
                    cir: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomTextfield(
                            controller: controller.forgotEmail,
                            label: ' Email',
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 20,
                              color: Color(0xffB2B1B1),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomButton(
                              text: 'Reset Password',
                              onPressed: () {
                                Get.toNamed(AppRoutes.forgotOtpScreen);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
