import 'package:flutter/material.dart';
import 'package:flutterchat/component/textStyle.dart';

AppBar appBar(String title) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.print),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.insert_comment),
        onPressed: () {},
      ),
    ],
  );
}

AppBar homeAppBar(String title, TabController homeTabController, double width) {
  double height = 46.0;
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
    bottom: new TabBar(
      controller: homeTabController,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      tabs: <Widget>[
        Container(
          width: width * .1 * .6,
          height: height,
          alignment: Alignment.center,
          child: Icon(
            Icons.camera_alt,
          ),
        ),
        Container(
            width: width * .3 * .65,
            height: height,
            alignment: Alignment.center,
            child: Text("CHATS")),
        Container(
            width: width * .3 * .65,
            height: height,
            alignment: Alignment.center,
            child: Text("STATUS")),
        Container(
            width: width * .3 * .65,
            height: height,
            alignment: Alignment.center,
            child: Text("CALLS"))
      ],
    ),
  );
}

AppBar chatAppBar(String title, String image, String onlineMin) {
  return AppBar(
    title: Row(
      children: <Widget>[
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: chatAppBarTitle,
            ),
            Text(
              (onlineMin == "0") ? "Just Now" : "Online $onlineMin minutes ago",
              style: chatAppBarSubTitle,
            ),
          ],
        )
      ],
    ),
    titleSpacing: 0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.videocam),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.phone),
        onPressed: () {},
      ),
    ],
  );
}
