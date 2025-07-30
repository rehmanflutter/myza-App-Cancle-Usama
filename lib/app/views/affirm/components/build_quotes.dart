import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../model/affirm.dart';

class BuildAffirmQuotes extends StatelessWidget {
  const BuildAffirmQuotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: affirmQuote.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 18.sp),
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: Color(0XFFEFEEE8),
                  borderRadius: BorderRadius.circular(20),
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
                        affirmQuote[index].quote,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      affirmQuote[index].poet,
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
            );
          }),
    );
  }
}
