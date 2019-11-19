import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/ProductCollection.dart';
import 'package:shopping_list/providers/ShoppingItemCollection.dart';
import 'package:shopping_list/sceens/product_items.dart';
import 'package:shopping_list/sceens/shopping_items.dart';
import '../routes.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final title = 'Family Shopping List';
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.redAccent,
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
        body: [
          ProductItems(),
          ShoppingItems(),
        ].elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text('Products'), icon: Icon(Icons.list)),
            BottomNavigationBarItem(
                title: Text('Shopping'), icon: Icon(Icons.shopping_cart)),
          ],
          onTap: _onBarItemTap,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
