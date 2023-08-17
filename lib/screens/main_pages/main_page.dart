// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:e_learning_app/screens/main_pages/body_pages/class_page.dart';
import 'package:e_learning_app/screens/main_pages/body_pages/home_page.dart';
import 'package:e_learning_app/screens/main_pages/body_pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    ClassPage(),
    ProfilePage(),
  ];

  getbody() {
    return pages[selectedIndex];
  }

// List<AppBar> appbars = [];

  // getAppbar() {
  //   return appbars[selectedIndex];
  // }
  List<String> getTitle = [
    'HOME',
    'MY CLASSES',
    'MY ACCOUNT',
  ];

  getAppbar(){
    return getTitle[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: AppFunc.myText(
          text: getAppbar(),
          size: 24,
          color: AppColors.primaryColor,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: getbody(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book_circle),
              label: "My Classes",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
            ),
          ]),
    );
  }
}
