import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List items;

  ProductList(this.items);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Card(
            child: _buildListItems(items[index]),
          );
        },
        itemCount: items.length,
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
