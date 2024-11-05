import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/data/repositories/product_repository.dart';
import 'package:sales_app/domain/usecases/get_products.dart';
import 'package:sales_app/presentation/cart/cart_controller.dart';
import 'product_controller.dart';

class ProductsScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(GetProducts(ProductRepository())),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.toNamed("/cart");
                    },
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Obx(() {
                      return cartController.cartItems.isEmpty
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${cartController.cartItems.length}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            );
                    }),
                  ),
                ],
              ),
            ],
          ),
          body: Column(
            children: [
              GetBuilder<ProductController>(
                builder: (_) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          child: ChoiceChip(
                            label: Text(category),
                            selected:
                                controller.selectedCategory.value == category,
                            onSelected: (isSelected) {
                              controller.selectCategory(category);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              Expanded(
                child: GetBuilder<ProductController>(
                  builder: (_) {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = controller.filteredProducts[index];
                          return ListTile(
                            onTap: () {
                              Get.toNamed("/productD", arguments: product);
                            },
                            leading: Image.network(product.image,
                                width: 50, height: 50),
                            title: Text(product.title),
                            subtitle: Text("\$${product.price}"),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
