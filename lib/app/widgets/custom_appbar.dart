import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.5.h, left: 6.w, right: 3.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 3.h,
              width: 3.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.sp),
                border: Border.all(color: AppColors.unFocusGreyClr),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: const Color(0xFF654732),
                  size: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 21.w),
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

    //     AppBar(
    //   backgroundColor: AppColors.backgroundColor,
    //   centerTitle: true,
    //   leadingWidth: 11.w,
    //   toolbarHeight: 3.1.h,
    //   title: Text(
    //     title,
    //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
    //   ),
    //   leading: Padding(
    //     padding: EdgeInsets.only(left: 4.w),
    //     child: GestureDetector(
    //       onTap: () => Get.back(),
    //       child: Container(
    //         // height: 1.h,
    //         // width: 3.h,
    //         decoration: BoxDecoration(
    //           color: AppColors.white,
    //           borderRadius: BorderRadius.circular(12.sp),
    //           border: Border.all(color: AppColors.unFocusGreyClr),
    //         ),
    //         child: Center(
    //           child: Icon(
    //             Icons.arrow_back_ios_new_rounded,
    //             color: const Color(0xFF654732),
    //             size: 16.sp,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
