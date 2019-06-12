import 'package:flutter/material.dart';
import 'package:flutterchat/model/chatModel.dart';
import 'package:flutterchat/component/textStyle.dart';
import 'package:flutterchat/page/conversation.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Conversation(name: dummyData[index].name, image: dummyData[index].avatar, index: index,);
                    },
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: NetworkImage(dummyData[index].avatar),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        dummyData[index].name,
                        style: chatTitle,
                      ),
                    ),
                    Text(dummyData[index].time,
                        style: ((dummyData[index].unread) == 0)
                            ? chatTimeOld
                            : chatTimeNew),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child:
                            Text(dummyData[index].message, style: chatSubTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Opacity(
                          opacity: ((dummyData[index].unread) == 0) ? 0 : 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            radius: 10,
                            child: Text(
                              dummyData[index].unread.toString(),
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
      },
    );
  }
}
