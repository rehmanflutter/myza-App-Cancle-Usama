import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WaterTrackerCirclePainter extends CustomPainter {
  final double progress;

  WaterTrackerCirclePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2.w;

    const double startAngle = 2.1 * pi / 3; // 240 degrees = 8 o'clock

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = Color(0xFFE6EDF5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.w
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Determine active progress
    final currentProgress = progress;

    // Draw progress arc
    final progressPaint = Paint()
      ..color = Color(0xFF47B0F5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.w
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
      ..color = Color(0xFF47B0F5)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(thumbX, thumbY), 4.w, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant WaterTrackerCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;}
}
