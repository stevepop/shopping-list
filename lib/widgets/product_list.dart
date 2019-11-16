import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/models/Product.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCollection>(
      builder: (context, products, chiild) {
        List<Product> allProducts;

        return Container(
          child: StreamBuilder(
              stream: products.fetchProductsAsStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  allProducts = snapshot.data.documents
                      .map((doc) => Product.fromMap(doc.data, doc.documentID))
                      .toList();
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        return Card(
                          child: _buildListItems(context, allProducts[index]),
                        );
                      },
                      itemCount: allProducts.length,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        );
      },
    );
  }

  Widget _buildListItems(context, product) {
    return ListTile(
      title: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(
              product.name,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: product.isSelected ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              _updateShoppingList(context, product);
            },
          )
        ],
      ),
    );
  }

  _updateShoppingList(context, product) {
    final items = Provider.of<ShoppingItemCollection>(context);
    final products = Provider.of<ProductCollection>(context);

    products.selectProduct(product, product.id);
    items.addRemoveItem(product);

    String message = product.isSelected
        ? 'Added item to shopping list'
        : 'Removed item from shopping list';

    _showSnackBar(context, message);
  }

  void _showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(msg),
      ),
    );
  }
}
