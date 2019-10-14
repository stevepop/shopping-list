import 'package:flutter/material.dart';
import 'models/shopping_item.dart';

class Shopping extends StatefulWidget {
  Shopping();

  @override
  State<StatefulWidget> createState() => ShoppingState();
}

class ShoppingState extends State<Shopping> {
  final List<ShoppingItem> _items = [
    ShoppingItem('Eggs', false),
    ShoppingItem('Milk', false),
    ShoppingItem('Bread', false),
  ];

  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  ShoppingItem shoppingItem;

  void _handleSubmitted(String text) {
    _textController.clear();

    setState(() {
      _isComposing = false;
    });

    setState(() {
      if (text.length > 0) {
        _items.add(ShoppingItem(text, false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Card(
                child: ShoppingItemList(_items[index]),
              );
            },
            itemCount: _items.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(hintText: "Add Item"),
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ShoppingItemList extends StatefulWidget {
  final ShoppingItem shoppingItem;

  ShoppingItemList(ShoppingItem shoppingItem)
      : shoppingItem = shoppingItem,
        super(key: ObjectKey(shoppingItem));

  @override
  State<StatefulWidget> createState() => ShoppingItemState(shoppingItem);
}

class ShoppingItemState extends State<ShoppingItemList> {
  final ShoppingItem shoppingItem;

  ShoppingItemState(this.shoppingItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
      children: <Widget>[
        new Expanded(
            child: new Text(shoppingItem.name,
                style: shoppingItem.isChecked
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : TextStyle(decoration: TextDecoration.none))),
        new Checkbox(
            value: shoppingItem.isChecked,
            onChanged: (bool value) {
              setState(() {
                shoppingItem.isChecked = value;
              });
            })
      ],
    ));
  }
}
