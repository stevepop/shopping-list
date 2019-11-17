import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';
import 'package:shopping_list/sceens/product_items.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Family Shopping List';
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: title,
      home: _buildHomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => generetaRoute(
              context: context,
              name: settings.name,
              arguments: settings.arguments),
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildHomeScreen() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => ProductCollection(),
        ),
        ChangeNotifierProvider(
          builder: (_) => ShoppingItemCollection(),
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Products'),
          ),
          body: Container(child: ProductItems())),
    );
  }
}
