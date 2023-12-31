// // ignore_for_file: prefer_const_constructors

// import 'package:e_learning_app/config/app_colors.dart';
// import 'package:e_learning_app/config/app_fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// class AppFunc {
//   //----------------------------For Normal Text---------------------------------------------
//   static Text myText({
//     required String text,
//     Color color = Colors.white,
//     double size = 16,
//     FontWeight weight = FontWeight.normal,
//     TextAlign alignment = TextAlign.center,
//     String? font,
//   }) {
//     String fontFamily = font ?? AppFonts.secondaryFont;
//     return Text(
//       text,
//       textAlign: alignment,
//       style: TextStyle(
//         color: color,
//         fontSize: size.sp,
//         fontWeight: weight,
//         fontFamily: fontFamily,
//       ),
//     );
//   }

// //----------------------------For Asset Image---------------------------------------------
//   static Image myLocalImage({required String image, double height = 40}) {
//     return Image.asset(
//       'assets/$image',
//       height: height.h,
//     );
//   }

//   //----------------------------For Padding---------------------------------------------
//   static EdgeInsets myPadding(
//       {double left = 16,
//       double right = 16,
//       double top = 16,
//       double bottom = 16}) {
//     return EdgeInsets.only(
//         left: left.w, right: right.w, top: top.h, bottom: bottom.h);
//   }

// //----------------------------For Buttons---------------------------------------------
//   static SizedBox myButton({
//     required String text,
//     bool isFilled = true,
//     Color color = AppColors.primaryColor,
//     double borderRadius = 16,
//     double width = double.maxFinite,
//     double height = 52,
//     double textSize = 18,
//     required Future<void> Function() func,
//   }) {
//     return SizedBox(
//       height: height.h,
//       width: width.w,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           elevation: 8,
//           backgroundColor: isFilled ? color : Colors.transparent,
//           side: BorderSide(
//               style: isFilled ? BorderStyle.none : BorderStyle.solid,
//               color: isFilled ? Colors.white : AppColors.primaryColor,
//               width: 1.w),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius.r),
//           ),
//         ),
//         onPressed: () async {
//           await func();
//         },
//         child: AppFunc.myText(
//           text: text,
//           color: isFilled ? Colors.white : AppColors.primaryColor,
//           weight: FontWeight.bold,
//           size: textSize,
//         ),
//       ),
//     );
//   }

// //----------------------------For Other TextFields---------------------------------------------
//   static Widget myTextfield({
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required String hint,
//   }) {
//     return TextFormField(
//       validator: (String? value) {
//         if (value!.isEmpty) {
//           return "Valid $hint is required";
//         } else {
//           return null;
//         }
//       },
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//       ),
//     );
//   }

// //----------------------------For Password TextField---------------------------------------------
//   static SizedBox myTextfieldPassword({
//     required TextEditingController controller,
//     required void Function() func,
//     required bool showPassword,
//   }) {
//     return SizedBox(
//       height: 56.h,
//       width: double.maxFinite,
//       child: TextFormField(
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return "Password is required";
//           } else {
//             return null;
//           }
//         },
//         keyboardType: TextInputType.visiblePassword,
//         controller: controller,
//         obscureText: !showPassword,
//         decoration: InputDecoration(
//           labelText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//           ),
//           suffixIcon: IconButton(
//             onPressed: () {
//               func();
//             },
//             icon: showPassword
//                 ? Icon(
//                     Icons.visibility,
//                   )
//                 : Icon(
//                     Icons.visibility_off,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

// //----------------------------For Sizedbox---------------------------------------------
//   static SizedBox mySizedbox({double height = 0, double width = 0}) {
//     return SizedBox(
//       height: height.h,
//       width: width.w,
//     );
//   }

