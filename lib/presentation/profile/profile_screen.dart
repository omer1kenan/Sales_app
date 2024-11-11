import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/data/datasources/user_remote_data_source.dart';
import 'package:sales_app/data/repositories/user_repository.dart';
import 'package:sales_app/domain/usecases/get_user.dart';
import 'package:sales_app/presentation/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(GetUser(UserRepository(UserRemoteDataSource()))),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileField(
                  label: "Name",
                  icon: Icons.person,
                  hintText: "Enter your name",
                  textController: TextEditingController(
                    text: controller.name.value,
                  ),
                  onChanged: controller.updateName,
                ),
                SizedBox(height: 16),
                ProfileField(
                  label: "Address",
                  icon: Icons.home,
                  hintText: "Enter your address",
                  textController: TextEditingController(
                    text: controller.address.value,
                  ),
                  onChanged: controller.updateAddress,
                ),
                SizedBox(height: 16),
                ProfileField(
                  label: "Phone",
                  icon: Icons.phone,
                  hintText: "Enter your phone number",
                  textController: TextEditingController(
                    text: controller.phone.value,
                  ),
                  onChanged: (value) => controller.phone.value = value,
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: controller.saveProfile,
                    icon: Icon(Icons.save),
                    label: Text("Save Profile"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.offAllNamed("/login");
                      Get.snackbar("Logged Out", "You have been logged out");
                    },
                    icon: Icon(Icons.logout, color: Colors.white),
                    label: Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hintText;
  final TextEditingController textController;
  final Function(String) onChanged;

  ProfileField({
    required this.label,
    required this.icon,
    required this.hintText,
    required this.textController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          controller: textController,
        ),
      ],
    );
  }
}
