import 'package:flutter/material.dart';
import 'package:shopping_list/components/shipping_list.dart';
import 'package:shopping_list/models/shopping.dart';

class ShoppingItems extends StatefulWidget {
  ShoppingItems();

  @override
  State<StatefulWidget> createState() => ShoppingItemState();
}

class ShoppingItemState extends State<ShoppingItems> {
  final List<Shopping> _items = Shopping.all;

  Shopping shoppingItem;

  addProductItem(Shopping shopping) {
    setState(() {
      _items.add(shopping);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Items'),
      ),
      body: Column(
        children: <Widget>[
          ShoppingList(_items),
        ],
      ),
    );
  }
}
