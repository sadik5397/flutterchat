import 'package:firebase_database/firebase_database.dart';

class ConversationModel {
  static const KEY = "key";
  static const FROM = "from";
  static const TO = "to";
  static const TIME = "time";
  static const THREAD = "thread";

  String key;
  String from;
  String to;
  String time;
  String thread;

  ConversationModel({this.from, this.to, this.time, this.thread});

  ConversationModel.fromSnapshot(DataSnapshot snap)
      : this.key = snap.key,
        this.from = snap.value[FROM],
        this.to = snap.value[TO],
        this.time = snap.value[TIME],
        this.thread = snap.value[THREAD];

  Map toMap() {
    return {FROM: from, TO: to, TIME: time, THREAD: thread};
  }
}