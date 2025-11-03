import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/services/location_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<ApiProvider>(context);
    final locationProvider = Provider.of<LocationServices>(context);



    return Scaffold(
      body: Consumer<LocationServices>(
        builder: (context, value, child) {
          if (locationProvider.address == null && !locationProvider.isLoading) {
            locationProvider.loadSavedLocation();
          }

          return locationProvider.isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : Center(child: Text("${locationProvider.address}"));
        },
      ),
    );
  }
}
