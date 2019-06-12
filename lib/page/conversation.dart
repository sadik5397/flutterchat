import 'package:flutter/material.dart';
import 'package:flutterchat/component/appBar.dart';

class Conversation extends StatefulWidget {
  final String name;
  final String image;
  final int index;

  Conversation({Key key, this.name, this.image, this.index}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(
          "${widget.name}", "${widget.image}", "${widget.index.toString()}"),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 68),
            child: ListView(
              children: <Widget>[
                receiveChat("Assalamu Alaikum", "09:01 PM"),
                sendChat("Walaikum Assalam", "09:01 PM"),
                receiveChat("Ki khobor Bro?", "09:01 PM"),
                sendChat("Valo Vai", "09:01 PM"),
                receiveChat("Valo, Khubbi Valo", "09:01 PM"),
                receiveChat("To Kisu Taka Hobe?", "09:01 PM"),
                receiveChat("Hello???", "09:01 PM"),
                receiveChat("Vai?????", "09:01 PM"),
                sendChat("Ammu Na Korse", "09:01 PM"),
                sendChat("Sorry :D", "09:01 PM"),
                receiveChat("Assalamu Alaikum", "09:01 PM"),
                sendChat("Walaikum Assalam", "09:01 PM"),
                receiveChat("Ki khobor Bro?", "09:01 PM"),
                sendChat("Valo Vai", "09:01 PM"),
                receiveChat("Valo, Khubbi Valo", "09:01 PM"),
                receiveChat("To Kisu Taka Hobe?", "09:01 PM"),
                receiveChat("Hello???", "09:01 PM"),
                receiveChat("Vai?????", "09:01 PM"),
                sendChat("Ammu Na Korse", "09:01 PM"),
                sendChat("Sorry :D", "09:01 PM"),
                receiveChat("Assalamu Alaikum", "09:01 PM"),
                sendChat("Walaikum Assalam", "09:01 PM"),
                receiveChat("Ki khobor Bro?", "09:01 PM"),
                sendChat("Valo Vai", "09:01 PM"),
                receiveChat("Valo, Khubbi Valo", "09:01 PM"),
                receiveChat("To Kisu Taka Hobe?", "09:01 PM"),
                receiveChat("Hello???", "09:01 PM"),
                receiveChat("Vai?????", "09:01 PM"),
                sendChat("Ammu Na Korse", "09:01 PM"),
                sendChat("Sorry :D", "09:01 PM"),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade300,
            height: 68,
          ),
          bottomTextField(),
        ],
      ),
    );
  }
}

Widget bottomTextField() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(0x00000000),
                      foregroundColor: Colors.grey.shade600,
                      child: Icon(Icons.tag_faces),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      "Type A Message",
                      textScaleFactor: 1.15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(0x00000000),
                      foregroundColor: Colors.grey.shade600,
                      child: Icon(Icons.attachment),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(0x00000000),
                      foregroundColor: Colors.grey.shade600,
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              child: Icon(Icons.mic),
              radius: 24,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget receiveChat(String thread, String time) {
  return Row(
    children: <Widget>[
      Container(
        height: 64,
        width: thread.length * 12.ceilToDouble(),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            boxShadow: [
              BoxShadow(spreadRadius: 0.5, color: Colors.black.withOpacity(0.1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(thread, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(time,
                    style: TextStyle(color: Colors.black38, fontSize: 12.0)),
                SizedBox(width: 5.0),
                Icon(Icons.done_all, size: 14.0, color: Colors.black38)
              ],
            )
          ],
        ),
      ),
      Expanded(
        child: SizedBox(),
      )
    ],
  );
}

Widget sendChat(String thread, String time) {
  return Row(
    children: <Widget>[
      Expanded(
        child: SizedBox(),
      ),
      Container(
        height: 64,
        width: thread.length * 12.ceilToDouble(),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFE2FEC9),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            boxShadow: [
              BoxShadow(spreadRadius: 0.5, color: Colors.black.withOpacity(0.1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(thread, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(time,
                    style: TextStyle(color: Colors.black38, fontSize: 12.0)),
                SizedBox(width: 5.0),
                Icon(Icons.done_all, size: 14.0, color: Colors.black38)
              ],
            )
          ],
        ),
      ),
    ],
  );
}
