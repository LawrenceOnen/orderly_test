import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Time Demo"),
          centerTitle: true,
        ),
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _zonalListView(context);
      }
    
      Widget _zonalListView(BuildContext context) {
        return ListView(
          children:[
            ListTile(
              title: Text('SOME DATA'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('SOME DATA 2'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('SOME DATA 3'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        );
      }
}