// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_learning_app/screens/welcome_pages/onboarding_screen.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1200,
      splash: AppFunc.myText(
          text: "Learning App",
          size: 44,
          weight: FontWeight.bold,
          font: AppFonts.primaryFont),
      nextScreen: OnboardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
