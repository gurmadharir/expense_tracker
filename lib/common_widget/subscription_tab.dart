import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';

class SubscriptionTap extends StatelessWidget {
  final void Function()? onTap;
  final Map subsObj;
  const SubscriptionTap({super.key, this.onTap, required this.subsObj});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenSize.width * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.5),
        height: 65,
        decoration: BoxDecoration(
          color: AppColors.gray.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border.withOpacity(0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //logo
              Row(
                children: [
                  Image.asset(subsObj["icon"], width: 45),
                  const SizedBox(width: 20),

                  //subscription name
                  MyFont(text: subsObj["name"], fontWeight: FontWeight.bold),
                ],
              ),

              //price
              MyFont(
                text: "\$${subsObj["price"]}",
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
