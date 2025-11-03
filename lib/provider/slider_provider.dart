import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier{

  var currentIndex = 0;
  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

}