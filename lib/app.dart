import 'package:flutter/material.dart';

import 'home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Indo Headlines",
      theme: new ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.indigo,
        fontFamily: "Raleway"
      ),
      home: new Home(),
    );
  }
}