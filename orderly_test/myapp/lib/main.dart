import 'package:flutter/material.dart';

import 'login_signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSO Login demo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: LoginSignupPage(),
    );
  }
}