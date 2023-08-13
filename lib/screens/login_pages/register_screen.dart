// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/screens/login_pages/login_screen.dart';
import 'package:e_learning_app/screens/main_pages/select_course_screen.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
//TODO ask name, address and profile picture here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: AppFunc.myPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppFunc.myText(
              text: "REGISTER",
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
              size: 24,
            ),
            AppFunc.mySizedbox(height: 8),
            AppFunc.myText(
              text: "Learning App",
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
              font: AppFonts.primaryFont,
              size: 40,
            ),
            AppFunc.mySizedbox(height: 40),
            AppFunc.myText(
              text: "Input Email and Password to Continue the Registration",
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
              size: 20,
            ),
            AppFunc.mySizedbox(height: 32),
            AppFunc.myTextfield(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hint: "Email",
            ),
            AppFunc.mySizedbox(height: 24),
            AppFunc.myTextfieldPassword(
              controller: _passwordController,
              func: showHidePassword,
              showPassword: showPassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  },
                ),
                AppFunc.myText(
                  //TODO add remember me functionality
                  text: "Remember me?",
                  font: AppFonts.thirdFont,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            AppFunc.mySizedbox(height: 24),
            AppFunc.myButton(
              text: "Register",
              func: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectCourseScreen()));
              },
              borderRadius: 32,
              width: 320,
            ),
            AppFunc.mySizedbox(height: 40),
            Wrap(
              children: [
                AppFunc.myText(
                  text: "Already have an account? ",
                  color: AppColors.primaryColor,
                  font: AppFonts.thirdFont,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => LoginScreen())));
                  },
                  child: AppFunc.myText(
                    text: "Login",
                    color: Colors.blue,
                    font: AppFonts.thirdFont,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//TODO ask name, address and profile picture here