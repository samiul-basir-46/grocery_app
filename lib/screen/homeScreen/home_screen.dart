import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<ApiProvider>();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authProvider.logOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
