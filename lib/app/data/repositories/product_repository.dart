import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/data/providers/product_provider.dart';

class ProductRepository {
  final ProductProvider apiClient = ProductProvider();

  Future<Product> getProduct() async {
    Map<String, dynamic>? json = await apiClient.getProdu();
    Product productNullo = Product();
    if (json == null) {
      return productNullo;
    } else {
      return Product.fromJson(json);
    }
  }
}
