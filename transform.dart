import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Transform矩形转换示例'),
      ),
      body: new Center(
        child: Container(
          color: Colors.grey,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.rotationZ(0.3),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Transform矩形转换'),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'Transform矩形转换示例',
      home: new LayoutDemo(),
    )
  );
}