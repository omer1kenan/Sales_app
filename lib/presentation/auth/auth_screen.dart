import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: controller.updateEmail,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: controller.updatePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.login,
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
