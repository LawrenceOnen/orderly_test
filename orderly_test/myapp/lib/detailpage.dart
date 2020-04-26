import 'package:flutter/material.dart';

//import './homepage.dart';

class Detailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Time Demo"), // TODO: Create a constructor for Homepage to pass in the data
          centerTitle: true,
          actions: <Widget>[
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
        body: Text('You are on the details page'),
      ),
    );
  }
}
