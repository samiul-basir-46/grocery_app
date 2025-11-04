import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_shop/navBarView/nav_bar_view.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/get_provider.dart';
import 'package:food_shop/provider/onboard_provider.dart';
import 'package:food_shop/provider/slider_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/screen/navigationScreens/homeScreen/home_screen.dart';
import 'package:food_shop/screen/splashScreen/splash_screen.dart';
import 'package:food_shop/services/location_services.dart';
import 'package:food_shop/test.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cart, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  HttpOverrides.global = PostHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
        ChangeNotifierProvider(create: (context) => OnboardProvider()),
        ChangeNotifierProvider(
          create: (context) => LocationServices()..loadSavedLocation(),
        ),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => GetApiProvider(),)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    // final token = box.read('token');

    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
