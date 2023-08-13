// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BookClassScreen extends StatefulWidget {
  const BookClassScreen({super.key});

  @override
  State<BookClassScreen> createState() => _BookClassScreenState();
}

class _BookClassScreenState extends State<BookClassScreen> {
  String dropDownValue1 = 'Art & Humanities';
  String dropDownValue2 = 'Group Study';
  bool checkboxValue = false;
  int num = 1;
  List<String> faculty = [
    'Art & Humanities',
    'Computer Science',
    'Physics',
  ];

  List<String> classType = [
    'Group Study',
    'Self Study',
    'Revision',
  ];
  void updateFaculty(String? newValue) {
    setState(() {
      dropDownValue1 = newValue!;
    });
  }

  void updateClassType(String? newValue) {
    setState(() {
      dropDownValue2 = newValue!;
    });
  }

  int checkClass() {
    switch (dropDownValue1) {
      case 'Art & Humanities':
        return 1;
      case 'Computer Science':
        return 2;
      case 'Physics':
        return 3;
      default:
        return 1;
    }
  }

  Column showFaculty({
    required String image1,
    required String subject1,
    required String image2,
    required String subject2,
    required String image3,
    required String subject3,
  }) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: AppFunc.myText(
            alignment: TextAlign.left,
            text: dropDownValue1,
            color: AppColors.primaryColor,
            size: 18,
            weight: FontWeight.bold,
          ),
        ),
        AppFunc.mySizedbox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AppFunc.myCard(
                showHours: false,
                showFaculty: false,
                cardWidth: 120,
                imageHeight: 72,
                subjecttextSize: 20,
                image: image1,
                faculty: "",
                subject: subject1,
                hours: 4,
              ),
              AppFunc.myCard(
                showHours: false,
                showFaculty: false,
                cardWidth: 120,
                imageHeight: 72,
                subjecttextSize: 20,
                image: image2,
                faculty: "",
                subject: subject2,
                hours: 4,
              ),
              AppFunc.myCard(
                showHours: false,
                showFaculty: false,
                cardWidth: 120,
                imageHeight: 72,
                subjecttextSize: 20,
                image: image3,
                faculty: "",
                subject: subject3,
                hours: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

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
              text: "BOOK YOUR CLASS",
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
              size: 20,
            ),
            AppFunc.mySizedbox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppFunc.myCard(
                    showHours: false,
                    cardWidth: 120,
                    imageHeight: 72,
                    facultytextSize: 14,
                    subjecttextSize: 18,
                    image: "4.png",
                    faculty: "ART & HUMANITIES",
                    subject: "Draw and paint Arts",
                    hours: 2,
                  ),
                  AppFunc.myCard(
                    showHours: false,
                    cardWidth: 120,
                    imageHeight: 72,
                    facultytextSize: 14,
                    subjecttextSize: 18,
                    image: "2.png",
                    faculty: "COMPUTER SCIENCE",
                    subject: "Programming with Js",
                    hours: 2,
                  ),
                  AppFunc.myCard(
                    showHours: false,
                    cardWidth: 120,
                    imageHeight: 72,
                    facultytextSize: 14,
                    subjecttextSize: 18,
                    image: "6.png",
                    faculty: "PHYSICS",
                    subject: "Quantum Mechanics",
                    hours: 2,
                  ),
                ],
              ),
            ),
            AppFunc.mySizedbox(height: 24),
            Row(
              children: [
                Column(
                  children: [
                    AppFunc.myText(
                      text: "Select Class",
                      size: 18,
                      color: AppColors.primaryColor,
                      weight: FontWeight.bold,
                      font: AppFonts.thirdFont,
                    ),
                    AppFunc.mySizedbox(height: 4),
                    AppFunc.myDropDownMenu(
                      textList: faculty,
                      dropDownValue: dropDownValue1,
                      func: (value) => updateFaculty(value),
                    ),
                  ],
                ),
                AppFunc.mySizedbox(width: 8),
                Column(children: [
                  AppFunc.myText(
                    text: "Class Type",
                    size: 18,
                    color: AppColors.primaryColor,
                    weight: FontWeight.bold,
                    font: AppFonts.thirdFont,
                  ),
                  AppFunc.mySizedbox(height: 4),
                  AppFunc.myDropDownMenu(
                    textList: classType,
                    dropDownValue: dropDownValue2,
                    func: (value) => updateClassType(value),
                  ),
                ]),
              ],
            ),
            AppFunc.mySizedbox(height: 24),
            if (checkClass() == 1)
              showFaculty(
                  image1: '1.png',
                  subject1: 'History',
                  image2: '4.png',
                  subject2: "Literature",
                  image3: '6.png',
                  subject3: 'Philosophy')
            else if (checkClass() == 2)
              showFaculty(
                  image1: '2.png',
                  subject1: 'Computer Architecture',
                  image2: '7.png',
                  subject2: 'Programming with Js',
                  image3: '5.png',
                  subject3: 'Programming with Dart')
            else
              showFaculty(
                  image1: '3.png',
                  subject1: 'Classical Mechanics',
                  image2: '8.png',
                  subject2: 'Nuclear Physics',
                  image3: '1.png',
                  subject3: 'Quantum Mechanics'),
            AppFunc.mySizedbox(height: 8),
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
                  text: "Are you sure with selected Class?",
                  font: AppFonts.thirdFont,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            AppFunc.myButton(
              width: 280,
              borderRadius: 32,
              text: "Book Class Now",
              func: () {},
            ),
          ],
        ),
      ),
    );
  }
}
