// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/providers/booking_provider.dart';
import 'package:e_learning_app/screens/main_pages/main_page.dart';
import 'package:e_learning_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BookingProvider())
        ],
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Learning App',
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: SplashScreen(),
          home: MainPage(),
          // home: Practice(),
        ),
      ),
    );
  }
}

//Put const in necessary places
//Login Page
//Register Page
//Select Course Screen
