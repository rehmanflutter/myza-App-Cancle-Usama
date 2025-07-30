import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteScroller extends StatelessWidget {
  final List<String> quotes;
  final RxInt currentIndex;
  final String attribution;

  const QuoteScroller({
    super.key,
    required this.quotes,
    required this.currentIndex,
    required this.attribution,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Carousel
          CarouselSlider.builder(
            itemCount: quotes.length,
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.78,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Obx(() {
                bool isCenter = currentIndex.value == index;
                return Transform.translate(
                  offset: Offset(0, isCenter ? 0.h : -1.h),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 22.sp),
                    child: AnimatedContainer(
                      width: 90.w,
                      height: 18.h,
                      duration: Duration(milliseconds: 400),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Color(0XFFEFEEE8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: isCenter ? 8 : 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quotes[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isCenter ? 17.sp : 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            attribution,
                            style: TextStyle(
                              fontSize: isCenter ? 16.sp : 14.sp,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
          ),

          // Indicator
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(quotes.length, (index) {
                  bool isActive = currentIndex.value == index;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    width: isActive ? 8.w : 4.w,
                    height: 0.6.h,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.brown : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }
}
