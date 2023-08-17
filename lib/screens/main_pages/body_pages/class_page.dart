// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/providers/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, value, child) => Padding(
        padding: AppFunc.myPadding(),
        child: value.myClasses.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.myClasses.length,
                      itemBuilder: (context, index) {
                        return AppFunc.myClassesCard(
                            image: value.myClasses[index].image,
                            faculty: value.myClasses[index].faculty,
                            subject: value.myClasses[index].subject,
                            progress: value.myClasses[index].progress);
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: AppFunc.myText(
                text: "You do not have any classes right now.",
                font: AppFonts.primaryFont,
                weight: FontWeight.bold,
                size: 32,
                color: AppColors.primaryColor,
              )),
      ),
    );
  }
}
