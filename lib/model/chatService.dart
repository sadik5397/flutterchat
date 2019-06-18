import 'package:firebase_database/firebase_database.dart';

class ChatService {
  String nodeName = "chats";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  final Map chatModel;

  ChatService(this.chatModel);

  addChat() {
    //db reference to post
    _databaseReference = database.reference().child(nodeName);
    _databaseReference.push().set(chatModel);
  }
}
