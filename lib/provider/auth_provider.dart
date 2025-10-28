import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_shop/utils/url_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final box = GetStorage();
  String? token;
  bool isLoading = false;
  String? errorMessage;

  Map<String, dynamic>? userData;

  Future fetchReg(String name, String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final url = Uri.parse(Url.regUrl);
    try {
      final response = await http.post(
        url,
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        userData = jsonDecode(response.body);
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data['error'] ?? "Something went wrong!";
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future fetchLogin(String name, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    final url = Uri.parse(Url.loginUrl);
    try {
      final response = await http.post(
        url,
        body: jsonEncode({'email': name, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        final token = data['data']['token'];
        box.write('token', token);

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        userData = jsonDecode(response.body);
        errorMessage = 'Incorrect email and password';
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  Future logOut() async {
    box.remove('token');
    token = null;
    notifyListeners();
  }

  bool get isLoggedIn {
    final tokenBox = box.read('token');
    return tokenBox != null;
  }

  String? get getToken => box.read('token');
}
