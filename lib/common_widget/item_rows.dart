import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';
import 'my_font.dart';

class ItemRow extends StatelessWidget {
  final String icon;
  final String title;
  final String? value;
  final void Function(bool)? onChanged;
  const ItemRow(
      {super.key,
      required this.icon,
      required this.title,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //icon
            Image.asset(icon, width: 30),
            const SizedBox(width: 20),

            //title
            MyFont(text: title, fontWeight: FontWeight.bold)
          ],
        ),
        Row(
          children: [
            //value
            value != null
                ? MyFont(
                    text: value!,
                    color: AppColors.gray30,
                    fontWeight: FontWeight.w500,
                    size: 16,
                  )
                : CupertinoSwitch(
                    value: false,
                    onChanged: onChanged,
                    trackColor: AppColors.gray30,
                  ),

            const SizedBox(width: 10),

            //arrow
            if (value != null) Image.asset("assets/img/next.png", width: 15),
          ],
        )
      ],
    );
  }
}
