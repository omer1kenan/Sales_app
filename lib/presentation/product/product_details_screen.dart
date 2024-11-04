import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sales_app/presentation/product/product_controller_d.dart';

class ProductD extends StatelessWidget {
  const ProductD({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductControllerD(),
        builder: (ProductControllerD controller) {
          return Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                child: Text(controller.title),
                onTap: () {
                  controller.updateProduct();
                },
              ),
            ),
          );
        });
  }
}
