import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/screen/locationScreen/location_screen.dart';
import 'package:food_shop/screen/signupScreen/signup_screen.dart';
import 'package:food_shop/services/api_services.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:food_shop/widgets/custom_button.dart';
import 'package:food_shop/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Login",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Enter your emails and password",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomTextField(
                  controller: emailController,
                  text: 'Email',
                  isObscure: false,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  controller: passwordController,
                  text: 'Password',
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObs = !isObs;
                      });
                    },
                    icon: Icon(isObs ? Icons.visibility : Icons.visibility_off),
                  ),
                  isObscure: !isObs,
                ),
                SizedBox(height: screenHeight * 0.03),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text("Forget password?"),
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomButton(
                  title: "Log in",
                  onTap: () => {
                    ApiServices.fetchLogin(
                      emailController.text,
                      passwordController.text,
                    ),
                    _onTapLoginButton(),
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  title: "Continue with Google",
                  color: AppColors.secondaryColor,
                ),
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Sign up',
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
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  void _onTapLoginButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen()),
    );
  }
}
