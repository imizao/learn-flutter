import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Container(
            child: new Center(
              child: buildRow(),
            ),
            height: 50.0,
            color: Colors.grey.shade500,
            alignment: Alignment.center),
      ),
    );
  }
  // 抽取组件
  Widget buildRow() {
    return new Row(
      children: <Widget>[
        buildExpanded(Icons.call, Colors.blue.shade500, 'CALL'),
        buildExpanded(Icons.near_me, Colors.blue.shade500, 'ROUTE'),
        buildExpanded(Icons.share, Colors.blue.shade500, 'SHARE'),
      ],
    );
  }
  // 组件封装
  Widget buildExpanded(IconData icon,Color color,String text) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(icon,color: color),
          new Container(
            child: Text(text),
          )
        ],
      ),
    );
  }
}
