import 'package:flutter/material.dart';

import 'my_font.dart';

class MyRoundedButton extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final IconData? icon;
  final Color? fontColor;
  final Color? iconColor;
  final double? width;
  final double? height;

  final void Function()? onPressed;

  const MyRoundedButton({
    super.key,
    required this.btnName,
    required this.btnColor,
    this.onPressed,
    this.icon,
    this.height = 53,
    this.width = double.maxFinite,
    this.fontColor = Colors.white,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fixedSize: Size(width!, height!),
      ),
      onPressed: onPressed,
      label: MyFont(
        text: btnName,
        size: 18,
        fontWeight: FontWeight.w500,
        color: fontColor!,
      ),
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
