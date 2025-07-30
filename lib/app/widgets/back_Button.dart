import 'package:flutter/cupertino.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:myza_thougths/app/widgets/custamContainer.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      fun: () {
        Navigator.pop(context);
      },
      height: 30,
      width: 35,
      cir: 7,
      borders: true,
      borderCol: AppColors.borderColor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(AppImages.arrowBackIcon),
      ),
    );
  }
}