// //----------------------------For Card Widget---------------------------------------------
//   static Card myCard({
//     required String image,
//     required String faculty,
//     required String subject,
//     required int hours,
//     double cardWidth = 224,
//     double imageHeight = 144,
//     double facultytextSize = 20,
//     double subjecttextSize = 24,
//     double hoursTextSize = 16,
//     bool showFaculty = true,
//     bool showSubject = true,
//     bool showHours = true,
//     bool showBorder = false,
//   }) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//         side: BorderSide(
//           color: showBorder ? AppColors.primaryColor : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       color: AppColors.backgroundColor,
//       elevation: 2,
//       child: Padding(
//         padding: AppFunc.myPadding(),
//         child: Column(
//           children: [
//             SizedBox(
//               child: AppFunc.myLocalImage(
//                 image: image,
//                 height: imageHeight,
//               ),
//             ),
//             if (showFaculty)
//               Column(
//                 children: [
//                   AppFunc.mySizedbox(height: 8),
//                   SizedBox(
//                     width: cardWidth.w,
//                     child: AppFunc.myText(
//                       alignment: TextAlign.left,
//                       text: faculty,
//                       size: facultytextSize,
//                       color: AppColors.primaryColor,
//                       font: AppFonts.thirdFont,
//                     ),
//                   ),
//                 ],
//               ),
//             if (showSubject)
//               Column(
//                 children: [
//                   AppFunc.mySizedbox(height: 8),
//                   SizedBox(
//                     width: cardWidth.w,
//                     child: AppFunc.myText(
//                       alignment: TextAlign.left,
//                       text: subject,
//                       size: subjecttextSize,
//                       color: AppColors.primaryColor,
//                       font: AppFonts.primaryFont,
//                     ),
//                   ),
//                 ],
//               ),
//             if (showHours)
//               Column(
//                 children: [
//                   AppFunc.mySizedbox(height: 8),
//                   SizedBox(
//                     width: cardWidth.w,
//                     child: AppFunc.myText(
//                       alignment: TextAlign.left,
//                       text: "$hours hours",
//                       size: hoursTextSize,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }

// //----------------------------For Cupertino ListTile---------------------------------------------

//   static CupertinoListTile myListCupertinoListTile({required String text}) {
//     return CupertinoListTile(
//       title: AppFunc.myText(
//         text: text,
//         font: AppFonts.thirdFont,
//         size: 20,
//         color: AppColors.primaryColor,
//       ),
//       trailing: Icon(
//         Icons.arrow_forward_ios,
//         color: AppColors.primaryColor,
//         size: 20,
//       ),
//     );
//   }

// //----------------------------For Classes Card Widget---------------------------------------------

//   static Card myClassesCard({
//     required String image,
//     required String faculty,
//     required String subject,
//     required double progress,
//   }) {
//     return Card(
//       color: AppColors.backgroundColor,
//       elevation: 2,
//       child: Padding(
//         padding: AppFunc.myPadding(),
//         child: Row(
//           children: [
//             Image.asset(
//               "assets/$image",
//               height: 96.h,
//               width: 96.w,
//             ),
//             AppFunc.mySizedbox(width: 12),
//             Column(
//               children: [
//                 SizedBox(
//                   width: 168.w,
//                   child: AppFunc.myText(
//                     alignment: TextAlign.left,
//                     text: faculty,
//                     size: 20,
//                     color: AppColors.primaryColor,
//                     font: AppFonts.thirdFont,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 168.w,
//                   child: AppFunc.myText(
//                     alignment: TextAlign.left,
//                     text: subject,
//                     size: 20,
//                     color: AppColors.primaryColor,
//                     font: AppFonts.primaryFont,
//                   ),
//                 ),
//                 AppFunc.mySizedbox(height: 8),
//                 SizedBox(
//                   width: 168.w,
//                   child: AppFunc.myText(
//                     alignment: TextAlign.left,
//                     text: "$progress% Completed",
//                     color: AppColors.primaryColor,
//                     font: AppFonts.primaryFont,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 168.w,
//                   child: LinearProgressIndicator(
//                     value: progress / 100,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   //----------------------------For Classes Card Widget---------------------------------------------

//   static Future<Uint8List?> pickImage(ImageSource source) async {
//     final ImagePicker imagePicker = ImagePicker();

//     XFile? file = await imagePicker.pickImage(source: source);

