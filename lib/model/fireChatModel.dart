import 'package:firebase_database/firebase_database.dart';

class ChatModel {
  static const KEY = "key";
  static const NAME = "name";
  static const MESSAGE = "message";
  static const TIME = "time";
  static const AVATAR = "avatar";
  static const UNREAD = "unread";

  String key;
  String name;
  String message;
  String time;
  String avatar;
  String unread;

  ChatModel({this.name, this.message, this.time, this.avatar, this.unread});

  ChatModel.fromSnapshot(DataSnapshot snap)
      : this.key = snap.key,
        this.name = snap.value[NAME],
        this.message = snap.value[MESSAGE],
        this.time = snap.value[TIME],
        this.avatar = snap.value[AVATAR],
        this.unread = snap.value[UNREAD];

  Map toMap() {
    return {
      NAME: name,
      MESSAGE: message,
      TIME: time,
      AVATAR: avatar,
      UNREAD: unread
    };
  }
}