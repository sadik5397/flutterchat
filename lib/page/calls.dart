import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
//  String anim = "Breathing";
  String anim = "Scaling";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: FlareActor(
            "img/Flutter Shimmer.flr",
            animation: anim,
            color: Colors.grey.shade300,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            shouldClip: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: FlareActor(
            "img/Flutter Shimmer.flr",
            animation: anim,
            color: Colors.grey.shade300,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            shouldClip: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 388.0),
          child: FlareActor(
            "img/Flutter Shimmer.flr",
            animation: anim,
            color: Colors.grey.shade300,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            shouldClip: true,
          ),
        ),
      ],
    );
  }
}
