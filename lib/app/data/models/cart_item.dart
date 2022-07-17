import 'package:teste_dev_flutter/app/data/models/product.dart';

class CartItemModel {
  Product product;
  int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  double totalPrice() {
    return product.price! * quantity;
  }
}
