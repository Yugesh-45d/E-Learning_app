// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/utils/colors.dart';
import 'package:e_learning_app/utils/fonts.dart';
import 'package:e_learning_app/utils/func.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myLocalImage(image: "3.png", height: 320),
              SizedBox(height: 32),
              myText(
                text: "Online Learning Platform",
                size: 28,
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
              ),
              SizedBox(height: 24),
              myText(
                text:
                    "Embark on a journey of knowledge and growth with our interactive online courses. Learning starts here!",
                color: Colors.black,
              ),
              SizedBox(height: 32),
              myButton(
                  text: "Start Learning",
                  func: () {},
                  borderRadius: 32,
                  width: 320),
            ],
          ),
        ),
      ),
    );
  }
}
