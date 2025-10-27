import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/carrot_images.png", scale: 3),
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
              CustomTextField(text: 'Username', isObscure: false),
              SizedBox(height: screenHeight * 0.03),
              CustomTextField(text: 'Email', isObscure: false),
              SizedBox(height: screenHeight * 0.03),
              CustomTextField(
                text: 'Password',
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
                isObscure: true,
              ),
              SizedBox(height: screenHeight * 0.03),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: RichText(
                  text: TextSpan(
                    text: 'By continuing you agree to our ',
                    children: [
                      TextSpan(
                        text: 'Terms of Service ',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomButton(title: "Sign up", onTap: () => _onTapSignupButton()),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Already have an account? '),
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
    );
  }

  void _onTapSignupButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
