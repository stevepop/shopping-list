import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/Product.dart';

import 'package:shopping_list/providers/ProductCollection.dart';

class TextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  bool _isComposing = false;
  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {
    Provider.of<ProductCollection>(context)
        .addProduct(Product(name: text, isSelected: false));
    _textController.clear();

    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCollection>(builder: (context, products, child) {
      return Container(
        padding: EdgeInsets.only(top: 5.0),
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
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration: InputDecoration.collapsed(hintText: "Add Item"),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: new Icon(
                    Icons.send,
                    color: Colors.red,
                  ),
                  onPressed: () => _isComposing
                      ? _handleSubmitted(_textController.text)
                      : null),
            )
          ],
        ),
      );
    });
  }
}
