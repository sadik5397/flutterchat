import 'package:flutter/material.dart';
import 'package:flutterchat/component/appBar.dart';
import 'package:flutterchat/model/conversationService.dart';
import 'package:flutterchat/model/fireConversationModel.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class Conversation extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final String user;

  Conversation({Key key, this.name, this.image, this.index, this.user})
      : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final GlobalKey<FormState> conversationKey = GlobalKey();

  ConversationModel conversationModel = ConversationModel();
  FirebaseDatabase database = FirebaseDatabase.instance;
  String nodeName = "conversations";
  List<ConversationModel> conversationList = <ConversationModel>[];
  BuildContext context;

  void insertConversationModel() {
    final FormState formState = conversationKey.currentState;
    if (formState.validate()) {
      formState.save();
      formState.reset();
      conversationModel.time = DateTime.now().millisecondsSinceEpoch.toString();
      conversationModel.to = "${widget.name}";
      conversationModel.from = "${widget.user}";
      ConversationService conversationService =
          ConversationService(conversationModel.toMap());
      conversationService.addConversation();
    }
  }

  void childAdded(Event event) {
    setState(() {
      conversationList.add(ConversationModel.fromSnapshot(event.snapshot));
    });
  }

  File image;

  Future getImage() async {
    File picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = picture;
    });
    conversationModel.thread = image.toString();
  }

  Future pickImage() async {
    File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = picture;
    });
    conversationModel.thread = image.toString();
  }

  @override
  // ignore: must_call_super
  void initState() {
    database.reference().child(nodeName).onChildAdded.listen(childAdded);
  }

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
              child: FirebaseAnimatedList(
                query: database.reference().child(nodeName),
                reverse: false,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index) {
                  print("Here is the response for ${widget.name}:\nArray Length is ${conversationList.length}\nfrom : ${widget.user} || to : ${widget.name}");
                  if(conversationList.length!=0)
                  {
                    if (conversationList[index].from == widget.user && conversationList[index].to == widget.name)
                    {
                      print("if printed");
                      return sendChat(conversationList[index].thread, "${timeAgo.format(DateTime.fromMillisecondsSinceEpoch(int.parse(conversationList[index].time),), locale: "en_short")}+ ${conversationList[index].to}");
                    }
                    else if (conversationList[index].from == widget.name && conversationList[index].to == widget.user)
                    {
                      print("elsif printed");
                      return receiveChat(conversationList[index].thread, "${timeAgo.format(DateTime.fromMillisecondsSinceEpoch(int.parse(conversationList[index].time),), locale: "en_short")}+ ${conversationList[index].to}");
                    }
                  }
                  else
                    {
                      print("else printed");
                    }
                },
              ),
            ),
          Container(
            color: Colors.grey.shade300,
            height: 68,
          ),
          Padding(
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
                          child: Form(
                            key: conversationKey,
                            child: TextFormField(
                              decoration: InputDecoration(
//                                  hintText: "Type A Message",
                                  hintText: "${widget.name},${widget.user}",
                                  border: InputBorder.none),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "আরে ভাই কিছু তো লিখবা আগে";
                                }
                              },
                              onSaved: (val) => conversationModel.thread = val,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
                          child: IconButton(
                            icon: Icon(
                              Icons.attachment,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: pickImage,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: getImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      insertConversationModel();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.send),
                      radius: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget receiveChat(String thread, String time) {
  return Row(
    children: <Widget>[
      Container(
        height: 64,
        width: thread.length * 10.ceilToDouble() + 70,
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
        width: thread.length * 10.ceilToDouble() + 70,
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
