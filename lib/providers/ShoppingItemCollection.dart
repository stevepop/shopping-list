import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void addRemoveItem(String name) {
    var currentItem = _items.where((shoppingItem) => shoppingItem.name == name);

    if (currentItem.length == 0) {
      ShoppingItem item = ShoppingItem(name, false);
      _items.add(item);
    } else {
      var item = currentItem.first;
      _items.remove(item);
    }

    notifyListeners();
  }

  void toggleCheckItem(name) {
    var currentItem =
        _items.where((shoppingItem) => shoppingItem.name == name).first;
    currentItem.isChecked = !currentItem.isChecked;

    notifyListeners();
  }
}
