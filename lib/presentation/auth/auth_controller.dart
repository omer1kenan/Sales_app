import 'dart:convert';
import 'package:get/get.dart';
import 'package:sales_app/data/models/user.dart';
import 'package:sales_app/presentation/loading/loading_screen.dart';
import 'package:sales_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var user = Rxn<User>();

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  void showLoading() {
    Get.dialog(
      LoadingScreen(),
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  Future<void> login() async {
    showLoading();
    try {
      final response = await http.post(
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": email.value,
          "password": password.value,
        }),
      );
      hideLoading();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data["token"];
        if (token != null) {
          User? fetchedUser = await fetchUserData();
          if (fetchedUser != null) {
            user.value = fetchedUser;
            update();
            Get.offAllNamed("/products");
            Get.snackbar("Success", "Login successful");
          } else {
            Get.snackbar("Error", "Failed to load user data.");
          }
        } else {
          Get.snackbar("Error", "Invalid login response");
        }
      } else {
        Get.snackbar("Error", "Login failed. Check your credentials.");
      }
    } catch (e) {
      hideLoading();
      Get.snackbar("Error", "Failed to connect to the server.");
    }
  }

  Future<User?> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConstants.baseUrl}/users/1"),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar("Error", "Failed to fetch user data");
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to connect to the server.");
      return null;
    }
  }
}
