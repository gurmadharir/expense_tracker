import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import '../common_widget/custom_arc_painter.dart';
import '../common_widget/my_font.dart';
import '../common_widget/track_budget_btn.dart';
import 'settings_screen.dart';

class BudgetScreen extends StatelessWidget {
  BudgetScreen({super.key});

  List budgetInfo = [
    {
      "budgetType": "Auto & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spendedBudget": 50.99,
      "wholeBudget": 400,
      "indicatorColor": AppColors.secondaryG,
    },
    {
      "budgetType": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spendedBudget": 125.99,
      "wholeBudget": 600,
      "indicatorColor": AppColors.secondary,
    },
    {
      "budgetType": "Secuirity",
      "icon": "assets/img/security.png",
      "spendedBudget": 80.99,
      "wholeBudget": 300,
      "indicatorColor": AppColors.primary500,
    },
  ];

  //total spended budget
  String totalBudgetSpended() {
    double total = 0.0;

    for (int i = 0; i < budgetInfo.length - 1; i++) {
      total += budgetInfo[i]["spendedBudget"];
    }

    //total  as a string
    String spendedBudget = total.toString();

    //if the no next to . == 0
    if (spendedBudget.indexOf('.') + 1 == 0) {
      spendedBudget = spendedBudget.substring(0, spendedBudget.indexOf('.'));

      //round
    } else if (spendedBudget.indexOf('.') + 1 != 0) {
      spendedBudget =
          spendedBudget.substring(0, spendedBudget.indexOf('.') + 3);
    }

    return spendedBudget;
  }

  //whole budget
  num wholeBudget() {
    num total = 0;

    for (int i = 0; i < budgetInfo.length - 1; i++) {
      total += budgetInfo[i]["wholeBudget"];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final sreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.gray,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingsScreen();
                }));
              },
              child: Image.asset(
                "assets/img/settings.png",
                color: AppColors.gray30,
                width: 28,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Center(
                child:
                    MyFont(text: "Spending & Budgets", color: AppColors.gray30),
              ),
              const SizedBox(height: 53),

              //Arc Chart
              Container(
                height: sreenSize.height * .14,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    //chart
                    Positioned(
                      top: 0,
                      left: 100,
                      right: 100,
                      bottom: 0,
                      child: CustomPaint(
                        painter: CustomArcPainter(),
                      ),
                    ),

                    //total spended budget
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          MyFont(
                            text: "\$${totalBudgetSpended()}",
                            size: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 8),
                          MyFont(
                            text: "of \$${wholeBudget()} budget",
                            color: AppColors.gray30,
                            size: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),

              //your budgets are on track
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: AppColors.gray60.withOpacity(0.7),
                      )),
                ),
                child: const MyFont(text: "Your budgets are on track"),
              ),
              const SizedBox(height: 8),

              //other buttons
              SizedBox(
                height: sreenSize.height * .375,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: budgetInfo.length,
                    itemBuilder: (context, index) {
                      //creating a sample object from budgetInfo list
                      final currentBudgetInfo = budgetInfo[index] as Map? ?? {};

                      return BudgetTrackerButton(obj: currentBudgetInfo);
                    }),
              ),

              //add new category
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(22),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.gray60),
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyFont(
                      text: "Add a new category",
                      color: AppColors.gray30,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      "assets/img/add.png",
                      width: 20,
                      color: AppColors.gray10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
