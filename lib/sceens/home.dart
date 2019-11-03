import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/widgets/product_list.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';
import '../routes.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Family Shopping List';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ProductCollection()),
        ChangeNotifierProvider(builder: (context) => ShoppingItemCollection())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          drawer: AppDrawer(),
          body: Container(
            child: Container(
              child: ProductList(),
            ),
          ),
        ),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => generetaRoute(
                context: context,
                name: settings.name,
                arguments: settings.arguments),
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
