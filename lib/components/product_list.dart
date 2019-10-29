import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/ProductCollection.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCollection>(builder: (context, products, chiild) {
      var allProducts = products.allProducts;

      if (allProducts.length == 0) {
        return Container(
          child: Text("You have not added any products yet :("),
          padding: EdgeInsets.all(20),
        );
      }

      return Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Card(
                  child: _buildListItems(allProducts[index]),
                );
              },
              itemCount: allProducts.length,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildListItems(item) {
    return new ListTile(
      title: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(
              item.name,
              style: item.isChecked
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : TextStyle(decoration: TextDecoration.none),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
            onPressed: () {
              debugPrint('Add  ${item.name} to shopping');
            },
          )
        ],
      ),
    );
  }
}
