import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/controller/AuthController/forgotPasswordController.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotOtpScreen extends StatelessWidget {
  ForgotOtpScreen({super.key});
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
                  text: 'Check your Email',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: 'We send 6 digit code to your email',
                  fontSize: 10,
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 42.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
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
                                children: List.generate(6, (index) {
                                  bool isFilled =
                                      index < controller.forgotOTP.value.length;
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
                                  if (index == 9) return SizedBox();
                                  if (index == 11) {
                                    return InkWell(
                                      onTap: controller.deleteDigit,
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
                                    onTap: () => controller.addDigit(number),
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
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
