import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/onboard_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
        ChangeNotifierProvider(create: (context) => OnboardProvider()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
