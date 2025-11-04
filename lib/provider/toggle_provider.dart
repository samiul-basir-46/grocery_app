import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {

  bool isVisibilitySignup = true;
  bool isVisibilityLogin = true;
  bool? isTure;

  final Map<String, bool> _seeAllMap = {
    'exclusive' : false,
    'bestSelling' : false,
    'groceries' : false
  };

  bool getSeeAll(String key) => _seeAllMap[key] ?? false;

  void toggleVisibilitySignup () {
    isVisibilitySignup = !isVisibilitySignup;
    notifyListeners();
  }

  void toggleVisibilityLogin(){
    isVisibilityLogin = !isVisibilityLogin;
    notifyListeners();
  }

  void toggleSeeAll(String key) {
    _seeAllMap[key] = !(_seeAllMap[key] ?? false);
    notifyListeners();
  }


}