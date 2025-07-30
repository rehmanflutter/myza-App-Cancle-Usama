import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_images.dart';
import '../../../constant/colors.dart';
import '../../../controller/auth.dart';

class PinScreen extends StatelessWidget {
  PinScreen({super.key});
  final authCont = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.biometricScreen,
              fit: BoxFit.cover,
              height: 100.h,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 84.sp),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21.sp),
                    ),
                    child: Container(
                      height: 48.h,
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
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(4, (index) {
                                  bool isFilled =
                                      index < authCont.pin.value.length;
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      child: Container(
                                        height: 2.4.h,
                                        width: 1.4.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.sp),
                                            border:
                                                Border.all(color: Colors.brown),
                                            color: isFilled
                                                ? Colors.brown
                                                : Colors.white),
                                      ));
                                }),
                              ),
                            ),
                            SizedBox(height: 1.h),

                            // Number pad
                            Expanded(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 12,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 2.h,
                                        crossAxisSpacing: 2.w,
                                        childAspectRatio: 1.7),
                                itemBuilder: (context, index) {
                                  if (index == 9)
                                    return SizedBox(); // Empty at index 9
                                  if (index == 11) {
                                    // Backspace
                                    return InkWell(
                                      onTap: authCont.deleteDigit,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: Icon(Icons.backspace,
                                            color: Colors.brown),
                                      ),
                                    );
                                  }

                                  String number =
                                      index == 10 ? '0' : '${index + 1}';
                                  return InkWell(
                                    onTap: () => authCont.addDigit(number),
                                    child: Container(
                                      // height: 8.h,
                                      // width: 10.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade100,
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        number,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
