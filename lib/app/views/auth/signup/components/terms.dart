import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constant/colors.dart';

class BuildTerms extends StatelessWidget {
  const BuildTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: AppColors.textGrey,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          const TextSpan(text: 'By joining, you agree to our '),
          TextSpan(
            text: 'Terms',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Privacy Policy tap
              },
          ),
          const TextSpan(text: ' & Conditions'),
        ],
      ),
    );
  }
}
