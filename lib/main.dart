import 'package:flutter/material.dart';
import 'page/home.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat',
      theme: new ThemeData(
        primaryColor: Colors.teal.shade700,
        accentColor: Colors.teal.shade200,
      ), // ThemeData
      home: FlutterChat(cameras),
    ); //MaterialApp
  }
}
