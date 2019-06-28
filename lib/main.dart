import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/login.dart';

Future<Null> main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutterChat',
      theme: new ThemeData(
        primaryColor: Colors.teal.shade700,
        accentColor: Colors.teal.shade200,
      ), // ThemeData
//      home: FlutterChat(),
      home: Login(),
    ); //MaterialApp
  }
}
