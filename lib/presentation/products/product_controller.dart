import 'package:get/get.dart';
import 'package:sales_app/data/models/product_model.dart';
import '../../domain/usecases/get_products.dart';

class ProductController extends GetxController {
  final GetProducts getProducts;
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var categories = <String>[].obs;
  var selectedCategory = ''.obs;

  ProductController(this.getProducts);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading.value = true;
    try {
      products.value = await getProducts.call();
      extractCategories();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch products");
    } finally {
      isLoading.value = false;
    }
  }

  void extractCategories() {
    var allCategories =
        products.map((product) => product.category).toSet().toList();
    categories.assignAll(['All', ...allCategories]);
    selectedCategory.value = 'All';
  }

  List<Product> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return products;
    } else {
      return products
          .where((product) => product.category == selectedCategory.value)
          .toList();
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
