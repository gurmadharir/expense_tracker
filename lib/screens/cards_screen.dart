import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';
import 'settings_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  //SwiperControllers
  final SwiperController _swiperController = SwiperController();

  List cardInfo = [
    {
      "name": "Gurmad Harir",
      "cardNo": "**** **** **** 9099",
      "dob": "05/25",
    },
    {
      "name": "Kaah Harir",
      "cardNo": "**** **** **** 5490",
      "dob": "08/26",
    },
    {
      "name": "Kaal Harir",
      "cardNo": "**** **** **** 8909",
      "dob": "05/24",
    },
  ];

  Widget buildSwiper() {
    return Swiper(
      itemCount: 3,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45 / 100, 0, 45 / 100])
        ..addTranslate([
          const Offset(-370, -40),
          Offset.zero,
          const Offset(370, 40),
        ]),
      fade: 1.0,
      onIndexChanged: (index) => print(index),
      scale: 0.8,
      itemHeight: 350,
      itemWidth: 250,
      controller: _swiperController,
      layout: SwiperLayout.STACK,
      viewportFraction: 0.8,
      axisDirection: AxisDirection.right,
      autoplayDisableOnInteraction: false,
      itemBuilder: ((context, index) {
        var cardObj = cardInfo[index] as Map? ?? {};

        return Container(
          decoration: BoxDecoration(
            color: AppColors.gray70,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 4),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/img/card_blank.png",
                width: 250,
              ),

              //
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    //type
                    Image.asset("assets/img/mastercard_logo.png", width: 60),
                    const SizedBox(height: 10),

                    //type
                    const MyFont(
                      text: "Master card",
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    const SizedBox(height: 60),

                    //name
                    MyFont(text: cardObj["name"], size: 16),
                    const SizedBox(height: 5),

                    //random card no
                    MyFont(
                      text: cardObj["cardNo"],
                      fontWeight: FontWeight.bold,
                    ),

                    //date of expire (random)
                    MyFont(text: cardObj["dob"], fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 10),
        child: Column(
          children: [
            //custom appBar
            Row(
              children: [
                const Spacer(),
                //title
                MyFont(text: "Cards", color: AppColors.gray30),
                const Spacer(),

                //settings
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SettingsScreen();
                    }));
                  },
                  icon: Image.asset(
                    "assets/img/settings.png",
                    width: 25,
                    color: AppColors.gray30,
                  ),
                )
              ],
            ),

            SizedBox(
              width: double.infinity,
              height: 450,
              child: buildSwiper(),
            ),

            //its subscriptions
            const MyFont(
              text: "Subscriptions",
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/youtube_logo.png", width: 45),
                const SizedBox(width: 15),
                Image.asset("assets/img/spotify_logo.png", width: 45),
                const SizedBox(width: 15),
                Image.asset("assets/img/icloud.png", width: 45),
                const SizedBox(width: 15),
                Image.asset("assets/img/netflix_logo.png", width: 45),
              ],
            ),
            const SizedBox(height: 30),

            //add new cards
            MyRoundedButton(
              btnName: "Add new card",
              btnColor: AppColors.primary,
              onPressed: () {},
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
