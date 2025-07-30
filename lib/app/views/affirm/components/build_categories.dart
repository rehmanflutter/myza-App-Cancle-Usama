import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/affirm.dart';
import 'package:myza_thougths/app/model/affirm.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget buildCategories(List<AffirmCategories> cat, AffirmController cont) {
  return GestureDetector(
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: SizedBox(
        height: 14.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: cat.length,
          itemBuilder: (context, index) {
            final sound = cat[index];
            return Obx(
              () {
                final isSelected = cont.selectedIndexCat.value == index;
                return GestureDetector(
                  onTap: () {
                    Duration(milliseconds: 400).delay().then((value) {
                      Get.toNamed(AppRoutes.FOCUSMODE);
                    });

                    cont.selectContainerCat(index);
                  },
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                        horizontal: 1.5.w, vertical: 1.8.h),
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                blurRadius: 1.w,
                                spreadRadius: 0.1.w,
                                offset: Offset(0, 0),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 0.05.w,
                                offset: Offset(0, 0),
                              )
                            ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.5.h),
                        Image.asset(
                          sound.img,
                          height: 5.h,
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sound.text,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}
