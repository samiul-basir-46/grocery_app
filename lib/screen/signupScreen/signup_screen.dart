import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/services/api_services.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/carrot_images.png",
                    scale: 3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Enter your credentials to continue",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomTextField(
                  text: 'Username',
                  isObscure: false,
                  controller: nameController,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  text: 'Email',
                  isObscure: false,
                  controller: emailController,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  text: 'Password',
                  controller: passwordController,
                  isObscure: !isObs,
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObs = !isObs;
                      });
                    },
                    icon: Icon(isObs ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomButton(
                  title: "Sign up",
                  onTap: () => {
                    ApiServices.fetchReg(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    ),
                    _onTapSignupButton(),
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _onTapSignupButton(),
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignupButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
