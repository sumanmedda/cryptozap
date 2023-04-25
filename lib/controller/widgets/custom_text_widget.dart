import 'package:flutter/material.dart';

class CustomTextApp extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  const CustomTextApp({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
