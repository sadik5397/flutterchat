import 'package:flutter/material.dart';
import 'package:flutterchat/page/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  final UserDetails detailsUser;

  Profile({Key key, @required this.detailsUser}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detailsUser.userName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              googleSignIn.signOut();
              print("${widget.detailsUser.userName} Signed Out. Yay!!");
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.detailsUser.photoUrl),
            ),
            Text("Name:" + widget.detailsUser.userName),
            Text("Email:" + widget.detailsUser.userEmail),
          ],
        ),
      ),
    );
  }
}
