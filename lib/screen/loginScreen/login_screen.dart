import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/locationScreen/location_screen.dart';
import 'package:food_shop/screen/signupScreen/signup_screen.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:food_shop/widgets/custom_button.dart';
import 'package:food_shop/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    final authProvider = context.watch<ApiProvider>();

    final toggleProvider = context.watch<ToggleProvider>();

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your valid email";
                          }
                          return null;
                        },
                        controller: emailController,
                        text: 'Email',
                        isObscure: false,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your valid password";
                          }
                          return null;
                        },
                        controller: passwordController,
                        text: 'Password',
                        icon: IconButton(
                          onPressed: () {
                            toggleProvider.toggleVisibility();
                          },
                          icon: Icon(
                            toggleProvider.isVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        isObscure: toggleProvider.isVisibility,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text("Forget password?"),
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomButton(
                  isLoading: authProvider.isLoading,
                  title: "Log in",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final success = await authProvider.fetchLogin(
                        emailController.text,
                        passwordController.text,
                      );
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Successful")),
                        );

                        await Future.delayed(
                          Duration(seconds: 1),
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationScreen(),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              authProvider.errorMessage ?? "Unknown error",
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  isLoading: false,
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
                            ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            ),
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
}
