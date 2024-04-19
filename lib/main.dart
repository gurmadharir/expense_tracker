import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/color_extension.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.gray80,
          primary: AppColors.primary,
          primaryContainer: AppColors.gray60,
          secondary: AppColors.secondary,
        ),
        useMaterial3: false,
      ),
      home: const WelcomeScreen(),
    );
  }
}
