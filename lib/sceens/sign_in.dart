import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Family Shopping",
                  style: Styles.headerLarge,
                ),
                Container(height: 15.0),
                _buildAppLogo(),
                Container(height: 25.0),
                _buildTextFields(),
                Container(height: 25.0),
                _buildLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAppLogo() {
    return SizedBox(
      height: 120.0,
      child: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
      ),
    );
  }

  _buildTextFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          obscureText: false,
          onSaved: (value) => _email = value,
          keyboardType: TextInputType.emailAddress,
          style: Styles.textDefault,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        Container(
          height: 15.0,
        ),
        TextFormField(
          onSaved: (value) => _password = value,
          obscureText: true,
          style: Styles.textDefault,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        )
      ],
    );
  }

  _buildLoginButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          final form = _formKey.currentState;
          if (form == null) {
            print(_formKey);
          } else {
            form.save();
            if (form.validate()) {
              try {
                AuthResult result = await Provider.of<AuthService>(context)
                    .loginUser(email: _email, password: _password);
                print(result);
                Navigator.of(context).pushNamed('/');
              } on AuthException catch (error) {
                return _buildErrorDialog(context, error.message);
              } on Exception catch (error) {
                return _buildErrorDialog(context, error.toString());
              }
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: Styles.textDefault
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
