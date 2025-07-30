import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constant/colors.dart';

class RegisterWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const RegisterWidget({
    super.key,
    this.onPressed,
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
          const TextSpan(text: 'Don\'t have an account? '),
          TextSpan(
            text: 'Register yourself',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
