// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/screens/main_pages/book_class_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  @override
  void initState() {
    getUserName();
    super.initState();
  }

  getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppFunc.myPadding(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppFunc.myText(
              text: "Welcome Back $name",
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
                  func: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => BookClassScreen())));
                  },
                  width: 120,
                  height: 40,
                  borderRadius: 8,
                ),
                AppFunc.mySizedbox(width: 16),
                AppFunc.myButton(
                  text: "My Courses",
                  textSize: 16,
                  func: () async {},
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
                    image: "2.png",
                    faculty: "COMPUTER SCIENCE",
                    subject: "Programming with Js",
                    hours: 3,
                  ),
                  AppFunc.mySizedbox(width: 4),
                  AppFunc.myCard(
                    image: "7.png",
                    faculty: "ART & HUMANITIES",
                    subject: "Draw and paint Arts",
                    hours: 2,
                  ),
                  AppFunc.mySizedbox(width: 4),
                  AppFunc.myCard(
                    image: "8.png",
                    faculty: "PHYSICS",
                    subject: "Quantum Mechanics",
                    hours: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
