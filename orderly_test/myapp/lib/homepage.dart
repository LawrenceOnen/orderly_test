import 'package:flutter/material.dart';

import './detailpage.dart';

//Stateful class to instantiate a dynamic widget
class Homepage extends StatefulWidget{
  @override
    _HomepageState createState() => _HomepageState();
  }

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return _zonalListView(context);
      }
    
      Widget _zonalListView(BuildContext context) {
        final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
        'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
        'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
        'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
        'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
        'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
        'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
        'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
        'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
        return ListView.separated(
              itemCount: europeanCountries.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(europeanCountries[index]),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(
                         builder: (context) => Detailpage()
                         ),
                       );
                  }//=> print(europeanCountries[index]), // Pass this data to the next widget that handles the details
                );
              },
            );
      }
}