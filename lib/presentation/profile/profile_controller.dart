import 'package:get/get.dart';
import 'package:sales_app/data/models/user.dart';
import 'package:sales_app/domain/usecases/get_user.dart';

class ProfileController extends GetxController {
  final GetUser getUser;

  var name = ''.obs;
  var address = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  ProfileController(this.getUser);

  void updateName(String newName) {
    name.value = newName;
  }

  void updateAddress(String newAddress) {
    address.value = newAddress;
  }

  void saveProfile() {
    Get.snackbar("Profile", "Profile saved successfully");
  }

  Future<void> loadUserData() async {
    User? user = await getUser();
    if (user != null) {
      name.value = "${user.firstname} ${user.lastname}";
      address.value =
          "${user.address.street}, ${user.address.city}, ${user.address.zipcode}";
      email.value = user.email;
      phone.value = user.phone;
      update();
    } else {
      Get.snackbar("Error", "Failed to load user data");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }
}
