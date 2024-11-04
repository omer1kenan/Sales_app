import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/presentation/login/login_screen.dart';
import 'package:sales_app/presentation/product/product_details_screen.dart';

import 'presentation/products/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sales App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductsScreen(),
      getPages: [
        GetPage(
          name: "/productD",
          page: () => ProductDetailsScreen(),
        ),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/products", page: () => ProductsScreen()),
      ],
    );
  }
}
