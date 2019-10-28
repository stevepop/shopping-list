import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  final List items;

  ShoppingList(this.items);

  @override
  ShoppingListState createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Card(
            child: _buildListItems(widget.items[index]),
          );
        },
        itemCount: widget.items.length,
      ),
    );
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
