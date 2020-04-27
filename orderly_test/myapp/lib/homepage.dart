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
  List<String> timezones = new List();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: AppBar(
       ),
       body: ListView.builder(
         itemCount: timezones.length,
         itemBuilder: (BuildContext context, int index) {
           return ListTile(
                  title: Text(fetch()),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    //Do something
                  } 
                  );
         }
         ),
    );
  }

  fetch() async {
    final response = await http.get('http://worldtimeapi.org/api/timezone');
    if (response.statusCode == 200) {
      setState(() {
        timezones.add(json.decode(response.body)); 
      });
    } else {
      throw Exception('failed to load data');
    }
  }
 
  //Widget _zonalListView(BuildContext context) {
    
    // return ListView.builder(
    //   itemCount: europeanCountries.length,
    //   separatorBuilder: (BuildContext context, int index) => Divider(),
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //         title: Text(europeanCountries[index]),
    //         trailing: Icon(Icons.arrow_forward_ios),
    //         onTap: () {
    //           _navigateToNextScreen(context, europeanCountries[index]);
    //         } //=> print(europeanCountries[index]), // Pass this data to the next widget that handles the details
    //         );
    //   },
    // );
  //}

  // _navigateToNextScreen(BuildContext context, String europeanCountries) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Detailpage(countries: null,)),
  //   );
  // }
}

