import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import 'my_font.dart';

class MyRow extends StatelessWidget {
  final String title;
  final String value;
  const MyRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyFont(text: title, fontWeight: FontWeight.w500),
        Row(
          children: [
            MyFont(
              text: value,
              color: AppColors.gray20,
              fontWeight: FontWeight.w500,
              size: 14,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/next.png",
                width: 18,
              ),
            )
          ],
        )
      ],
    );
  }
}
