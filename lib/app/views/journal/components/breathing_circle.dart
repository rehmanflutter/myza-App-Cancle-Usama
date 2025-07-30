// breathing_circle.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/breathing.dart';
import 'circular_silder_painter.dart';

class BreathingCircle extends StatelessWidget {
  final BreathingController controller;
  final double size;

  const BreathingCircle({
    super.key,
    required this.controller,
    this.size = 0.4, // 40% of screen width by default
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onLongPressStart: (details) => controller.startTimer(),
                onLongPressEnd: (details) => controller.stopTimer(),
                child: AnimatedScale(
                  scale: controller.pulseScale.value,
                  duration: Duration(milliseconds: 300),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size * 100.w,
                        height: size * 100.w,
                        child: CustomPaint(
                          painter: CircularSliderPainter(
                            progress: controller.progress.value,
                            isActive: controller.isHolding.value,
                            holdProgress: controller.savedProgress.value,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            controller.formatTime(),
                            style: GoogleFonts.aBeeZee(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // fontFamily: 'Gilroy'
                            ),
                          ),
                          Obx(() => Text(
                                controller.status.value,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: controller.status.value == 'Hold'
                                        ? AppColors.black
                                        : AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Gilroy'),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
