import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/component/textStyle.dart';
import 'package:flutterchat/page/conversation.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterchat/model/fireChatModel.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
//  String user = "Huwaei P30 Pro";
  String user = "PC Emulator";

  //  String anim = "Breathing";
  String anim = "Scaling";

  FirebaseDatabase database = FirebaseDatabase.instance;
  String nodeName = "chats";
  List<ChatModel> chatList = <ChatModel>[];
  BuildContext context;

  @override
  // ignore: must_call_super
  void initState() {
    database.reference().child(nodeName).onChildAdded.listen(childAdded);
  }

  void childAdded(Event event) {
    setState(() {
      chatList.add(ChatModel.fromSnapshot(event.snapshot));
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    this.context = context;
    return RefreshIndicator(
      onRefresh: () {
        database.reference().child(nodeName).onChildAdded.listen(childAdded);
      },
      child: FirebaseAnimatedList(
        query: database.reference().child(nodeName),
//        reverse: true,
        itemBuilder:
            (_, DataSnapshot snap, Animation<double> animation, int index) {
          print(chatList.length);
          if (chatList.length == 0) {
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
          } else {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Conversation(
                            name: chatList[index].name,
                            image: chatList[index].avatar,
                            index: index,
                            user: user,
                          );
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: NetworkImage(chatList[index].avatar),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            chatList[index].name,
                            style: chatTitle,
                          ),
                        ),
                        Text(
                            timeAgo.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(chatList[index].time)),
                                locale: 'en_short'),
                            // ignore: unrelated_type_equality_checks
                            style: ((chatList[index].unread) == "0")
                                ? chatTimeOld
                                : chatTimeNew),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(chatList[index].message,
                                style: chatSubTitle),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Opacity(
                              // ignore: unrelated_type_equality_checks
                              opacity:
                                  ((chatList[index].unread) == "0") ? 0 : 1,
                              child: CircleAvatar(
                                backgroundColor: Colors.teal,
                                radius: 10,
                                child: Text(
                                  chatList[index].unread,
                                  style: chatCounter,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 10,
                    indent: 64,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
