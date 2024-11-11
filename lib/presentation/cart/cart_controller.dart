import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/data/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    Get.defaultDialog(
      title: "Remove Item",
      middleText: "Are you sure you want to remove this item from the cart?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        cartItems.remove(product);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
