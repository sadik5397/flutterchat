import 'package:flutter/material.dart';
import '../component/appBar.dart';
import '../component/fab.dart';
import 'camera.dart';
import 'chats.dart';
import 'status.dart';
import 'calls.dart';

// ignore: must_be_immutable
class FlutterChat extends StatefulWidget {
  var cameras;

  FlutterChat(this.cameras);

  @override
  _FlutterChatState createState() => _FlutterChatState();
}

class _FlutterChatState extends State<FlutterChat>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
          "Flutter Chat", tabController, MediaQuery.of(context).size.width),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Camera(widget.cameras),
          Chats(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: fab,
    );
  }
}
