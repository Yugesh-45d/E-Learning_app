// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:e_learning_app/config/auth_methods.dart';
import 'package:e_learning_app/screens/login_pages/register_screen.dart';
import 'package:e_learning_app/screens/main_pages/select_course_screen.dart';
import 'package:e_learning_app/config/app_colors.dart';
import 'package:e_learning_app/config/app_fonts.dart';
import 'package:e_learning_app/config/helper_func.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  bool checkboxValue = false;

  Future<String> login() async {
    String result = await AuthMethods().logIn(
        email: _emailController.text, password: _passwordController.text);
    log(result);
    return result;
  }

  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  void _validateUsername() {
    _emailKey.currentState!.validate();
  }

  void _validatePassword() {
    _passwordKey.currentState!.validate();
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showHidePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: AppFunc.myText(
          text: "LOG IN",
          size: 24,
          color: AppColors.primaryColor,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: AppFunc.myPadding(top: 0, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppFunc.mySizedbox(height: 8),
              AppFunc.myText(
                text: "Learning App",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                font: AppFonts.primaryFont,
                size: 40,
              ),
              AppFunc.mySizedbox(height: 40),
              AppFunc.myText(
                text: "Enter your log in details to access your account",
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                size: 20,
              ),
              AppFunc.mySizedbox(height: 32),
              AppFunc.myTextfield(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hint: "Email",
                focusNode: _emailFocusNode,
                key: _emailKey,
              ),
              AppFunc.mySizedbox(height: 8),
              AppFunc.myTextfieldPassword(
                controller: _passwordController,
                func: showHidePassword,
                showPassword: showPassword,
                key: _passwordKey,
                focusNode: _passwordFocusNode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
            
                        text: "Remember me?",
                        font: AppFonts.thirdFont,
                        size: 16,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  AppFunc.myText(
           
                    text: "Forget Password?",
                    color: Colors.red,
                    size: 16,
                    font: AppFonts.thirdFont,
                  ),
                ],
              ),
              AppFunc.myButton(
                text: "Login",
                func: () async {
                  _validateUsername();
                  _validatePassword();
                  String result =
                      await login(); // Wait for the storeData function to complete
                  if (result == "Sucessfully logged in") {
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
              AppFunc.mySizedbox(height: 24),
              Wrap(
                children: [
                  AppFunc.myText(
                    text: "Don't have an account? ",
                    color: AppColors.primaryColor,
                    font: AppFonts.thirdFont,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RegisterScreen())));
                    },
                    child: AppFunc.myText(
                      text: "Create account",
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
