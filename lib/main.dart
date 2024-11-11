import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_app/presentation/auth/auth_controller.dart';
import 'package:sales_app/presentation/auth/auth_screen.dart';
import 'package:sales_app/presentation/cart/carrt_screen.dart';
import 'package:sales_app/presentation/loading/loading_screen.dart';
import 'package:sales_app/presentation/product/product_details_screen.dart';
import 'package:sales_app/presentation/profile/profile_screen.dart';

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
      home: LoginScreen(),
      getPages: [
        GetPage(name: "/products", page: () => ProductsScreen()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/products", page: () => ProductsScreen()),
        GetPage(name: '/productD', page: () => ProductDetailsScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/loading', page: () => LoadingScreen())
      ],
    );
  }
}
