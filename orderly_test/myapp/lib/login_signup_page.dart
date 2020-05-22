import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
      title: new Text("SSO demo"),
    ),
    body: Stack(
      children: <Widget>[
        showform(),
        showCircularProgress(),
              ],
            ),
            );
          }
        //Show Circular Progress widget
        Widget showCircularProgress() {
          bool _isloading = true;
          //check if is loading
          if (_isloading) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Container(
            height: 0.0,
            width: 0.0
          );
        }

        //Show Logo
        Widget showLogo() {
          return new Hero(
            tag: "Hero",
             child: Padding(
               padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
               child: CircleAvatar(
                 backgroundColor: Colors.transparent,
                 radius: 48.0,
                 child: Image.asset('assets/flutter-icon.png')
               ),
               ),
             );
        }

}
