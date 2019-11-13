import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/sceens/product_items.dart';
import 'package:shopping_list/sceens/sign_in.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/widgets/loading_circle.dart';

class LandingPage extends StatelessWidget {
  final title = 'Family Shopping List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FutureBuilder<FirebaseUser>(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              print("error");
              return Text(snapshot.error.toString());
            }
            // redirect to the proper page, pass the user into the
            // `HomePage` so we can display the user email in welcome msg
            return snapshot.hasData ? ProductItems() : SignInPage(title: title);
          } else {
            // show loading indicator
            return LoadingCircle();
          }
        },
      ),
    );
  }
}
