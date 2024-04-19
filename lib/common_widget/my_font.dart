import 'package:flutter/material.dart';

class MyFont extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final double height;
  const MyFont(
      {super.key,
      required this.text,
      this.size = 18,
      this.color = Colors.white,
      this.fontWeight = FontWeight.w400,
      this.height = 1.4});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "assets/font/Inter-Medium.ttf",
        height: height,
      ),
    );
  }
}
