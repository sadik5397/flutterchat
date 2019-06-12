import 'package:flutter/material.dart';
import 'package:flutterchat/component/textStyle.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Will be available in the next version", style: chatTitle),
    );
  }
}
