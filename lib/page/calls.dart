import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterchat/model/fireChatModel.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  String nodeName = "chats";
  List<ChatModel> chatList = <ChatModel>[];

  @override
  // ignore: must_call_super
  void initState() {
    database.reference().child(nodeName).onChildAdded.listen(childAdded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
        query: database.reference().child(nodeName),
        itemBuilder:
            (_, DataSnapshot snap, Animation<double> animation, int index) {

          return Column(
            children: <Widget>[
              Text(chatList[index].name),
              Text(chatList[index].message),
              Text(
                timeAgo.format(DateTime.fromMillisecondsSinceEpoch(int.parse(chatList[index].time)), locale: 'en_short'),
              ),
              Text(chatList[index].avatar),
              Text(chatList[index].unread),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  void childAdded(Event event) {
    setState(() {
      chatList.add(ChatModel.fromSnapshot(event.snapshot));
    });
  }
}
