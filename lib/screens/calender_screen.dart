import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/subscription_cell.dart';
import 'settings_screen.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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

  //calendar
  final CalendarAgendaController _calendarAgendaController =
      CalendarAgendaController();

  late DateTime _selectedDate;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.gray,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
                  //calendar
                  Container(
                height: screenSize.height * 0.5,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: AppColors.gray70.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Stack(
                  children: [
                    //custom app bar
                    Positioned(
                      top: 25,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          const Spacer(),
                          //title
                          MyFont(text: "Calendar", color: AppColors.gray30),
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
                    ),

                    //
                    const Positioned(
                      top: 100,
                      left: 20,
                      child: MyFont(
                        text: "Subs \nSchedule",
                        size: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //
                    Positioned(
                      top: 180,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyFont(
                            text: "3 subscriptions for today",
                            color: AppColors.gray30,
                          ),

                          //month
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.gray60.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                //month
                                const MyFont(
                                  text: "January",
                                  fontWeight: FontWeight.w500,
                                ),

                                //
                                InkWell(
                                  onTap: () {
                                    _calendarAgendaController.openCalendar();
                                  },
                                  child: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //calendar
                    Positioned(
                      top: 230,
                      child: CalendarAgenda(
                        controller: _calendarAgendaController,
                        backgroundColor: Colors.transparent,
                        fullCalendarBackgroundColor: AppColors.gray80,
                        selectedEventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        eventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        weekDay: WeekDay.short,
                        fullCalendarScroll: FullCalendarScroll.horizontal,
                        selectedDateColor: Colors.blue.shade900,
                        dateColor: Colors.white,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 140)),
                        lastDate: DateTime.now().add(const Duration(days: 60)),
                        events: List.generate(
                            100,
                            (index) => DateTime.now().subtract(
                                Duration(days: index * _random.nextInt(5)))),
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFont(
                      text: "January",
                      size: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    MyFont(
                      text: "\$24.99",
                      size: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),

            //
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFont(
                      text: "01.08.2023",
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray30,
                    ),
                    MyFont(
                      text: "   in upcoming bills",
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray30,
                    ),
                  ],
                ),
              ),
            ),

            //
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: subsList.length,
                itemBuilder: (context, index) {
                  var obj = subsList[index] as Map? ?? {};

                  return SubscriptionCell(obj: obj);
                },
              ),
            ),
          ],
        ));
  }
}
