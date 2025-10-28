import 'dart:convert';
import 'package:food_shop/utils/url_config.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static Future fetchReg(String name, String email, String password) async {
    final url = Uri.parse(Url.regUrl);

    final body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    final response = await http.post(
      url,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print("Account Created Successfully");
      return jsonData;
    } else {
      print("Account Create Failed");
    }
  }

  static Future fetchLogin(String email, String password) async {
    final url = Uri.parse(Url.loginUrl);
    final body = jsonEncode({'email': email, 'password': password});

    final response = await http.post(
      url,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = jsonDecode(response.body);
      print("Login success");
      return decodeJson;
    } else {
      print("Failed${response.statusCode}");
      return null;
    }
  }
}
