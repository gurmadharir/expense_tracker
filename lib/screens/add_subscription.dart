import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/color_extension.dart';
import '../common_widget/image_button.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';

StateProvider amountValueProvider = StateProvider<double>((ref) => 0.09);

// ignore: must_be_immutable
class AddSubscriptionScreen extends StatelessWidget {
  AddSubscriptionScreen({super.key});

  List subsList = [
    {"name": "Youtube Premium", "icon": "assets/img/youtube_logo.png"},
    {"name": "Microsoft OneDrive", "icon": "assets/img/onedrive_logo.png"},
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png"},
    {"name": "Icloud", "icon": "assets/img/icloud.png"},
    {"name": "Netflix", "icon": "assets/img/netflix_logo.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.height * .6,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: AppColors.gray70,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      //back arrow
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: screenSize.width * .32),

                      MyFont(text: "New", color: AppColors.gray60),
                    ],
                  ),

                  //new subscription
                  const SizedBox(height: 20),
                  const Text(
                    "Add a new \nsubscription",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"),
                  ),
                  const SizedBox(height: 30),

                  //carousal-sliders
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        viewportFraction: 0.6,
                        enlargeFactor: 0.4,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      itemCount: subsList.length,
                      itemBuilder: (context, itemIndex, pageViewIndex) {
                        var subListObj = subsList[itemIndex] as Map? ?? {};
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              //icon
                              Image.asset(
                                subListObj["icon"],
                                width: screenSize.width * .36,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 15),

                              //name
                              MyFont(
                                text: subListObj["name"],
                                color: AppColors.white.withOpacity(0.7),
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            //price
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer(builder: (context, ref, child) {
                  var amountValue = ref.watch(amountValueProvider).toString();

                  amountValue =
                      amountValue.substring(0, amountValue.indexOf('.') + 3);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //decrement
                      ImageButton(
                        image: "assets/img/minus.png",
                        onPressed: () {
                          if (double.parse(amountValue) > 0) {
                            ref.read(amountValueProvider.notifier).state -= 0.1;
                          }
                        },
                      ),

                      //
                      Column(
                        children: [
                          MyFont(
                            text: "Monthly price",
                            color: AppColors.gray30,
                            size: 14,
                          ),
                          const SizedBox(height: 10),
                          //

                          MyFont(
                            text: "\$$amountValue",
                            size: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),

                      //increment
                      ImageButton(
                        image: "assets/img/plus.png",
                        onPressed: () {
                          ref.read(amountValueProvider.notifier).state += 0.1;
                        },
                      ),
                    ],
                  );
                })),

            //divider
            Container(
              height: 1,
              width: 130,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              color: AppColors.gray70,
            ),

            //add to this platform (button)
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyRoundedButton(
                btnName: "Add to the platform",
                btnColor: AppColors.secondary,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
