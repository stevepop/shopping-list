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
    var doc = {'name': product.name, 'is_selected': false};
    _api.addDocument(doc);
  }

  void selectProduct(Product product, String id) {
    product.isSelected = !product.isSelected;
    _api.updateDocument(product.toJson(), id);
  }
}
