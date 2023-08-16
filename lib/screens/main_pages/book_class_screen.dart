// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/models/class_model.dart';
import 'package:e_learning_app/providers/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BookClassScreen extends StatefulWidget {
  const BookClassScreen({super.key});

  @override
  State<BookClassScreen> createState() => _BookClassScreenState();
}

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

class _BookClassScreenState extends State<BookClassScreen> {
  String facultyIndex = faculty[0];
  String classTypeIndex = classType[0];
  bool checkboxValue = false;
  int num = 1;
  String myImage = '';
  String mySubject = '';
  int selectedNum = 0;

  int checkClass() {
    switch (facultyIndex) {
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
            text: facultyIndex,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNum = 1;
                    myImage = image1;
                    mySubject = subject1;
                  });
                },
                child: AppFunc.myCard(
                  showHours: false,
                  showFaculty: false,
                  cardWidth: 120,
                  imageHeight: 72,
                  subjecttextSize: 20,
                  image: image1,
                  faculty: "",
                  subject: subject1,
                  hours: 4,
                  showBorder: selectedNum == 1 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNum = 2;
                    myImage = image2;
                    mySubject = subject2;
                  });
                },
                child: AppFunc.myCard(
                  showHours: false,
                  showFaculty: false,
                  cardWidth: 120,
                  imageHeight: 72,
                  subjecttextSize: 20,
                  image: image2,
                  faculty: "",
                  subject: subject2,
                  hours: 4,
                  showBorder: selectedNum == 2 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNum = 3;
                    myImage = image3;
                    mySubject = subject3;
                  });
                },
                child: AppFunc.myCard(
                  showHours: false,
                  showFaculty: false,
                  cardWidth: 120,
                  imageHeight: 72,
                  subjecttextSize: 20,
                  image: image3,
                  faculty: "",
                  subject: subject3,
                  hours: 4,
                  showBorder: selectedNum == 3 ? true : false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ClassesModel getBookings() {
    return ClassesModel(
        image: myImage, faculty: facultyIndex, subject: mySubject, progress: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: AppFunc.myText(
          text: "BOOK YOUR CLASS",
          color: AppColors.primaryColor,
          weight: FontWeight.bold,
          size: 20,
        ),
        elevation: 0,
      ),
      body: Consumer<BookingProvider>(
        builder: (context, value, child) => Padding(
          padding: AppFunc.myPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: "Select Faculty",
                      size: 24,
                      color: AppColors.primaryColor,
                      weight: FontWeight.bold,
                      font: AppFonts.thirdFont,
                    ),
                  ),
                  RadioListTile(
                    title: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: faculty[0],
                      color: AppColors.primaryColor,
                    ),
                    value: faculty[0],
                    groupValue: facultyIndex,
                    onChanged: (value) {
                      setState(
                        () {
                          facultyIndex = value.toString();
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    title: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: faculty[1],
                      color: AppColors.primaryColor,
                    ),
                    value: faculty[1],
                    groupValue: facultyIndex,
                    onChanged: (value) {
                      setState(
                        () {
                          facultyIndex = value.toString();
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    title: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: faculty[2],
                      color: AppColors.primaryColor,
                    ),
                    value: faculty[2],
                    groupValue: facultyIndex,
                    onChanged: (value) {
                      setState(
                        () {
                          facultyIndex = value.toString();
                        },
                      );
                    },
                  ),
                ],
              ),
              AppFunc.mySizedbox(width: 8),
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
                    subject1: 'Cloud Firebase',
                    image2: '7.png',
                    subject2: 'Programming with Js',
                    image3: '5.png',
                    subject3: 'Working with APIs')
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
                  Wrap(
                    children: [
                      AppFunc.myText(
                        text: "Are you sure with selected Class?",
                        font: AppFonts.thirdFont,
                        size: 16,
                        color: AppColors.primaryColor,
                      ),
                      AppFunc.myText(
                        text: "*",
                        font: AppFonts.thirdFont,
                        size: 16,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
              AppFunc.myButton(
                width: 280,
                borderRadius: 32,
                text: "Book Class Now",
                func: () async{
                  if (checkboxValue) {
                    if (value.myClasses.any((myClass) =>
                        myClass.subject == getBookings().subject)) {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: "This class is already selected!");
                    } else {
                      value.addToList(getBookings());
                      Fluttertoast.showToast(
                          backgroundColor: Colors.green,
                          msg: "Booked sucessfully");
                      Navigator.pop(context);
                    }
                  } else {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: "Please select the class first");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
