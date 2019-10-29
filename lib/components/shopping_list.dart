import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingItemCollection>(builder: (context, items, child) {
      var allItems = items.allItems;

      if (allItems.length == 0) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Your shopping list is empty',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      }

      return Expanded(
        child: Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Card(
                child: _buildListItems(allItems[index]),
              );
            },
            itemCount: allItems.length,
          ),
        ),
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
          Checkbox(
            value: item.isChecked ? item.isChecked : false,
            onChanged: (value) => item.isChecked = value,
          )
        ],
      ),
    );
  }
}
