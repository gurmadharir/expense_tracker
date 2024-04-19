import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/color_extension.dart';
import '../common_widget/custom_arc_painter.dart';
import '../common_widget/my_font.dart';
import '../common_widget/segment_button.dart';
import '../common_widget/status_indicator.dart';
import '../common_widget/subscription_tab.dart';
import '../common_widget/upcoming_bills_tab.dart';
import 'subscription_info.dart';

//segment tab providers
final isSubscriptionTabProvider = StateProvider<bool>((ref) => true);
final isUpcomingBillsTabProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //lists
  List subsList = [
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "16.99"
    },
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
      "price": "12.99"
    },
    {
      "name": "Icloud",
      "icon": "assets/img/icloud.png",
      "price": "19.99",
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
      "price": "15.99",
    },
  ];

  List billList = [
    {
      "name": "Spotify",
      "date": DateTime(2024, 03, 12),
      "price": "12.99",
    },
    {
      "name": "Youtube Premium",
      "date": DateTime(2024, 03, 10),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2024, 03, 9),
      "price": "16.99"
    },
    {
      "name": "Icloud",
      "date": DateTime(2024, 03, 08),
      "price": "19.99",
    },
    {
      "name": "Netflix",
      "date": DateTime(2024, 03, 05),
      "price": "15.99",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //status
            Container(
              height: screenSize.height * 0.45,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.gray70.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  //bg image
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Image.asset(
                        "assets/img/home_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //MyCustomArcChart
                  Positioned(
                    top: 75,
                    left: 90,
                    right: 90,
                    child: SizedBox(
                      height: screenSize.width * 0.5,
                      width: screenSize.width * 0.5,
                      child: CustomPaint(painter: CustomArcPainter()),
                    ),
                  ),

                  //
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        //logo
                        Image.asset(
                          "assets/img/app_logo.png",
                          width: screenSize.width * 0.25,
                        ),
                        const SizedBox(height: 10),

                        //monthly bill
                        const MyFont(
                          text: "\$1,235",
                          size: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),

                        MyFont(
                          text: "This month bills",
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray30,
                          size: 12,
                        ),
                        const SizedBox(height: 10),

                        //see your budget button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              backgroundColor: AppColors.gray70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: const MyFont(
                            text: "See your budget",
                            fontWeight: FontWeight.bold,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ),

                  //status
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          Expanded(
                            child: StatusIndicator(
                              title: "Active subs",
                              activeSubs: 12,
                              statusColor: AppColors.secondary,
                            ),
                          ),
                          Expanded(
                            child: StatusIndicator(
                              title: "Highest subs",
                              budget: 19.99,
                              statusColor: AppColors.primary20,
                            ),
                          ),
                          Expanded(
                            child: StatusIndicator(
                              title: "Lowest subs",
                              budget: 12.99,
                              statusColor: AppColors.secondaryG,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            //segment buttons
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Consumer(builder: (context, ref, child) {
                  //providers
                  final isSubscriptionTab =
                      ref.watch(isSubscriptionTabProvider);

                  final isUpcomingBillsTab =
                      ref.watch(isUpcomingBillsTabProvider);

                  return Row(
                    children: [
                      MySegmentButton(
                        btnName: "Your subscriptions",
                        isActive: isSubscriptionTab,
                        onTap: () {
                          //update the states
                          ref
                              .read(isSubscriptionTabProvider.notifier)
                              .update((state) => true);

                          ref
                              .read(isUpcomingBillsTabProvider.notifier)
                              .update((state) => false);
                        },
                      ),
                      MySegmentButton(
                        btnName: "Upcoming bills",
                        isActive: isUpcomingBillsTab,
                        onTap: () {
                          //update the states
                          ref
                              .read(isUpcomingBillsTabProvider.notifier)
                              .update((state) => true);

                          ref
                              .read(isSubscriptionTabProvider.notifier)
                              .update((state) => false);
                        },
                      ),
                    ],
                  );
                })),

            //tab info
            Consumer(builder: (context, ref, child) {
              final isSubscriptionTab = ref.watch(isSubscriptionTabProvider);

              return ListView.builder(
                itemCount: subsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var subArrayObj = subsList[index] as Map? ?? {};
                  var billsArrayObj = billList[index] as Map? ?? {};
                  return isSubscriptionTab
                      ? SubscriptionTap(
                          subsObj: subArrayObj,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SubscriptionInfo(obj: subArrayObj);
                            }));
                          })
                      : UpcomingBillsTab(billsObj: billsArrayObj);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
