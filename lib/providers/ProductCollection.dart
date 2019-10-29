import 'package:flutter/foundation.dart';
import 'package:shopping_list/models/Product.dart';

class ProductCollection extends ChangeNotifier {
  final List<Product> _products = [
    Product('Eggs', false),
    Product('Milk', false),
    Product('Bread', false),
    Product('Honey', false),
  ];

  get count {
    return _products.length;
  }

  get allProducts => _products;

  void addProduct(Product product) {
    _products.add(product);

    notifyListeners();
  }
}
