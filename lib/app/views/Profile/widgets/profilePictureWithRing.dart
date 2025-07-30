import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myza_thougths/app/constant/app_images.dart';

class ProfilePictureWithRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(150, 150),
          painter: HalfRingPainter(),
        ),
        CircleAvatar(
          radius: 60,
          backgroundImage:
              AssetImage(AppImages.onboarding), // replace with your image
        ),
        Positioned(
          bottom: 16,
          right: 37,
          child: CircleAvatar(
            radius: 13,
            backgroundColor: Colors.orange,
            child: Icon(Icons.camera_alt, color: Colors.white, size: 16),
          ),
        ),
      ],
    );
  }
}

class HalfRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;

    // Draw arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius - 5),
      -pi / 5, // start angle
      1.7 * pi / 1, // sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
