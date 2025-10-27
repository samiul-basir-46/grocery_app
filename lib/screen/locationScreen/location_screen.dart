import 'package:flutter/material.dart';
import 'package:food_shop/widgets/custom_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/map_image.png", scale: 3.5),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Select your Location",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Switch on your location to stay in tune with\nwhat’s happening in your area",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(),
            CustomButton(title: "Submit")
          ],
        ),
      ),
    );
  }
}
