import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import './detailpage.dart';

//Stateful class to instantiate a dynamic widget
class Homepage extends StatefulWidget {
  final title;

  Homepage({Key key, this.title}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime localtime = new DateTime.now();

  Future<List<Timezones>> _fectTimezone() async {
    var data = await http.get("http://worldtimeapi.org/api/timezone");
    var jsonData = json.decode(data.body);
    //return jsonData;

    List<Timezones> zones = [];

    for (var i in jsonData) {
      Timezones countries = Timezones();
      zones.add(countries);
    }
    print(zones.length);

    return zones;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: widget.title,
      ),
      body: Container(
        child: FutureBuilder(
          future: _fectTimezone(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading.."),
                ),
              );
            } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  child: ListTile(
                    title: Text(snapshot.data[index]),
                  ),
                );
              }
              );
            }
          },
        ),
      ),
    );
  }
}

class Timezones {
  final String title;

  Timezones({this.title});
}
