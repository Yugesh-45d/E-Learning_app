// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppFunc.myPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppFunc.myText(
            text: "HOME",
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
            size: 20,
          ),
          AppFunc.mySizedbox(height: 8),
          AppFunc.myText(
            text: "Welcome Back Rameshwor Yadav",
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
            font: AppFonts.primaryFont,
            size: 40,
          ),
          AppFunc.mySizedbox(height: 32),
          Row(
            children: [
              AppFunc.myButton(
                text: "Book Class",
                textSize: 16,
                func: () {},
                //TODO add functionality here
                width: 120,
                height: 40,
                borderRadius: 8,
              ),
              AppFunc.mySizedbox(width: 16),
              AppFunc.myButton(
                text: "My Courses",
                textSize: 16,
                func: () {},
                //TODO Add functionality here
                width: 120,
                height: 40,
                borderRadius: 8,
              ),
            ],
          ),
          AppFunc.mySizedbox(height: 32),
          SizedBox(
            width: double.maxFinite,
            child: AppFunc.myText(
              alignment: TextAlign.left,
              text: "Last Classes",
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
              size: 28,
            ),
          ),
          AppFunc.mySizedbox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AppFunc.myCard(
                  image: "4.png",
                  faculty: "ART & HUMANITIES",
                  subject: "Draw and paint Arts",
                  hours: 2,
                ),
                AppFunc.mySizedbox(width: 4),
                AppFunc.myCard(
                  image: "2.png",
                  faculty: "COMPUTER SCIENCE",
                  subject: "Programming with Js",
                  hours: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
