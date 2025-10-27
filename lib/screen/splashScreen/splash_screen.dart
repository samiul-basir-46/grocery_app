import 'package:flutter/material.dart';
import 'package:food_shop/screen/onboardScreen/onboard_screen.dart';
import '../../utils/colors.dart';
import '../loginScreen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardScreen()),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset("assets/images/logo_image.png", scale: 3),
      ),
    );
  }
}
