import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? height;
  final TextStyle? style;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.decoration,
    this.letterSpacing,
    this.height,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            decoration: decoration ?? TextDecoration.none,
            letterSpacing: letterSpacing,
            height: height,
          ),
    );
  }
}
