import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/NotificationController/notification_controller.dart';
import 'package:myza_thougths/app/widgets/back_Button.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetYourRemindersNotification extends StatelessWidget {
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                CustomText(
                  text: 'Set Your Reminders',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomText(
              text: 'Manage Notifications',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 17.h,
              child: ListView.builder(
                itemCount: controller.manageNotificationsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelected = controller.selectedIndexes.contains(index);

                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        controller.selectedIndexes.remove(index);
                      } else {
                        controller.selectedIndexes.add(index);
                      }
                    },
                    child: CustomContainer(
                        margin: EdgeInsets.only(right: 10),
                        height: 17.h,
                        width: 32.w,
                        borders: true,
                        col: AppColors.white,
                        shadow: isSelected ? true : false,
                        borderCol: Color(0xffC3C3C3),
                        cir: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 7.h,
                                          child: Image.asset(controller
                                              .manageNotificationsList[index]
                                              .images)),
                                    ],
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: isSelected
                                        ? Colors.green
                                        : Color(0xffC3C3C3),
                                  )
                                ],
                              ),
                              Container(
                                width: 28.w,
                                child: CustomText(
                                  fontSize: 15.sp,
                                  text: controller
                                      .manageNotificationsList[index].title,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
