import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/data/datasources/auth_remote_data_source.dart';
import 'package:sales_app/data/repositories/auth_repository.dart';
import 'package:sales_app/domain/usecases/login_use_case.dart';
import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init:
          AuthController(LoginUseCase(AuthRepository(AuthRemoteDataSource()))),
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
                  onChanged: controller.updateUsername,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
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
