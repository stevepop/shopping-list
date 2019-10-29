import 'package:flutter/material.dart';
import 'package:shopping_list/components/product_list.dart';
import 'package:shopping_list/components/text_input.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import '../models/product.dart';

class ProductItems extends StatefulWidget {
  ProductItems();

  @override
  State<StatefulWidget> createState() => ProductItemState();
}

class ProductItemState extends State<ProductItems> {
  final collection = ProductCollection();

  Product shoppingItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Column(
          children: <Widget>[
            ProductList(),
            Divider(
              height: 1.0,
            ),
            TextInput()
          ],
        ));
  }
}
