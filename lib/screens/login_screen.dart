import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/color_extension.dart';
import '../common_widget/my_font.dart';
import '../common_widget/my_rounded_btn.dart';
import '../common_widget/my_textfield.dart';
import 'main_tab_view.dart';
import 'signup_page.dart';

StateProvider isCheckedProvider = StateProvider<bool>((ref) => false);
StateProvider isObstureTextProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.gray80,
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo
              Center(
                child: Image.asset(
                  "assets/img/app_logo.png",
                  width: 180,
                ),
              ),
              const SizedBox(height: 150),

              //quick text
              const Center(child: MyFont(text: "Welcome back!", size: 24)),
              const SizedBox(height: 30),

              //Login form
              MyTextField(
                hintText: "Email",
                fillColor: AppColors.gray60,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 20),

              Consumer(
                builder: (context, ref, child) {
                  var isObstureText = ref.watch(isObstureTextProvider);

                  return MyTextField(
                    hintText: "Password",
                    isObstureText: isObstureText,
                    fillColor: AppColors.gray60,
                    prefixIcon: Icons.password_rounded,
                    suffixIconClicked: () {
                      ref.read(isObstureTextProvider.notifier).state =
                          !isObstureText;
                    },
                    suffixIcon: isObstureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                  );
                },
              ),

              const SizedBox(height: 45),

              //Remember me / forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember me
                  Row(
                    children: [
                      Consumer(builder: (context, ref, child) {
                        //my provider
                        var isChecked = ref.watch(isCheckedProvider);

                        return GestureDetector(
                          onTap: () {
                            ref.read(isCheckedProvider.notifier).state =
                                !isChecked;
                          },
                          child: !isChecked
                              ? Icon(
                                  Icons.check_box_outline_blank_rounded,
                                  color: AppColors.gray30,
                                )
                              : const Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.blue,
                                ),
                        );
                      }),
                      const SizedBox(width: 15),

                      //
                      MyFont(
                        text: "Remember me ",
                        size: 14,
                        color: AppColors.gray40,
                      ),
                    ],
                  ),

                  //forgot password
                  MyFont(
                    text: "Forgot password?",
                    color: AppColors.gray30,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              //sigin button
              MyRoundedButton(
                btnName: "Sign in",
                btnColor: AppColors.secondary,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainTabView();
                  }));
                },
              ),
              const SizedBox(height: 45),

              //don't have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFont(
                    text: "Don't have an account yet? ",
                    color: AppColors.gray60,
                    fontWeight: FontWeight.w300,
                  ),

                  //signup
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignupScreen();
                        }));
                      },
                      child: const MyFont(
                        text: "Sign up",
                        color: Colors.orange,
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
