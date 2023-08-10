// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:e_learning_app/screens/welcome_pages/onboarding_screen.dart';
import 'package:e_learning_app/utils/colors.dart';
import 'package:e_learning_app/utils/fonts.dart';
import 'package:e_learning_app/utils/func.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => OnboardingScreen())));
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: myText(text: "Learning App", size: 40, weight: FontWeight.bold, font: AppFonts.primaryFont),
      ),
    );
  }
}
