import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constant/app_images.dart';
import '../../../constant/colors.dart';

class BuildActionButtons extends StatelessWidget {
  const BuildActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: 4.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.sp),
              color: Colors.white,
              border: Border.all(
                color: AppColors.borderColor, //
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.bookmark,color: AppColors.primary,),
                ImageIcon(
                  AssetImage(AppImages.bookmarkIcon),
                  color: AppColors.primary,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'Favourite',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy'),
                ),
              ],
            )),
        Container(
            height: 4.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.sp),
              color: Colors.white,
              border: Border.all(
                color: AppColors.borderColor, //
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //     height: 2.5.h,
                //     width: 2.5.h,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: AppColors.primary
                //     ),
                //     child: Icon(Icons.refresh,color: AppColors.white,size: 16.sp,)),
                ImageIcon(
                  AssetImage(AppImages.refreshIcon),
                  color: AppColors.primary,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'Refresh',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy'),
                ),
              ],
            )),
        Container(
            height: 4.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.sp),
              color: Colors.white,
              border: Border.all(
                color: AppColors.borderColor, //
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.bookmark,color: AppColors.primary,),
                ImageIcon(
                  AssetImage(AppImages.shareIcon),
                  color: AppColors.primary,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'Share',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy'),
                ),
              ],
            )),
      ],
    );
  }
}
