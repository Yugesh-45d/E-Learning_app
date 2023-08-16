// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/screens/main_pages/main_page.dart';
import 'package:flutter/material.dart';

class SelectCourseScreen extends StatefulWidget {
  const SelectCourseScreen({super.key});

  @override
  State<SelectCourseScreen> createState() => _SelectCourseScreenState();
}

class _SelectCourseScreenState extends State<SelectCourseScreen> {
  int _selectedOption = 1;
  bool checkboxValue = false;

  void _selectOption(int value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: AppFunc.myPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFunc.myText(
                text: "Learning App",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
                size: 40,
              ),
              AppFunc.myLocalImage(image: "7.png", height: 320),
              SizedBox(
                width: double.maxFinite,
                child: AppFunc.myText(
                  alignment: TextAlign.left,
                  text: "Select your course level",
                  color: AppColors.primaryColor,
                  weight: FontWeight.bold,
                  size: 24,
                ),
              ),
              AppFunc.mySizedbox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppFunc.myButton(
                    borderRadius: 32,
                    text: "Beginner",
                    height: 36,
                    width: 104,
                    func: () async{
                      _selectOption(1);
                    },
                    textSize: 12,
                    isFilled: _selectedOption == 1 ? true : false,
                  ),
                  AppFunc.myButton(
                    borderRadius: 32,
                    text: "Intermediate",
                    height: 36,
                    width: 104,
                    func: () async{
                      _selectOption(2);
                    },
                    textSize: 12,
                    isFilled: _selectedOption == 2 ? true : false,
                  ),
                  AppFunc.myButton(
                    borderRadius: 32,
                    text: "Expert",
                    height: 36,
                    width: 104,
                    func: () async{
                      _selectOption(3);
                    },
                    textSize: 12,
                    isFilled: _selectedOption == 3 ? true : false,
                  ),
                ],
              ),
              AppFunc.mySizedbox(height: 40),
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
                    //TODO add are you sure functionality
                    text: "Are you sure?",
                    font: AppFonts.thirdFont,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              AppFunc.mySizedbox(height: 8),
              AppFunc.myButton(
                text: "Continue",
                func: () async{
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                borderRadius: 32,
                width: 320,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
