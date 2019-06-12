import 'package:flutter/material.dart';
import 'package:flutterchat/component/textStyle.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Will be available in the next version", style: chatTitle),
    );
  }
}
