
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TimeZone(),
    );
  }
}

class TimeZoneState extends State<TimeZone> {
  final _countries = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Zones'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildCountriesList(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
          );
          final List<Widget> divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Details page'),
            ),
            body: ListView(children: divided)
          );
        }
      )
      
    );
  }

  Widget _buildCountriesList () {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2 */
        final index = i ~/ 2; /*3 */
        if (index >= _countries.length) {
          _countries.addAll(generateWordPairs().take(10)); /*4 */
        }
        return _buildRow(_countries[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
  final bool alreadySaved = _saved.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
    trailing: Icon(
      alreadySaved ? Icons.arrow_forward : Icons.arrow_forward_ios,
      color: alreadySaved ? Colors.grey: null,
    ),
    onTap: () {
      setState(() {
        if (alreadySaved) {
          _saved.remove(pair);
        } else {
          _saved.add(pair);
        }
      });
    },
  );
  }
}
//main class
class TimeZone extends StatefulWidget {
  @override
  TimeZoneState createState() => TimeZoneState();
}