import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/water_tracker_2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'water_circle_painter.dart';

class WaterTrackerCircle extends StatelessWidget {
  final WaterTracker2Controller controller;
  final double size;

  const WaterTrackerCircle({
    super.key,
    required this.controller,
    this.size = 0.45,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: AnimatedScale(
            scale: controller.pulseScale.value,
            duration: const Duration(milliseconds: 300),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size * 100.w,
                  height: size * 100.w,
                  child: CustomPaint(
                    painter: WaterTrackerCirclePainter(
                      progress: controller.progress.value,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${controller.currentCups.value}/${controller.totalCups}",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
