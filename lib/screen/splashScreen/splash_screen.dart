import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/onboard_provider.dart';
import 'package:food_shop/screen/locationScreen/location_screen.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/screen/onboardScreen/onboard_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardProvider = context.watch<OnboardProvider>();
    final authProvider = context.watch<ApiProvider>();

    Future.delayed(Duration(seconds: 3), () {
      if (onboardProvider.isFirstTime) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardScreen()),
        );
      } else if (authProvider.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LocationScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset("assets/images/logo_image.png", scale: 3),
      ),
    );
  }
}
