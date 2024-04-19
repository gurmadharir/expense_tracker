import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool? isObstureText;
  final void Function()? suffixIconClicked;

  const MyTextField({
    super.key,
    required this.hintText,
    this.fillColor = Colors.transparent,
    required this.prefixIcon,
    this.prefixIconColor = Colors.white,
    this.suffixIcon,
    this.suffixIconColor,
    this.isObstureText = false,
    this.suffixIconClicked,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObstureText!,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(prefixIcon, color: prefixIconColor, size: 28),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: suffixIconClicked,
            child: Icon(
              suffixIcon,
              color: AppColors.gray30,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
