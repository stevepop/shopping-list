import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/models/ShoppingItem.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingItemCollection>(builder: (context, items, child) {
      List<ShoppingItem> allItems;

      return Expanded(
        child: Container(
          child: StreamBuilder(
            stream: items.fetchShoppingItemAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                allItems = snapshot.data.documents
                    .map(
                        (doc) => ShoppingItem.fromMap(doc.data, doc.documentID))
                    .toList();

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return Card(
                      child: _buildListItems(allItems[index]),
                    );
                  },
                  itemCount: allItems.length,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      );
    });
  }

  Widget _buildListItems(shoppingItem) {
    return Consumer<ShoppingItemCollection>(builder: (context, items, child) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                shoppingItem.name,
                style: shoppingItem.isChecked
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : TextStyle(decoration: TextDecoration.none),
              ),
            ),
            Checkbox(
                value: shoppingItem.isChecked ? shoppingItem.isChecked : false,
                onChanged: (value) {
                  items.toggleCheckItem(shoppingItem);
                })
          ],
        ),
      );
    });
  }
}
