import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final void Function()? onPressed;
  const ImageButton({super.key, required this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: AppColors.gray60.withOpacity(0.4),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border.withOpacity(.16))),
        child: Image.asset(image, color: AppColors.gray30),
      ),
    );
  }
}
