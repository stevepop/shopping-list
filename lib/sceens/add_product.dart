import 'package:flutter/material.dart';
import 'package:shopping_list/models/Product.dart';

class AddProduct extends StatefulWidget {
  final productCollection;

  AddProduct({Key key, this.productCollection});

  @override
  State<AddProduct> createState() => AddProductState();
}

class AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Product name'),
                    validator: (value) =>
                        value.isEmpty ? 'Please enter product name' : null,
                    onSaved: (input) => _name = input,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: _submit,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Product product = Product();
      product.name = _name;
      product.isSelected = false;

      widget.productCollection.addProduct(product);

      Navigator.of(context).pop();
    }
  }
}
