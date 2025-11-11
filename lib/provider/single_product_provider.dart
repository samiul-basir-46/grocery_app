import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/api_get_model.dart';
import '../model/product_details_model.dart';
import 'package:flutter/material.dart';

import '../utils/url_config.dart';

class SingleProductProvider with ChangeNotifier {
  ProductDetailsModel? _singleProduct;
  bool isLoading = false;

  ProductDetailsModel? get singleProduct => _singleProduct;

  ApiGetModel? get productAsApiGetModel {
    if (_singleProduct == null) return null;
    return ApiGetModel(
      id: _singleProduct!.id,
      name: _singleProduct!.name,
      description: _singleProduct!.description,
      price: _singleProduct!.price,
      image: _singleProduct!.image,
      category: '',
    );
  }

  Future<void> fetchSingleProduct(int id) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("${Url.productsUrl}/$id");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _singleProduct = ProductDetailsModel.fromJson(data['data']);
      } else {
        _singleProduct = null;
      }
    } catch (e) {
      _singleProduct = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
