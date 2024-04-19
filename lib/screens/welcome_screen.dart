import 'package:flutter/material.dart';


import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';
import 'login_screen.dart';
import 'signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Bg Image
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/img/welcome_screen.png",
              fit: BoxFit.cover,
            ),
          ),

          //App logo
          Positioned(
            top: 60,
            right: 100,
            left: 100,
            child: Image.asset(
              "assets/img/app_logo.png",
            ),
          ),

          //Welcome title
          const Positioned(
            top: 600,
            left: 30,
            right: 30,
            child: MyFont(
              text: "Hi there!, let's see what this app does for you.",
              size: 16,
            ),
          ),

          const Positioned(
            top: 625,
            left: 50,
            right: 50,
            child: MyFont(
                text: "What're you waiting for ? Check this out!", size: 14),
          ),

          //Buttons
          Positioned(
            top: 700,
            left: 20,
            right: 20,
            child: MyRoundedButton(
              btnName: "Get started",
              btnColor: AppColors.secondary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupScreen();
                }));
              },
            ),
          ),

          Positioned(
            top: 765,
            left: 20,
            right: 20,
            child: MyRoundedButton(
              btnName: "I have an account",
              btnColor: AppColors.gray70,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
