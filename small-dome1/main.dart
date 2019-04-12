import 'package:flutter/material.dart';

import 'string.dart';
import 'romdomwords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: Strings.appTitle,
      home:  new RondomWords(),  
    );
  }
}

