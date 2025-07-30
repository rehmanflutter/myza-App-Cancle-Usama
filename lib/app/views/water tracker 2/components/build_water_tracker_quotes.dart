import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';
import '../../../controller/water_tracker.dart';
import '../../../controller/water_tracker_2.dart';
import '../../../model/home.dart';
import '../../../model/water_tracker.dart';

class BuildWaterTrackerQuotes extends StatelessWidget {
  BuildWaterTrackerQuotes({
    super.key,
  });

  final cont = Get.put(WaterTracker2Controller());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 17.h,
      width: 100.w,
      child: CarouselSlider.builder(
        itemCount: waterTrackerQuote.length,
        options: CarouselOptions(
          enlargeCenterPage: false,
          viewportFraction: 0.79,
          onPageChanged: (index, reason) {
            cont.currentIndex.value = index;
          },
        ),
        itemBuilder: (context, index, realIndex) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.w),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 2.h,),
                      Container(
                        height: 14.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: AppColors.quote,
                        borderRadius: BorderRadius.circular(16),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     blurRadius:  5,
                        //     offset: Offset(0, 2),
                        //   ),
                        // ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              waterTrackerQuote[index].quote,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            waterTrackerQuote[index].poet,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                                      ),
                    ],
                  ),

                      Positioned(
                        top: 1.h,
                          left: 5.w,
                          // bottom: 8.h,
                          child: Image.asset(AppImages.lines, scale: 4)),
             ] ),
            );
        },
      ),
    );
  }
}
