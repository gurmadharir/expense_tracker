import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import '../common_widget/item_rows.dart';
import '../common_widget/my_font.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 15, right: 20),
          child: Column(
            children: [
              //custom header
              Row(
                children: [
                  //back_arrow
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset("assets/img/back.png", width: 25)),
                  const Spacer(),

                  //text
                  MyFont(text: "Settings", color: AppColors.gray30),
                  const SizedBox(width: 20),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 15),

              //profile-pic
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/img/IMG_0007.jpeg"),
              ),
              const SizedBox(height: 5),

              //name
              const MyFont(
                text: "Gurmad Harir",
                fontWeight: FontWeight.bold,
                size: 22,
              ),
              const SizedBox(height: 3),

              //gmail
              MyFont(
                text: "gurmad642@gmail.com",
                color: AppColors.gray30,
                size: 12,
              ),
              const SizedBox(height: 5),

              //edit-btn
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 20)),
                child: const MyFont(text: "Edit profile"),
              ),
              const SizedBox(height: 5),

              //general
              const Align(
                alignment: Alignment.topLeft,
                child: MyFont(text: "General", fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              //
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.gray60.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18)),
                child: const Column(
                  children: [
                    ItemRow(
                      icon: "assets/img/face_id.png",
                      title: "Security",
                      value: "FaceID",
                    ),
                    SizedBox(height: 15),
                    ItemRow(
                      icon: "assets/img/icloud.png",
                      title: "Icloud Sync",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //Subscription
              const Align(
                alignment: Alignment.topLeft,
                child:
                    MyFont(text: "Subscription", fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.gray60.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18)),
                child: const Column(
                  children: [
                    ItemRow(
                      icon: "assets/img/sorting.png",
                      title: "Sorting",
                      value: "Date",
                    ),
                    SizedBox(height: 15),
                    ItemRow(
                      icon: "assets/img/chart.png",
                      title: "Summary",
                      value: "Average",
                    ),
                    SizedBox(height: 15),
                    ItemRow(
                      icon: "assets/img/money.png",
                      title: "Default currency",
                      value: "USD (\$)",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //Appearance
              const Align(
                alignment: Alignment.topLeft,
                child: MyFont(text: "Appearance", fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.gray60.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18)),
                child: const Column(
                  children: [
                    ItemRow(
                      icon: "assets/img/app_icon.png",
                      title: "App icon",
                      value: "Default",
                    ),
                    SizedBox(height: 15),
                    ItemRow(
                      icon: "assets/img/light_theme.png",
                      title: "Theme",
                      value: "Dark",
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
