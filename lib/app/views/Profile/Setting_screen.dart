import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/ProfileController/profile_controller.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:myza_thougths/app/widgets/back_Button.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  text: 'Setting',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTileContainer(
                icon: AppImages.helpicon, title: 'Help & Support '),
            CustomTileContainer(icon: AppImages.feedback, title: 'Feedback'),
            CustomTileContainer(
              icon: AppImages.privacy,
              title: 'Privacy Policy',
              onTap: () {
                Get.toNamed(AppRoutes.termsAndConditions);
              },
            ),
            CustomTileContainer(
              icon: AppImages.appversi,
              title: 'App Version',
              widget: CustomText(text: 'v1.2.3'),
            ),
            CustomTileContainer(
                icon: AppImages.concect, title: 'Developer Contact'),
            CustomTileContainer(
              icon: AppImages.security,
              title: 'Security',
              onTap: () {
                Get.toNamed(AppRoutes.chooseYourPrimmerPlan);
              },
            ),
            CustomTileContainer(
              icon: AppImages.darkmood,
              title: 'Dark Mode',
              widget: Obx(
                () => Transform.scale(
                  scale: 90 / 100,
                  child: CupertinoSwitch(
                    value: controller.darkMood.value,
                    onChanged: (bool value) {
                      controller.darkMood.value = value;
                    },
                    activeColor: CupertinoColors.activeGreen,
                  ),
                ),
              ),
            ),
            CustomTileContainer(
              icon: AppImages.notification,
              title: 'Notification',
              widget: SizedBox(),
              onTap: () {
                Get.toNamed(AppRoutes.setYourReminders);
              },
            ),
            CustomTileContainer(
                icon: AppImages.moodHistory,
                title: 'Mood History',
                widget: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class CustomTileContainer extends StatelessWidget {
  final String icon;
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;

  CustomTileContainer(
      {required this.icon, required this.title, this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.only(bottom: 15),
      fun: onTap,
      width: double.infinity,
      height: 6.h,
      borders: true,
      cir: 10,
      borderCol: AppColors.borderColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon),
                CustomText(
                  text: '   $title',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            widget ?? Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
