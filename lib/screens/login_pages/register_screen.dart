// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:e_learning_app/config/auth_methods.dart';
import 'package:e_learning_app/screens/login_pages/login_screen.dart';
import 'package:e_learning_app/screens/main_pages/select_course_screen.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = false;
  bool checkboxValue = false;
  String username = '';
  String fullName = '';
  String email = 'nothing';
  String password = '';
  Uint8List? image;

  void selectImage() async {
    Uint8List im = await AppFunc.pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _userNameController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void showHidePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  Future<String> storeData() async {
    String result = await AuthMethods().signUpUser(
      username: _userNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      profilePhoto: image!,
    );
    log(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: AppFunc.myPadding(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFunc.mySizedbox(height: 40),
              AppFunc.myText(
                text: "REGISTER",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                size: 24,
              ),
              AppFunc.mySizedbox(height: 8),
              AppFunc.myText(
                text: "Learning App",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
                size: 40,
              ),
              // AppFunc.mySizedbox(height: 24),
              // AppFunc.myText(
              //   text: "Input Email and Password to Continue the Registration",
              //   color: AppColors.primaryColor,
              //   weight: FontWeight.bold,
              //   size: 20,
              // ),
              GestureDetector(
                onTap: () {
                  selectImage();
                },
                child: image != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(image!),
                        radius: 48.r,
                      )
                    : Stack(
                        children: [
                          CircleAvatar(
                            radius: 48.r,
                            child: AppFunc.myLocalImage(
                                image: "2.png", height: 64),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              AppFunc.mySizedbox(height: 8),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(
                  children: [
                    AppFunc.myTextfield(
                      controller: _userNameController,
                      keyboardType: TextInputType.text,
                      hint: "Username",
                    ),
                    AppFunc.mySizedbox(height: 16),
                    AppFunc.myTextfield(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      hint: "Full Name",
                    ),
                    AppFunc.mySizedbox(height: 16),
                    AppFunc.myTextfield(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "Email",
                    ),
                    AppFunc.mySizedbox(height: 16),
                    AppFunc.myTextfieldPassword(
                      controller: _passwordController,
                      func: showHidePassword,
                      showPassword: showPassword,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value!;
                      });
                    },
                  ),
                  AppFunc.myText(
                    //TODO add remember me functionality
                    text: "Remember me?",
                    font: AppFonts.thirdFont,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              AppFunc.mySizedbox(height: 16),
              AppFunc.myButton(
                text: "Register",
                func: () async {
                  String result =
                      await storeData(); // Wait for the storeData function to complete
                  if (result == "Sucessfully registered") {
                    // Assuming your signUpUser method returns "success" on success
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectCourseScreen()),
                    );
                  } else {
                    // Handle error case here
                    log(result);
                  }
                },
                borderRadius: 32,
                width: 320,
              ),
              AppFunc.mySizedbox(height: 40),
              Wrap(
                children: [
                  AppFunc.myText(
                    text: "Already have an account? ",
                    color: AppColors.primaryColor,
                    font: AppFonts.thirdFont,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())));
                    },
                    child: AppFunc.myText(
                      text: "Login",
                      color: Colors.blue,
                      font: AppFonts.thirdFont,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