//     return await file?.readAsBytes();
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
  static SizedBox myButton({
    required String text,
    bool isFilled = true,
    Color color = AppColors.primaryColor,
    double borderRadius = 16,
    double width = double.maxFinite,
    double height = 52,
    double textSize = 18,
    required Future<void> Function() func,
  }) {
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
        onPressed: () async {
          await func();
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
  static SizedBox myTextfield({
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String hint,
    required FocusNode focusNode,
    required Key key,
  }) {
    return SizedBox(
      height: 80.h,
      width: double.maxFinite,
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return "Valid $hint is required";
          } else {
            return null;
          }
        },
        key: key,
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: hint,
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
    required FocusNode focusNode,
    required Key key,
  }) {
    return SizedBox(
      height: 80.h,
      width: double.maxFinite,
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return "Password is required";
          } else {
            return null;
          }
        },
        focusNode: focusNode,
        key: key,
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        obscureText: !showPassword,
        decoration: InputDecoration(
          labelText: "Password",
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

//----------------------------For Sizedbox---------------------------------------------
  static SizedBox mySizedbox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height.h,
      width: width.w,
    );
  }

//----------------------------For Card Widget---------------------------------------------
  static Card myCard({
    required String image,
    required String faculty,
    required String subject,
    required int hours,
    double cardWidth = 224,
    double imageHeight = 144,
    double facultytextSize = 20,
    double subjecttextSize = 24,
    double hoursTextSize = 16,
    bool showFaculty = true,
    bool showSubject = true,
    bool showHours = true,
    bool showBorder = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: showBorder ? AppColors.primaryColor : Colors.transparent,
          width: 2,
        ),
      ),
      color: AppColors.backgroundColor,
      elevation: 2,
      child: Padding(
        padding: AppFunc.myPadding(),
        child: Column(
          children: [
            SizedBox(
              child: AppFunc.myLocalImage(
                image: image,
                height: imageHeight,
              ),
            ),
            if (showFaculty)
              Column(
                children: [
                  AppFunc.mySizedbox(height: 8),
                  SizedBox(
                    width: cardWidth.w,
                    child: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: faculty,
                      size: facultytextSize,
                      color: AppColors.primaryColor,
                      font: AppFonts.thirdFont,
                    ),
                  ),
                ],
              ),
            if (showSubject)
              Column(
                children: [
                  AppFunc.mySizedbox(height: 8),
                  SizedBox(
                    width: cardWidth.w,
                    child: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: subject,
                      size: subjecttextSize,
                      color: AppColors.primaryColor,
                      font: AppFonts.primaryFont,
                    ),
                  ),
                ],
              ),
            if (showHours)
              Column(
                children: [
                  AppFunc.mySizedbox(height: 8),
                  SizedBox(
                    width: cardWidth.w,
                    child: AppFunc.myText(
                      alignment: TextAlign.left,
                      text: "$hours hours",
                      size: hoursTextSize,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

//----------------------------For Cupertino ListTile---------------------------------------------

  static CupertinoListTile myListCupertinoListTile({required String text}) {
    return CupertinoListTile(
      title: AppFunc.myText(
        text: text,
        font: AppFonts.thirdFont,
        size: 20,
        color: AppColors.primaryColor,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.primaryColor,
        size: 20,
      ),
    );
  }

//----------------------------For Classes Card Widget---------------------------------------------

  static Card myClassesCard({
    required String image,
    required String faculty,
    required String subject,
    required double progress,
  }) {
    return Card(
      color: AppColors.backgroundColor,
      elevation: 2,
      child: Padding(
        padding: AppFunc.myPadding(),
        child: Row(
          children: [
            Image.asset(
              "assets/$image",
              height: 96.h,
              width: 96.w,
            ),
            AppFunc.mySizedbox(width: 12),
            Column(
              children: [
                SizedBox(
                  width: 168.w,
                  child: AppFunc.myText(
                    alignment: TextAlign.left,
                    text: faculty,
                    size: 20,
                    color: AppColors.primaryColor,
                    font: AppFonts.thirdFont,
                  ),
                ),
                SizedBox(
                  width: 168.w,
                  child: AppFunc.myText(
                    alignment: TextAlign.left,
                    text: subject,
                    size: 20,
                    color: AppColors.primaryColor,
                    font: AppFonts.primaryFont,
                  ),
                ),
                AppFunc.mySizedbox(height: 8),
                SizedBox(
                  width: 168.w,
                  child: AppFunc.myText(
                    alignment: TextAlign.left,
                    text: "$progress% Completed",
                    color: AppColors.primaryColor,
                    font: AppFonts.primaryFont,
                  ),
                ),
                SizedBox(
                  width: 168.w,
                  child: LinearProgressIndicator(
                    value: progress / 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //----------------------------For Classes Card Widget---------------------------------------------

  static pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
  }
}
