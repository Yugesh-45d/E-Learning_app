// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/screens/login_pages/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppFunc.myPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppFunc.mySizedbox(height: 40),
          AppFunc.myText(
            text: "MY ACCOUNT",
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
            size: 20,
          ),
          AppFunc.mySizedbox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.primaryColor,
            ),
            width: double.maxFinite.w,
            height: 120.h,
            child: Padding(
              padding: AppFunc.myPadding(),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 32.r,
                    child: AppFunc.myLocalImage(image: "1.png"),
                  ),
                  title: AppFunc.myText(
                    text: "Rameshwor Yadav",
                    size: 24,
                    font: AppFonts.thirdFont,
                  ),
                  subtitle: AppFunc.myText(
                    text: "Kathmandu, Nepal",
                    font: AppFonts.thirdFont,
                  ),
                ),
              ),
            ),
          ),
          AppFunc.mySizedbox(height: 16),
          AppFunc.myListCupertinoListTile(text: "Account Setting"),
          AppFunc.myListCupertinoListTile(text: "Download Options"),
          AppFunc.myListCupertinoListTile(text: "Notifications Setting"),
          AppFunc.mySizedbox(height: 16),
          AppFunc.myListCupertinoListTile(text: "Privacy Policy"),
          AppFunc.myListCupertinoListTile(text: "Help Center"),
          AppFunc.myListCupertinoListTile(text: "About Us"),
          CupertinoListTile(
            title: AppFunc.myText(
              text: "Delete Account",
              font: AppFonts.thirdFont,
              size: 20,
              color: Colors.red,
            ),
          ),
          AppFunc.mySizedbox(height: 24),
          AppFunc.myButton(
            width: 280,
            borderRadius: 32,
            text: "Log Out",
            func: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            },
            //TODO Add Functionality Here
          ),
        ],
      ),
    );
  }
}
