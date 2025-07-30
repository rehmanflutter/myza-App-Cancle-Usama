import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/widgets/back_Button.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                CustomText(
                  text: 'Terms & Conditions',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Image.asset(AppImages.logo),
            SizedBox(
              height: 3.h,
            ),
            CustomContainer(
              width: double.infinity,
              height: 50.h,
              cir: 10,
              borderCol: AppColors.borderColor,
              borders: true,
              col: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    CustomText(
                      text: 'Effective Date: 28/1/2023',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                        maxLines: 5,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        text:
                            'Welcome to Myza Thoughts By accessing or using our app, you agree to be bound by these Terms and Conditions. If you do not agree, please do not use the app.'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomText(
                      text: '1. Use of the App',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                        maxLines: 5,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        text:
                            'You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others.'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomText(
                      text: 'User Accounts',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                        maxLines: 5,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        text:
                            'You are responsible for maintaining the confidentiality of your account information.')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
