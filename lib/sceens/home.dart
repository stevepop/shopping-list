import 'package:flutter/material.dart';
import '../routes.dart';
import '../components/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Family Shopping List';

    return new MaterialApp(
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
            child: Text('Family Shopping List'),
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
    );
  }
}
