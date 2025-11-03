import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {

  bool isVisibilitySignup = true;
  bool isVisibilityLogin = true;
  bool? isTure;

  void toggleVisibilitySignup () {
    isVisibilitySignup = !isVisibilitySignup;
    notifyListeners();
  }

  void toggleVisibilityLogin(){
    isVisibilityLogin = !isVisibilityLogin;
    notifyListeners();
  }


}