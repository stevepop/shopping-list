import 'package:flutter/foundation.dart';
import 'package:shopping_list/models/ShoppingItem.dart';

class ShoppingItemCollection extends ChangeNotifier {
  final List<ShoppingItem> _items = [];

  get allItems => _items;
}
