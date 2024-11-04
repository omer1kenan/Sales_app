import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sales_app/data/models/product_model.dart';
import 'package:sales_app/presentation/products/product_controller.dart';

class ProductControllerD extends GetxController {
  Product product = Get.arguments;
  String title = "test";
  @override
  void onInit() {
    title = product.title;
    super.onInit();
  }

  void updateProduct() {
    title = "product update";
    update();
    //Get.forceAppUpdate(); we can use it in languages or ...
    ProductController test = Get.find<ProductController>();
    test.fetchProducts();
    test.update();
  }
}
