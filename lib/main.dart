// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/providers/booking_provider.dart';
import 'package:e_learning_app/screens/login_pages/register_screen.dart';
import 'package:e_learning_app/screens/main_pages/main_page.dart';
import 'package:e_learning_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}

//----------------THINGS TO DO IN THE APP----------------
/*
1. Forget Password wala page banaune
2. MainPage ma MyCourses wala page banaune ra tesma additional functionalities haru add grne
2. Provider bata Firebase ko data call garne ani matra tyo data use grne sab screens ma
3. Profile Page ma vaeko photo change grnu paro, Firebase Storage ko help le / AuthMethods ma vaeko photoUrl le
4. User vanne banayo AuthMethods ma (Instagram tutorial YT ko reference liyera)
5. AuthStateChanges/ Shared Preferences ko help le Login/Register Page ma remember me functionality add grne
6. My classes ma add vaeko class haru Firebase ma store grne so that feri login grda tyo classes ti rahi rakhos so

*/


