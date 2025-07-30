import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colors.dart';

Widget CustomDivider() {
  return Divider(
    height: 0.1.h,
    thickness: 1,
    color: AppColors.borderColor,
  );
}
