import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:myza_thougths/app/widgets/back_Button.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  text: 'Error',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Image.asset(AppImages.error404),
            CustomText(
              text: 'Oops, something went wrong',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText(
                textAlign: TextAlign.center,
                text:
                    'We couldn’t complete your request. Please try again or return to the homepage.',
                fontSize: 14,
                maxLines: 4,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomButton(
              width: double.infinity,
              text: 'Try Again',
              onPressed: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomContainer(
                fun: () {
                  Navigator.pop(context);
                },
                width: double.infinity,
                height: 5.h,
                borders: true,
                cir: 10,
                child: CustomText(
                  text: 'Back to Home',
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
