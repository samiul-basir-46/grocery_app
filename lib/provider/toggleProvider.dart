import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {

  bool isVisibility = true;

  void toggleVisibility () {
    isVisibility = !isVisibility;
    notifyListeners();
  }

}