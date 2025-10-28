import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class OnboardProvider with ChangeNotifier {
  final box = GetStorage();
  bool isFirstTime = true;

  OnboardProvider() {
    isFirstTime = box.read("isFirstTime") ?? true;
  }

  void completeOnboarding(){
    box.write('isFirstTime', false);
    isFirstTime = false;
    notifyListeners();
  }

}
