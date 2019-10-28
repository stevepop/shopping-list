import 'package:flutter/widgets.dart';
import 'package:shopping_list/sceens/home.dart';
import 'package:shopping_list/sceens/product_items.dart';
import 'package:shopping_list/sceens/shopping_items.dart';

generetaRoute({BuildContext context, String name, Object arguments}) {
  switch (name) {
    case '/':
      return HomeScreen();
      break;
    case '/products':
      return ProductItems();
      break;
    case '/shopping':
      return ShoppingItems();
      break;
  }
}
