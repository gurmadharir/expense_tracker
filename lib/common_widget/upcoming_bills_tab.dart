import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';

class UpcomingBillsTab extends StatelessWidget {
  final void Function()? onTap;
  final Map billsObj;
  const UpcomingBillsTab({super.key, this.onTap, required this.billsObj});

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
          color: AppColors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border.withOpacity(0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //Date
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.gray70.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        MyFont(text: "June", size: 14, color: AppColors.gray30),
                        MyFont(
                          text: "25",
                          color: AppColors.gray30,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),

                  //bill name
                  MyFont(
                      text: billsObj["name"],
                      fontWeight: FontWeight.bold,
                      size: 16),
                ],
              ),

              //price
              MyFont(
                text: "\$${billsObj["price"]}",
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
