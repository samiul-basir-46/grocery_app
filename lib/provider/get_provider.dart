import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_shop/model/api_get_model.dart';
import 'package:food_shop/model/profile_model.dart';
import 'package:food_shop/utils/url_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class GetApiProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  ProfileModel? _profile;
  final box = GetStorage();
  List<ApiGetModel> _products = [];
  String _profileName = "";
  String _profileEmail = "";
  String? token;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<ApiGetModel> get products => _products;

  ProfileModel? get profile => _profile;

  String get profileName => _profileName;

  String get profileEmail => _profileEmail;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://api.zhndev.site/wp-json/base/api/products");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List productsData = data['data']['products'];
        _products = productsData
            .map((product) => ApiGetModel.fromJson(product))
            .toList();
      } else {
        _errorMessage = "Failed to load products";
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();

    token = box.read('token');
    print(token);

    if (token == null) {
      _errorMessage = "No token found!";
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      final url = Uri.parse(Url.profileUrl);
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _profile = ProfileModel.fromJson(data['data']);

        _profileName = data['data']['display_name'];
        _profileEmail = data['data']['email'];

        box.write('displayName', _profileName);
        box.write('email', _profileEmail);
      } else {
        _errorMessage = "Failed : ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void profileLogOut() {
    box.remove('token');
    box.remove('displayName');
    box.remove('email');
    token = null;
    _profileEmail = '';
    _profileName = '';
    _profile = null;
    notifyListeners();
  }

  void loadSavedProfile() {
    _profileName = box.read('displayName') ?? '';
    _profileEmail = box.read('email') ?? '';
    notifyListeners();
  }
}
