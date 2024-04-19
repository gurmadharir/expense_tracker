import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';

class SubscriptionCell extends StatelessWidget {
  final Map obj;
  const SubscriptionCell({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.gray70.withOpacity(0.4),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //logo
          Image.asset(obj["icon"], width: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name
              MyFont(text: obj["name"]),
              const SizedBox(height: 5),

              //budget
              MyFont(
                text: "\$${obj["price"]}",
                size: 20,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ),
    );
  }
}
