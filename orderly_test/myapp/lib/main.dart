
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
 HomepageState createState() => new HomepageState();
}

//Class to hold our data from the http response
class CountryList {
  final String name;
  CountryList({this.name});

  factory CountryList.fromJson(Map<String, dynamic> json) {
    return CountryList(
      name: json['name']
    );
  }
}

class HomepageState extends State<Homepage> {
  //Fetch the data
  Future<CountryList> countrylist;
  @override
  void initState() {
    super.initState();
    countrylist = fetchAlbum();
  }
//Make a network request
Future<CountryList> fetchAlbum() async {
  final response = await http.get('http://worldtimeapi.org/api/timezone"');
  if (response.statusCode == 200) {
    return CountryList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load list');
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<CountryList>(
  future: countrylist,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data.name);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
  },
),
        ),
      )
    );
  }
}

