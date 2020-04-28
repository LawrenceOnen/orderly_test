import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import './detailpage.dart';

//Stateful class to instantiate a dynamic widget
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime localtime = new DateTime.now();
  Future<Timezones> dataList;

  @override
  void initState() {
    super.initState();
    dataList = fectTimezone();
  }
  Future<Timezones> fectTimezone() async {
  final response = await http.get('http://worldtimeapi.org/api/timezone');
  if(response.statusCode == 200)
  {
    return Timezones.fromJson(json.decode(response.body));
  } else {
    throw Exception('failed to load data');
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Timezones>(
            future: dataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else {
                return Text("${snapshot.error}");
              }
            }
            )
        ),),
    );
  }
}
class Timezones {
  final String title;

  Timezones({this.title});

  factory Timezones.fromJson(Map<String, dynamic> json) {
    return Timezones();
  }
}