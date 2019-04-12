import 'package:flutter/material.dart';

import 'string.dart';
// http请求
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        "${_members[i]["login"]}",
        style:_biggerFont,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[i]["avatar_url"]),
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
        itemCount: _members.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if(position.isOdd) return new Divider();
          final index =position ~/ 2;

          return _buildRow(index);
        },
      ),
    );
  }
}

class RondomWords extends StatefulWidget {
  @override
  _RondomWordsState createState() => _RondomWordsState();
}


class Member {
  final String login;

  Member(this.login) {
    if(login == null) {
      throw new ArgumentError(
        "login of Member connot be null."
        "Received: $login"
      );
    }
  }
}