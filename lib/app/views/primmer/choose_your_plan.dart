import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/PrimmerController/Primmer_controller.dart';
import 'package:myza_thougths/app/widgets/back_Button.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseYourPrimmerPlan extends StatelessWidget {
  ChooseYourPrimmerPlan({super.key});
  final controller = Get.put(PrimmerController());
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
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.clear_outlined)),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomText(
              text: 'Choose Your Plan',
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomText(
                textAlign: TextAlign.center,
                maxLines: 3,
                text:
                    'More tools, more calm. Upgrade when you’re ready to deepen your journey.',
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Image.asset(AppImages.primime),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => CustomContainer(
                fun: () {
                  controller.chooseAnnualPlan.value = true;
                },
                width: double.infinity,
                borders: true,
                borderCol: controller.chooseAnnualPlan.value == true
                    ? AppColors.primary
                    : Color(0xfff3f3f3),
                col: controller.chooseAnnualPlan.value == true
                    ? Color(0xFFfbf6ed)
                    : Color(0xfff3f3f3),
                cir: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Annual',
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: 'First 30 days free - Then \$999/Year',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ),
                      CustomContainer(
                        height: 20,
                        width: 70,
                        cir: 30,
                        col: AppColors.primary,
                        child: CustomText(
                          text: 'Best Value',
                          fontSize: 9,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => CustomContainer(
                fun: () {
                  controller.chooseAnnualPlan.value = false;
                },
                width: double.infinity,
                borders: true,
                borderCol: controller.chooseAnnualPlan.value == false
                    ? AppColors.primary
                    : Color(0xfff3f3f3),
                col: controller.chooseAnnualPlan.value == false
                    ? Color(0xFFfbf6ed)
                    : Color(0xfff3f3f3),
                cir: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Monthly',
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: 'First 7 days free - Then \$99/Month',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ),
                      // CustomContainer(
                      //   height: 20,
                      //   width: 70,
                      //   cir: 30,
                      //   col: AppColors.primary,
                      //   child: CustomText(
                      //     text: 'Best Value',
                      //     fontSize: 9,
                      //     color: AppColors.white,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomButton(
              width: double.infinity,
              text: 'Start 30-day free trial',
              onPressed: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'By placing this order, you agree to the '),
                      TextSpan(
                        text: 'Terms of Service ',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: 'Privacy Policy. ',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                          text:
                              'Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period'),
                    ]))
          ],
        ),
      ),
    );
  }
}
