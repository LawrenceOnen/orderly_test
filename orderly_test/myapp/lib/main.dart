

//import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Homepage()
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage> {
  List<TimeDemoData> list = List();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timezone Demo"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
             onPressed: null
             )
        ],
      ),
      body: isLoading
        ? Center(
          child: _fetchData(),
        )
        : ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10.2),
              title: new Text(),
              trailing: Icon(
                Icons.arrow_forward
              ),
            );
          }
          )
    );
  }
//Method to fetch the service
_fetchData() async {
  setState(() {
    isLoading = true;
  });
  const String url = 'http://worldtimeapi.org/api/timezone';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    list = (json.decode(response.body) as List)
    .toList();
    setState(() {
      isLoading = false;
    });
  } else {
    throw Exception('Failed to load data');
  }
}//Fetch data

}

//Factory class to parse the Json data
class TimeDemoData {
  final String name;
TimeDemoData._({this.name});
factory TimeDemoData.fromJson(Map<String, dynamic> json) {
    return new TimeDemoData._(
      name: json['name']
    );
  }
}


class DetailsPage extends State<Homepage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubic,
    ).drive(Tween(begin: 0, end: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller
          ..reset()
          ..forward();
      },
      child: RotationTransition(
        turns: animation,
        child: Stack(
          children: [
            Positioned.fill(
              child: Icon(Icons.wb_incandescent),
            ),
            Center(
              child: Text(
                'Click me!',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}