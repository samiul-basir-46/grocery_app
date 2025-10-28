import 'package:flutter/material.dart';
import 'package:food_shop/provider/onboard_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    final onboardProvider = context.watch<OnboardProvider>();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_image.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.5),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/white_carrot.png",
                    scale: 3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Welcome\nto our store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Get your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomButton(
                  isLoading: false,
                  title: "Get Started",
                  onTap: () {
                    onboardProvider.completeOnboarding();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
