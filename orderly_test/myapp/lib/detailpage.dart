import 'package:flutter/material.dart';

//import './homepage.dart';

class Detailpage extends StatelessWidget {
  final String countries;
  Detailpage({this.countries});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Time Demo"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            countries,
            style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }
}
