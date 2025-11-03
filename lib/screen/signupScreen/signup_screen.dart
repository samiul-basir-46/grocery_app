import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                  "Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Enter your credentials to continue",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.04),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              filled: false,
                              text: 'First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Field is Empty";
                                }
                                return null;
                              },
                              isObscure: false,
                              controller: firstNameController,
                            ),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: CustomTextField(
                              filled: false,
                              text: 'Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Field is Empty";
                                }
                                return null;
                              },
                              isObscure: false,
                              controller: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        filled: false,
                        text: 'Username',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                          return null;
                        },
                        isObscure: false,
                        controller: nameController,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        filled: false,
                        text: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        isObscure: false,
                        controller: emailController,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        filled: false,
                        text: 'Password',
                        controller: passwordController,
                        isObscure: toggleProvider.isVisibilitySignup,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            toggleProvider.toggleVisibilitySignup();
                          },
                          icon: Icon(
                            toggleProvider.isVisibilitySignup
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ],
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
                  isLoading: authProvider.isLoading,
                  title: "Sign up",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await authProvider.fetchReg(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                      );
                      if (!context.mounted) {
                        return;
                      }

                      if (authProvider.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              authProvider.errorMessage!,
                              style: TextStyle(color: Colors.white),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Account Created"),
                            behavior: SnackBarBehavior.floating,
                            // margin: EdgeInsets.only(bottom: 20),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    }
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
                            ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
