// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppFunc.myPadding(),
      child: Column(
        children: [
          AppFunc.mySizedbox(height: 56),
          AppFunc.myText(
            text: "MY CLASSES",
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
            size: 20,
          ),
          AppFunc.mySizedbox(height: 24),
          AppFunc.myClassesCard(
            image: "4.png",
            subject: "Programming with Js",
            topic: "Arrays",
            progress: 45,
          ),
          AppFunc.mySizedbox(height: 8),
          AppFunc.myClassesCard(
            image: "2.png",
            subject: "Firebase",
            topic: "Cloud Firebase",
            progress: 23,
          ),
        ],
      ),
    );
  }
}
