import 'package:flutter/foundation.dart';
import 'package:shopping_list/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/services/api.dart';

class ProductCollection extends ChangeNotifier {
  Api _api = Api('products');

  List<Product> _products = [];

  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection();
    _products = result.documents
        .map((doc) => Product.fromMap(doc.data, doc.documentID))
        .toList();
    return _products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Product.fromMap(doc.data, doc.documentID);
  }

  get count {
    return _products.length;
  }

  get allProducts => _products;

  void addProduct(Product product) {
    _products.add(product);

    notifyListeners();
  }

  void selectProduct(String name) {
    var currentProduct =
        _products.where((product) => product.name == name).first;

    currentProduct.isSelected = !currentProduct.isSelected;

    notifyListeners();
  }
}
