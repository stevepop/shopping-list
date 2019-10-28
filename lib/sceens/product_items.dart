import 'package:flutter/material.dart';
import 'package:shopping_list/components/product_list.dart';
import '../models/product.dart';

class ProductItems extends StatefulWidget {
  ProductItems();

  @override
  State<StatefulWidget> createState() => ProductItemState();
}

class ProductItemState extends State<ProductItems> {
  final List<Product> _items = Product.all;

  Product shoppingItem;

  addProductItem(Product product) {
    setState(() {
      _items.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Column(
          children: <Widget>[
            ProductList(_items),
            Divider(
              height: 1.0,
            ),
            // TextInput(items: _items, addProductItem: addProductItem)
          ],
        ));
  }
}
