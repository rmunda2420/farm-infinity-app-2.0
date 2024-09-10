import 'package:flutter/material.dart';

class CustomRoundedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;

  const CustomRoundedElevatedButton(
      {required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      required this.fontSize,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        fixedSize: Size(width, height),
      ),
      child: Text(text),
    );
  }
}
