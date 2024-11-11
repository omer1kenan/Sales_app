import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/domain/usecases/login_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;

  AuthController(this.loginUseCase);

  var username = ''.obs;
  var password = ''.obs;

  void updateUsername(String newUsername) {
    username.value = newUsername;
  }

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  Future<void> login() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    final token = await loginUseCase(username.value, password.value);
    Get.back();

    if (token != null) {
      Get.offAllNamed("/products");
      Get.snackbar("Success", "Login successful");
    } else {
      Get.snackbar("Error", "Invalid login credentials.");
    }
  }
}
