import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color buttonColor;
  final Color buttonTextColor;
  final bool textIsBold;
  final double fontSize;
  final double width;
  final double height;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.textIsBold,
    required this.fontSize,
    required this.width,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                color: buttonTextColor,
                fontSize: fontSize,
                fontWeight: textIsBold ? FontWeight.bold : FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
