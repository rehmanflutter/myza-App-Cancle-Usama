import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/ProfileController/profile_controller.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:myza_thougths/app/views/Profile/widgets/profilePictureWithRing.dart';
import 'package:myza_thougths/app/views/gratitude/gratitude_list_sc.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:myza_thougths/app/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 34.h,
                    ),
                    Container(
                      height: 24.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(AppImages.onboarding),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(bottom: 0, child: ProfilePictureWithRing()),
                    Positioned(
                      bottom: 35,
                      right: 10,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.settingScreen);
                              },
                              child: Icon(Icons.settings))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextfield(
                      controller: controller.firstName,
                      width: 40.w,
                      height: 6.5.h,
                      label: 'First Name',
                    ),
                    CustomTextfield(
                      controller: controller.lastName,
                      width: 40.w,
                      height: 6.5.h,
                      label: 'Last Name',
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextfield(
                      controller: controller.userName,
                      width: 60.w,
                      height: 6.5.h,
                      label: 'Username',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Profile Visibility',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        Obx(
                          () => Transform.scale(
                            scale: 90 / 100,
                            child: CupertinoSwitch(
                              value: controller.profileVisibility.value,
                              onChanged: (bool value) {
                                controller.profileVisibility.value = value;
                              },
                              activeColor: CupertinoColors.activeGreen,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextfield(
                  controller: controller.userName,
                  width: double.infinity,
                  height: 6.5.h,
                  label: 'Bio',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(AppImages.edit),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(
                  () => customContainerListTile(
                    AppImages.notifications,
                    'Enable Notifications',
                    CupertinoSwitch(
                      value: controller.enableNotifications.value,
                      onChanged: (bool value) {
                        controller.enableNotifications.value = value;
                      },
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Obx(
                  () => customContainerListTile(
                    AppImages.dailyReminde,
                    'Daily Reminders',
                    CupertinoSwitch(
                      value: controller.dailyReminders.value,
                      onChanged: (bool value) {
                        controller.dailyReminders.value = value;
                      },
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Obx(
                  () => customContainerListTile(
                    AppImages.meditationAlerts,
                    'Meditation Alerts',
                    CupertinoSwitch(
                      value: controller.meditationAlerts.value,
                      onChanged: (bool value) {
                        controller.meditationAlerts.value = value;
                      },
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  width: double.infinity,
                  text: 'Logout',
                  onPressed: () {
                    Get.to(GratitudeListScreen());
                    // Get.toNamed(
                    //     AppRoutes.setYourReminders); //termsAndConditions
                    //);
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ));
  }

  Widget customContainerListTile(
      String image, String title, Widget switchWidget) {
    return CustomContainer(
      width: double.infinity,
      cir: 10,
      height: 6.h,
      col: AppColors.white,
      borderCol: AppColors.borderColor,
      borders: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image),
                CustomText(text: '   ${title}'),
              ],
            ),
            Transform.scale(
              scale: 90 / 100,
              child: switchWidget,
            ),
          ],
        ),
      ),
    );
  }
}
