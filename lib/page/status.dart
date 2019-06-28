import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}
class _StatusState extends State<Status> with TickerProviderStateMixin {
  Color color;
  double size;
  Alignment align = Alignment.centerLeft;
  Color newColor = Colors.red;
  double newSize = 100.0;
  Color initColor = Colors.black;
  double initSize = 200.0;
  Alignment initAlign = Alignment.centerLeft;
  Alignment newAlign = Alignment.centerRight;

  @override
  // ignore: must_call_super
  void initState() {
    color = initColor;
    size = initSize;
    align = initAlign;
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Icon(
          Icons.print,
          color: color, //black
//          size: size,
        ),
        RaisedButton(
          child: Text("Amare Jata Maro"),
          onPressed: pressed,
          color: color,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(4),
          height: 80,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 3.0,
              color: Colors.teal,
            ),
          ),
          child: InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 33.5,
            ),
            onTap: pressed,
          ),
          alignment: align,
        )
      ],
    );
  }

  void pressed() {
    setState(
      () {
        if (size != newSize) {
          color = newColor; //red
          size = newSize; //100
          align = newAlign;
        } else {
          color = initColor;
          size = initSize;
          align = initAlign;
        }
      },
    );
  }
}
