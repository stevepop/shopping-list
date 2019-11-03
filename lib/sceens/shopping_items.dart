import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/shopping_list.dart';

class ShoppingItems extends StatefulWidget {
  ShoppingItems();

  @override
  State<StatefulWidget> createState() => ShoppingItemState();
}

class ShoppingItemState extends State<ShoppingItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Items'),
      ),
      body: Column(
        children: <Widget>[
          ShoppingList(),
        ],
      ),
    );
  }
}
