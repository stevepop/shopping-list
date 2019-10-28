import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: _buildMenu(context),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Products'),
          onTap: () => _navigate(context, '/products'),
        ),
        ListTile(
          title: Text('Shopping List'),
          onTap: () => _navigate(context, '/shopping'),
        ),
      ],
    );
  }

  void _navigate(context, String name) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(name);
  }
}
