import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myza_thougths/app/constant/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircularSliderPainter extends CustomPainter {
  final double progress;
  final bool isActive;
  final double holdProgress;

  CircularSliderPainter({
    required this.progress,
    required this.isActive,
    required this.holdProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2.w;

    const double startAngle = 2.1 * pi / 3; // 240 degrees = 8 o'clock

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw clock-like markers (40 ticks)
    final markerPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4.w;

    const int markerCount = 40;
    const double markerLength = 4;
    const double markerIndent = 20;

    for (int i = 0; i < markerCount; i++) {
      final angle = 2 * pi * i / markerCount + startAngle;
      final startPoint = Offset(
        center.dx + (radius - markerIndent) * cos(angle),
        center.dy + (radius - markerIndent) * sin(angle),
      );
      final endPoint = Offset(
        center.dx + (radius - markerIndent + markerLength) * cos(angle),
        center.dy + (radius - markerIndent + markerLength) * sin(angle),
      );
      canvas.drawLine(startPoint, endPoint, markerPaint);
    }

    // Determine active progress
    final currentProgress = isActive ? progress : holdProgress;

    // Draw progress arc
    final progressPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * currentProgress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw progress thumb (dot at the end of the arc)
    final thumbAngle = startAngle + sweepAngle;
    final thumbX = center.dx + radius * cos(thumbAngle);
    final thumbY = center.dy + radius * sin(thumbAngle);

    final thumbPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(thumbX, thumbY), 3.w, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CircularSliderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.isActive != isActive ||
        oldDelegate.holdProgress != holdProgress;
  }
}
