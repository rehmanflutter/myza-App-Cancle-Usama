import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';
import '../../../controller/journal.dart';
import '../../../model/bg_sounds.dart';

Widget buildBgSounds(List<BgSoundModel> bgSounds, JournalController cont) {
  return GestureDetector(
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: SizedBox(
        height: 15.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bgSounds.length,
          itemBuilder: (context, index) {
            final sound = bgSounds[index];
            return Obx(
              () {
                final isSelected = cont.selectedIndex.value == index;
                return GestureDetector(
                  // behavior: HitTestBehavior.opaque,
                  onTap: () {
                    cont.selectContainer(index);
                  },
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                        horizontal: 1.5.w, vertical: 1.8.h),
                    width: 28.w,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          sound.img,
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sound.text,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                activeTrackColor: AppColors.primary,
                                value: sound.isActive.value,
                                onChanged: (value) {
                                  sound.isActive.value = value;
                                  cont.toggleTracker(index);
                                },
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
