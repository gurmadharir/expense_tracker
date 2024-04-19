import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/color_extension.dart';
import 'add_subscription.dart';
import 'budget_screen.dart';
import 'calender_screen.dart';
import 'cards_screen.dart';
import 'home_screen.dart';


//currentIndex provider
final currentIndexProvider = StateProvider<int>((ref) => 0);

class MainTabView extends ConsumerWidget {
  MainTabView({super.key});

  final PageStorageBucket _pageStorageBucket = PageStorageBucket();

  List screens = [
    HomeScreen(),
    BudgetScreen(),
    const CalendarScreen(),
    const CardsScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
        backgroundColor: AppColors.gray,
        body: Stack(
          children: [
            //Navigate to different screens using PagStorage
            PageStorage(
              bucket: _pageStorageBucket,
              child: screens[currentIndex],
            ),
            //bottom nav
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Stack(children: [
                  Image.asset(
                    "assets/img/bottom_bar_bg.png",
                    fit: BoxFit.cover,
                  ),

                  //home
                  Positioned(
                    left: 25,
                    top: 20,
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(currentIndexProvider.notifier)
                            .update((state) => 0);
                      },
                      child: Image.asset(
                        "assets/img/home.png",
                        width: 25,
                        color: currentIndex == 0 ? Colors.white : null,
                      ),
                    ),
                  ),

                  //budgets
                  Positioned(
                    left: 95,
                    top: 20,
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(currentIndexProvider.notifier)
                            .update((state) => 1);
                      },
                      child: Image.asset(
                        "assets/img/budgets.png",
                        width: 25,
                        color:
                            currentIndex == 1 ? Colors.white : AppColors.gray30,
                      ),
                    ),
                  ),

                  //calendar
                  Positioned(
                    right: 100,
                    top: 20,
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(currentIndexProvider.notifier)
                            .update((state) => 2);
                      },
                      child: Image.asset(
                        "assets/img/calendar.png",
                        width: 25,
                        color: currentIndex == 2 ? Colors.white : null,
                      ),
                    ),
                  ),

                  //cards
                  Positioned(
                    right: 20,
                    top: 20,
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(currentIndexProvider.notifier)
                            .update((state) => 3);
                      },
                      child: Image.asset(
                        "assets/img/creditcards.png",
                        width: 25,
                        color: currentIndex == 3 ? Colors.white : null,
                      ),
                    ),
                  ),
                ])),

            //add button
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return AddSubscriptionScreen();
                })),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage("assets/img/plus.png"),
                    ),
                  ),
                ),
              ),
            ),

            //
          ],
        ));
  }
}
