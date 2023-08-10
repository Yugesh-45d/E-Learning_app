// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/func.dart';
import 'package:flutter/material.dart';

class SelectCourseScreen extends StatefulWidget {
  const SelectCourseScreen({super.key});

  @override
  State<SelectCourseScreen> createState() => _SelectCourseScreenState();
}

class _SelectCourseScreenState extends State<SelectCourseScreen> {
  bool isSelected = false;
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
                text: "Learning App",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
                size: 40,
              ),
              myLocalImage(image: "7.png", height: 320),
              SizedBox(
                width: double.maxFinite,
                child: myText(
                  alignment: TextAlign.left,
                  text: "Select your course level",
                  color: AppColors.primaryColor,
                  weight: FontWeight.bold,
                  size: 24,
                ),
              ),
              Row(
                children: [
                  ChoiceChip(
                    // avatar: myLocalImage(image: "4.png"),
                    label: myText(
                      text: "Begineer",
                      color: AppColors.primaryColor,
                      font: AppFonts.thirdFont,
                    ),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                  ),
                  ChoiceChip(
                    // avatar: myLocalImage(image: "1.png"),
                    label: myText(
                      text: "Intermediate",
                      color: AppColors.primaryColor,
                      font: AppFonts.thirdFont,
                    ),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                  ),
                  ChoiceChip(
                    // avatar: myLocalImage(image: "2.png"),
                    label: myText(
                      text: "Expert",
                      color: AppColors.primaryColor,
                      font: AppFonts.thirdFont,
                    ),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
