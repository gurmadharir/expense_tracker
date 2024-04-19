import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';

class MySegmentButton extends StatelessWidget {
  final String btnName;
  final Function()? onTap;
  final bool isActive;
  const MySegmentButton(
      {super.key, required this.btnName, this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width * 0.45,
        margin: const EdgeInsets.all(5),
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: isActive ? AppColors.gray50.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border.withOpacity(0.1)),
        ),
        child: Center(
          child: MyFont(
            text: btnName,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
            size: 14,
          ),
        ),
      ),
    );
  }
}
