// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/utils/colors.dart';
import 'package:e_learning_app/utils/fonts.dart';
import 'package:flutter/material.dart';

//----------------------------For Normal Text---------------------------------------------
Text myText({
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
      fontSize: size,
      fontWeight: weight,
      fontFamily: fontFamily,
    ),
  );
}

//----------------------------For Asset Image---------------------------------------------
Image myLocalImage({required String image, double height = 40}) {
  return Image.asset(
    'assets/$image',
    height: height,
  );
}

//----------------------------For Padding---------------------------------------------
EdgeInsets myPadding(
    {double left = 16,
    double right = 16,
    double top = 16,
    double bottom = 16}) {
  return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
}

//----------------------------For Buttons---------------------------------------------
SizedBox myButton(
    {required String text,
    bool isFilled = true,
    Color color = AppColors.primaryColor,
    double borderRadius = 16,
    double width = double.maxFinite,
    double height = 52,
    required void Function() func}) {
  return SizedBox(
    height: height,
    width: width,
    child: TextButton(
      style: TextButton.styleFrom(
        elevation: 8,
        backgroundColor: isFilled ? color : Colors.transparent,
        side: BorderSide(
            style: isFilled ? BorderStyle.none : BorderStyle.solid,
            color: Colors.white,
            width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: () {
        func();
      },
      child: myText(
        text: text,
        weight: FontWeight.bold,
        size: 18,
      ),
    ),
  );
}

//----------------------------For Other TextFields---------------------------------------------
SizedBox myTextfield(
    {required TextEditingController controller,
    required TextInputType keyboardType,
    required String hint}) {
  return SizedBox(
    height: 56,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: "Enter your $hint",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}

//----------------------------For Password TextField---------------------------------------------
SizedBox myTextfieldPassword({
  required TextEditingController controller,
  required void Function() func,
  required bool showPassword,
}) {
  return SizedBox(
    height: 56,
    child: TextField(
      keyboardType: TextInputType.visiblePassword,
      controller: controller,
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: "Enter your Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
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
