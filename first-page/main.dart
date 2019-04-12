import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'demo',
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Kandersteg, Switzerland',
                    style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41')
        ],
      ),
    );

    Column getText(IconData icon, String text) {
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.blue[500],),
          new Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              text,
              style:TextStyle(color: Colors.blue[500])
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getText(Icons.call, 'CALL'),
          getText(Icons.near_me, 'ROUTE'),
          getText(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap:true
      ),
    );

    return new MaterialApp(
      title: 'Flutter Layout',
      home: new Scaffold(
        appBar: AppBar(
          title:Text('Flutter Layout')
        ),
        body: ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit:BoxFit.cover
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}
