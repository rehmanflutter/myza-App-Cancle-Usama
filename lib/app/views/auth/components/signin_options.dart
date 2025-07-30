import 'package:flutter/material.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';

class SignInOptionsRow extends StatelessWidget {
  const SignInOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInOptions(
          img: 'assets/images/icons/google.png',
          onPressed: () {},
        ),
        SizedBox(
          width: 3.w,
        ),
        SignInOptions(
          img: 'assets/images/icons/facebook.png',
        ),
        SizedBox(
          width: 3.w,
        ),
        SignInOptions(
          img: 'assets/images/icons/apple.png',
        ),
        SizedBox(
          width: 3.w,
        ),
        SignInOptions(
          img: 'assets/images/icons/mobile.png',
        ),
      ],
    );
  }
}

class SignInOptions extends StatelessWidget {
  final String img;
  final VoidCallback? onPressed;
  const SignInOptions({
    super.key,
    required this.img,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 4.8.h,
          width: 17.5.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: AppColors.borderColor)),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              img,
              height: 2.h,
            ),
          )),
    );
  }
}
