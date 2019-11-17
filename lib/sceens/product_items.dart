import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/widgets/product_list.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import '../models/product.dart';
import 'add_product.dart';

class ProductItems extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductItemState();
}

class ProductItemState extends State<ProductItems> {
  Product shoppingItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ProductList(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
      onPressed: () {
        var productCollection = Provider.of<ProductCollection>(context);
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) =>
                AddProduct(productCollection: productCollection),
          ),
        );
      },
    );
  }
}
