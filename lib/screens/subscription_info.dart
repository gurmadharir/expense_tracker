import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';
import '../common_widget/my_row.dart';
import 'main_tab_view.dart';


class SubscriptionInfo extends StatelessWidget {
  final Map obj;
  SubscriptionInfo({super.key, required this.obj});

  //info list
  List info = [
    {"title": "Name", "value": "Spotify"},
    {"title": "Description", "value": "Music App"},
    {"title": "Category", "value": "Entertainment"},
    {"title": "First Payment", "value": "04.03.2024"},
    {"title": "Reminder", "value": "Never"},
    {"title": "Currency", "value": "USD(\$)"},
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Container(
        height: screenSize.height,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 28, 28, 33),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            //upper part
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: screenSize.height * .5,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.gray70.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    //header
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //drop_down_arrow
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainTabView();
                              }));
                            },
                            icon: Image.asset(
                              "assets/img/dorp_down.png",
                              width: 25,
                            ),
                          ),
                          MyFont(
                            text: "Subscription Info",
                            color: AppColors.gray20,
                          ),

                          //delete button
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/img/Trash.png",
                              width: 25,
                              color: AppColors.gray30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    //logo
                    Image.asset(obj["icon"], width: 85),
                    const SizedBox(height: 15),

                    //name
                    SizedBox(
                      width: 130,
                      child: Text(
                        obj["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //price
                    MyFont(
                      text: "\$${obj["price"]}",
                      fontWeight: FontWeight.bold,
                      size: 20,
                      color: AppColors.gray30,
                    ),
                  ],
                ),
              ),
            ),

            //lower part
            Positioned(
              top: screenSize.height * .42,
              left: 10,
              right: 10,
              bottom: 90,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.gray70.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 15, top: 13),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            var infoObj = info[index] as Map? ?? {};
                            return MyRow(
                                title: infoObj["title"],
                                value: infoObj["value"]);
                          }),
                    )
                  ],
                ),
              ),
            ),

            //save button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: MyRoundedButton(
                btnName: "Save",
                btnColor: AppColors.gray70,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
