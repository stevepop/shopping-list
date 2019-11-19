import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.red,
        child: Text("this is bottom"),
      ),
    );
  }
}
