import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/widgets/product_list.dart';
import 'package:shopping_list/widgets/text_input.dart';
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
    return ChangeNotifierProvider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        ),
      ),
      builder: (context) => ProductCollection(),
    );
  }
}
