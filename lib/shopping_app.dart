import 'package:flutter/material.dart';
import './shopping.dart';

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Family Shopping List';

    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Shopping(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
