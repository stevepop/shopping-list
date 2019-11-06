import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/models/Product.dart';
import 'package:shopping_list/models/ShoppingItem.dart';
import 'package:shopping_list/services/api.dart';

class ShoppingItemCollection extends ChangeNotifier {
  Api _api = Api('shopping_list');
  List<ShoppingItem> _items = [];

  Future<List<ShoppingItem>> fetchShoppingItems() async {
    var result = await _api.getDataCollection();
    _items = result.documents
        .map((doc) => ShoppingItem.fromMap(doc.data, doc.documentID))
        .toList();
    return _items;
  }

  Stream<QuerySnapshot> fetchShoppingItemAsStream() {
    return _api.streamDataCollection();
  }

  Future<ShoppingItem> getShoppingItemsById(String id) async {
    var doc = await _api.getDocumentById(id);
    return ShoppingItem.fromMap(doc.data, doc.documentID);
  }

  get allItems => _items;

  void addRemoveItem(Product product) async {
    var snapshot = await _api.getDocumentByProductId(product.id);

    if (snapshot.documents.isNotEmpty) {
      var id = snapshot.documents[0].documentID;
      var doc = snapshot.documents[0].data;

      ShoppingItem shoppingItem = ShoppingItem.fromMap(doc, id);

      _api.removeDocument(shoppingItem.id);
    } else {
      var doc = {
        'name': product.name,
        'product_id': product.id,
        'is_checked': false
      };
      _api.addDocument(doc);
    }
  }

  void toggleCheckItem(ShoppingItem shoppingItem) {
    shoppingItem.isChecked = !shoppingItem.isChecked;

    _api.updateDocument(shoppingItem.toJson(), shoppingItem.id);
  }
}
