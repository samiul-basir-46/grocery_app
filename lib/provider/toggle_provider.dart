import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {

  bool isVisibilitySignup = true;
  bool isVisibilityLogin = true;
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool? isTure;
  int _index = 0;
  int get index => _index;
  bool get isExpanded => _isExpanded;
  bool get isExpanded2 => _isExpanded2;

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

  void toggleExpand(){
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
  void toggleExpand2(){
    _isExpanded2 = !_isExpanded2;
    notifyListeners();
  }


  void navBarChange(int i){
    _index = i;
    notifyListeners();
  }

  void changeTab(int newIndex){
    _index = newIndex;
    notifyListeners();
  }

  void resetNav (){
    _index = 0;
    notifyListeners();
  }



}