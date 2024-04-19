import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';


class StatusIndicator extends StatelessWidget {
  final String title;
  final int? activeSubs;
  final double? budget;
  final Color statusColor;
  const StatusIndicator(
      {super.key,
      required this.title,
      this.activeSubs,
      required this.statusColor,
      this.budget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: double.maxFinite,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //title
              MyFont(
                text: title,
                color: AppColors.gray30.withOpacity(0.3),
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 5),

              //active subs
              MyFont(
                text: activeSubs != null ? activeSubs.toString() : "\$$budget",
                fontWeight: FontWeight.w500,
                size: 15,
              ),
            ],
          ),
        ),

        //status-color
        Positioned(
          top: 7,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 1,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}
