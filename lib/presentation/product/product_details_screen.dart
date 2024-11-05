import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sales_app/data/models/product_model.dart';
import 'package:sales_app/presentation/cart/cart_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return GetBuilder<CartController>(
      init: CartController(),
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.image,
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                SizedBox(height: 16),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Category: ${product.category}",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addToCart(product);
                      Get.snackbar("Added", "${product.title} added to cart");
                    },
                    child: Text("Add to Cart"),
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
