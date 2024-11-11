import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sales_app/utils/constants.dart';

class AuthRemoteDataSource {
  Future<String?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiConstants.baseUrl}/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["token"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
