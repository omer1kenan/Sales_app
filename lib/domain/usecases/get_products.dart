import 'package:sales_app/data/models/product_model.dart';
import 'package:sales_app/data/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.fetchProducts();
  }
}
