import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';
import '../common_widget/my_textfield.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray80,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            //logo
            Center(
              child: Image.asset(
                "assets/img/app_logo.png",
                width: 180,
              ),
            ),
            const Spacer(),
            const Spacer(),

            //siginup with
            MyRoundedButton(
              btnName: "Sign up with Apple",
              btnColor: AppColors.gray,
              icon: Icons.apple,
              onPressed: () {},
            ),
            const SizedBox(height: 30),

            MyRoundedButton(
              btnName: "Sign up with Google",
              btnColor: AppColors.white,
              fontColor: AppColors.gray,
              iconColor: Colors.green,
              icon: Icons.g_mobiledata_outlined,
              onPressed: () {},
            ),
            const SizedBox(height: 30),

            MyRoundedButton(
              btnName: "Sign up with Facebook",
              btnColor: AppColors.primary,
              icon: Icons.facebook,
              onPressed: () {},
            ),

            const Spacer(),

            const MyFont(text: "or", fontWeight: FontWeight.bold),
            const Spacer(),

            MyRoundedButton(
              btnName: "Sign up with E-mail",
              btnColor: AppColors.gray70,
              fontColor: AppColors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupWithEmail();
                }));
              },
            ),
            const Spacer(),

            //rules and regulations
            const MyFont(
              text:
                  "By registering it, you agree to our terms of use. Learn  \n            how we collect, use and share your data.",
              size: 14,
              fontWeight: FontWeight.w300,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SignupWithEmail extends StatelessWidget {
  const SignupWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.gray80,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            //logo
            Center(
              child: Image.asset(
                "assets/img/app_logo.png",
                width: 180,
              ),
            ),
            const SizedBox(height: 45),

            const MyFont(text: "Join us now!"),
            const Spacer(flex: 2),

            //form
            MyTextField(
              hintText: "Email",
              fillColor: AppColors.gray60,
              prefixIcon: Icons.email,
              prefixIconColor: AppColors.gray,
            ),
            const SizedBox(height: 20),

            MyTextField(
              hintText: "Password",
              fillColor: AppColors.gray60, 
              prefixIcon: Icons.password,
              prefixIconColor: AppColors.gray,
              suffixIcon: Icons.visibility_off,
            ),
            const SizedBox(height: 20),

            MyTextField(
              hintText: "Confirm your password",
              fillColor: AppColors.gray60, 
              prefixIcon: Icons.lock,
              prefixIconColor: AppColors.gray,
              suffixIcon: Icons.visibility_off,
            ),
            const SizedBox(height: 45),

            //password strength
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 5,
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.gray70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 15),

            MyFont(
              text:
                  "Password characters must be 8 chars or more \n    with a mix of letters, numbers & symbols.",
              color: AppColors.gray50,
              size: 16,
            ),
            const SizedBox(height: 45),

            //get started button
            MyRoundedButton(
              btnName: "Get started, it's free!",
              btnColor: AppColors.primary500,
              onPressed: () {},
            ),
            const Spacer(),

            //Already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFont(
                  text: "Already have an account? ",
                  color: AppColors.gray60,
                  fontWeight: FontWeight.w300,
                ),

                //signup
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    child: const MyFont(
                      text: "Sign in",
                      color: Colors.orange,
                    ))
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
