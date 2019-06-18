import 'package:flutter/material.dart';
import 'package:flutterchat/model/chatService.dart';
import 'package:flutterchat/model/fireChatModel.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final GlobalKey<FormState> statusKey = GlobalKey();

  ChatModel chatModel = ChatModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(
          key: statusKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title Cant Be Empty";
                  }
                },
                onSaved: (val) => chatModel.name = val,
              ), //name
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Message",
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title Cant Be Empty";
                  }
                },
                onSaved: (val) => chatModel.message = val,
              ), //message
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Unread",
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title Cant Be Empty";
                  }
                },
                onSaved: (val) => chatModel.unread = val,
              ), //unread
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Avatar",
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title Cant Be Empty";
                  }
                },
                onSaved: (val) => chatModel.avatar = val,
              ), //avatar
            ],
          ),
        ),
        RaisedButton(
          color: Colors.teal,
          textColor: Colors.white,
          child: Text("SEND"),
          onPressed: () {
            insertChatModel();
          },
        )
      ],
    );
  }

  void insertChatModel() {
    final FormState formState = statusKey.currentState;
    if (formState.validate()) {
      formState.save();
      formState.reset();
      chatModel.time = DateTime.now().millisecondsSinceEpoch.toString();
      ChatService chatService = ChatService(chatModel.toMap());
      chatService.addChat();
    }
  }
}