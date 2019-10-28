import 'package:flutter/material.dart';
import '../models/product.dart';

class TextInput extends StatefulWidget {
  final List<Product> items;
  final Function addProductItem;

  TextInput({this.items, this.addProductItem});

  @override
  State<StatefulWidget> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  bool _isComposing = false;
  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();

    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  ? () => widget
                      .addProductItem(Product(_textController.text, false))
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
