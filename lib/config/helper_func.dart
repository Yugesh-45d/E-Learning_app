// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFunc {
  //----------------------------For Normal Text---------------------------------------------
  static Text myText({
    required String text,
    Color color = Colors.white,
    double size = 16,
    FontWeight weight = FontWeight.normal,
    TextAlign alignment = TextAlign.center,
    String? font,
  }) {
    String fontFamily = font ?? AppFonts.secondaryFont;
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
        fontFamily: fontFamily,
      ),
    );
  }

//----------------------------For Asset Image---------------------------------------------
  static Image myLocalImage({required String image, double height = 40}) {
    return Image.asset(
      'assets/$image',
      height: height.h,
    );
  }

  //----------------------------For Padding---------------------------------------------
  static EdgeInsets myPadding(
      {double left = 16,
      double right = 16,
      double top = 16,
      double bottom = 16}) {
    return EdgeInsets.only(
        left: left.w, right: right.w, top: top.h, bottom: bottom.h);
  }

//----------------------------For Buttons---------------------------------------------
  static SizedBox myButton(
      {required String text,
      bool isFilled = true,
      Color color = AppColors.primaryColor,
      double borderRadius = 16,
      double width = double.maxFinite,
      double height = 52,
      double textSize = 18,
      required void Function() func}) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 8,
          backgroundColor: isFilled ? color : Colors.transparent,
          side: BorderSide(
              style: isFilled ? BorderStyle.none : BorderStyle.solid,
              color: isFilled ? Colors.white : AppColors.primaryColor,
              width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        onPressed: () {
          func();
        },
        child: AppFunc.myText(
          text: text,
          color: isFilled ? Colors.white : AppColors.primaryColor,
          weight: FontWeight.bold,
          size: textSize,
        ),
      ),
    );
  }

//----------------------------For Other TextFields---------------------------------------------
  static SizedBox myTextfield(
      {required TextEditingController controller,
      required TextInputType keyboardType,
      required String hint}) {
    return SizedBox(
      height: 56.h,
      width: double.maxFinite,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: "Enter your $hint",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }

//----------------------------For Password TextField---------------------------------------------
  static SizedBox myTextfieldPassword({
    required TextEditingController controller,
    required void Function() func,
    required bool showPassword,
  }) {
    return SizedBox(
      height: 56.h,
      width: double.maxFinite,
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        obscureText: !showPassword,
        decoration: InputDecoration(
          labelText: "Enter your Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              func();
            },
            icon: showPassword
                ? Icon(
                    Icons.visibility,
                  )
                : Icon(
                    Icons.visibility_off,
                  ),
          ),
        ),
      ),
    );
  }

  static SizedBox mySizedbox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height.h,
      width: width.w,
    );
  }
}
