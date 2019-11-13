import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/sceens/landing_screen.dart';
import 'package:shopping_list/services/auth.dart';

void main() => runApp(
      ChangeNotifierProvider<AuthService>(
        child: LandingPage(),
        builder: (BuildContext context) {
          return AuthService();
        },
      ),
    );
