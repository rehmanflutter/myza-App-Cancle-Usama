import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class SetNewPassword extends StatelessWidget {
  SetNewPassword({super.key});
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
                  text: 'Set A New \n Password',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: 'Create a New Password',
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
                            controller: controller.newPassword,
                            label: ' Password',
                            hintText: 'Enter New Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                              color: Color(0xffB2B1B1),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextfield(
                            controller: controller.confirmNewPassword,
                            label: ' Confirm Password',
                            hintText: 'Re-Enter Your Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                              color: Color(0xffB2B1B1),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomButton(
                              text: 'Save Password',
                              onPressed: () {
                                changeSucessfullyPopUp(context);
                                // Get.toNamed(AppRoutes.forgotOtpScreen);
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

  void changeSucessfullyPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.logo),
              SizedBox(
                height: 2.h,
              ),
              CustomText(
                textAlign: TextAlign.center,
                maxLines: 3,
                text: 'Password Change Sucessfully',
                fontSize: 22,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                text: 'Back To Home',
                onPressed: () {
                  Get.toNamed(AppRoutes.BOTTOMENAVBAR);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
