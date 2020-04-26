import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Time Demo"),
          centerTitle: true,
        ),
        body: Text('You are on the details page'),
      ),
    );
  }
  
}