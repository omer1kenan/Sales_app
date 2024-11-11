import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sales_app/data/models/user.dart';
import 'package:sales_app/utils/constants.dart';

class UserRemoteDataSource {
  Future<User?> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConstants.baseUrl}/users/1"),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
