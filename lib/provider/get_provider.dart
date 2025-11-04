import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_shop/model/api_get_model.dart';
import 'package:http/http.dart' as http;

class GetApiProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<ApiGetModel> _products = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ApiGetModel> get products => _products;

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
}
