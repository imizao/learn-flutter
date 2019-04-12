import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'string.dart';
// http请求
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: Strings.appTitle,
      home:  RondomWords(),  
    );
  }
}

class _RondomWordsState extends State<RondomWords> {
  
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var _members = [];

  _loadData() async {
    String dataURL = 'https://api.github.com/orgs/raywenderlich/members';
    http.Response response = await http.get(dataURL);
    setState(() {
      _members = jsonDecode(response.body);
    });
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: Text(
        "${_members[i]["id"]}",
        style:_biggerFont,
      ),
    );
  }

  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int position) {
          return _buildRow(position);
        },
      ),
    );
  }
}

class RondomWords extends StatefulWidget {
  @override
  _RondomWordsState createState() => _RondomWordsState();
}


