import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;

  void login(String email, String password) {
    if (email == "test@example.com" && password == "123456") {
      isLoggedIn.value = true;
      Get.toNamed("/products");
    } else {
      Get.snackbar("Error", "Invalid email or password");
    }
  }
}
