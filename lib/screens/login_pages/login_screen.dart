// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/screens/login_pages/register_screen.dart';
import 'package:e_learning_app/screens/main_pages/select_course_screen.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/func.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  bool checkboxValue = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showHidePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

//TODO add user authentication here with Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myText(
                text: "LOG IN",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                size: 24,
              ),
              SizedBox(height: 8),
              myText(
                text: "Learning App",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
                size: 40,
              ),
              SizedBox(height: 40),
              myText(
                text: "Enter your log in details to access your account",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                size: 20,
              ),
              SizedBox(height: 32),
              myTextfield(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hint: "Email",
              ),
              SizedBox(height: 24),
              myTextfieldPassword(
                controller: _passwordController,
                func: showHidePassword,
                showPassword: showPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkboxValue,
                        onChanged: (value) {
                          setState(() {
                            checkboxValue = value!;
                          });
                        },
                      ),
                      myText(
                        text: "Remember me?",
                        font: AppFonts.thirdFont,
                        size: 16,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  myText(
                    text: "Forget Password?",
                    color: Colors.red,
                    size: 16,
                    font: AppFonts.thirdFont,
                  ),
                ],
              ),
              SizedBox(height: 24),
              myButton(
                text: "Login",
                func: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectCourseScreen()));
                },
                borderRadius: 32,
                width: 320,
              ),
              SizedBox(height: 40),
              Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: AppFonts.thirdFont,
                  ),
                  children: [
                    WidgetSpan(
                        child: GestureDetector(
                      onTap: () {
                         Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => RegisterScreen())));
                      },
                      child: myText(
                        text: "Create account",
                        color: Colors.blue,
                        font: AppFonts.thirdFont,
                        size: 14,
                      ),
                    ))
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
