import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'string.dart';

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
  // final appTitle = Strings.appTitle;
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return Divider();
        final index = i ~/ 2;
        
        if(index >=_suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style:_biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RondomWords extends StatefulWidget {
  @override
  _RondomWordsState createState() => _RondomWordsState();
}


