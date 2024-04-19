import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'my_font.dart';


class BudgetTrackerButton extends StatelessWidget {
  final Map obj;
  const BudgetTrackerButton({super.key, required this.obj});

  //budget left to spend
  String calculateBudgetLeft() {
    double leftBudget = obj["wholeBudget"] - obj["spendedBudget"] + 1;
    String asAString = leftBudget.toString();

    return asAString.substring(0, asAString.indexOf('.'));
  }

  //get average (indicator)
  double spendedBudgetPercentage() {
    return double.parse(calculateBudgetLeft()) / obj["wholeBudget"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.gray60.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //icon
                    Image.asset(
                      obj["icon"],
                      width: 45,
                      color: AppColors.gray10.withOpacity(0.7),
                    ),
                    const SizedBox(width: 20),

                    //budget type & budget left to spend
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //type
                        MyFont(
                            text: obj["budgetType"],
                            fontWeight: FontWeight.bold),
                        const SizedBox(height: 5),

                        //budget left to spend
                        MyFont(
                          text: "\$${calculateBudgetLeft()} left to spend",
                          color: AppColors.gray30,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),

                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFont(
                      text: "\$${obj["spendedBudget"]}",
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    MyFont(
                      text: "of \$${obj["wholeBudget"]}",
                      color: AppColors.gray30.withOpacity(0.9),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            //indicator
            LinearProgressIndicator(
              backgroundColor: AppColors.gray60,
              valueColor: AlwaysStoppedAnimation(obj["indicatorColor"]),
              minHeight: 3,
              value: spendedBudgetPercentage(),
            )
          ],
        ),
      ),
    );
  }
}
