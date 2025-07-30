import 'package:flutter/material.dart';
import 'package:myza_thougths/app/widgets/custom_button.dart';
import 'package:myza_thougths/app/widgets/custom_multi-line_field.dart';
import 'package:myza_thougths/app/widgets/custom_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constant/colors.dart';

import 'package:flutter/material.dart';
import 'dart:math';

class GratitudeListScreen extends StatelessWidget {
  const GratitudeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text("Water Tracker",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              CustomMultiLineTextField(
                hintText: 'Grateful for...',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              CustomMultiLineTextField(
                hintText: 'Something that mad you smile today...',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              CustomMultiLineTextField(
                hintText: 'A moment of peace or joys...',
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Save & reflect',
                    onPressed: () {},
                    width: 44.w,
                  ),
                  CustomButton(
                    text: 'Add More',
                    onPressed: () {},
                    borderColor: Colors.black,
                    backgroundColor: Colors.white,
                    isBorder: true,
                    width: 42.w,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: 'Previous Gratitude Logs',
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomHabitContainer()
            ],
          ),
        ),
      ),
    );
  }
}

////////////
///
///
///
class CustomHabitContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 2),
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: HabitBorderPainter(),
                      child: ClipPath(
                        clipper: HabitContainerClipper(),
                        child: Container(
                          width: 60.w,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(31, 13, 12, 12),
                                blurRadius: 8,
                                offset: Offset(9, 4),
                              ),
                            ],
                          ),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              habitChip(
                                  'Dog Walk', Icons.pets, Color(0xFFFF7043)),
                              SizedBox(
                                width: 30,
                              ),
                              habitChip('Sunlight', Icons.wb_sunny,
                                  Color(0xFFFFD54F)),
                              habitChip('Tea Pack', Icons.emoji_food_beverage,
                                  Color(0xFFFFA726)),
                              habitChip(
                                  'Message', Icons.message, Color(0xFF4FC3F7)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          // color: Colors.red[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '📅 Apr 20',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget habitChip(String label, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

// class HabitContainerClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const radius = 30.0;

//     Path path = Path();

//     // Top-left corner
//     path.moveTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);

//     // Top edge and notch
//     path.lineTo(size.width - 90 - radius, 0);
//     path.quadraticBezierTo(size.width - 90, 0, size.width - 90, radius);
//     path.lineTo(size.width - 90, 30);
//     path.lineTo(size.width - radius, 30);
//     path.quadraticBezierTo(size.width, 30, size.width, 30 + radius);

//     // Right edge
//     path.lineTo(size.width, size.height - radius);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width - radius, size.height);

//     // Bottom edge
//     path.lineTo(radius, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - radius);

//     // Close path
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

class HabitContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 30.0;
    Path path = Path();

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.lineTo(size.width - 90 - radius, 0);
    path.quadraticBezierTo(size.width - 90, 0, size.width - 90, radius);
    path.lineTo(size.width - 90, 30);
    path.lineTo(size.width - radius, 30);
    path.quadraticBezierTo(size.width, 30, size.width, 30 + radius);

    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class HabitBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = HabitContainerClipper().getClip(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
