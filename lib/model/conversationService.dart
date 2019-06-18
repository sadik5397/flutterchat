import 'package:firebase_database/firebase_database.dart';

class ConversationService {
  String nodeName = "conversations";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  final Map conversationModel;

  ConversationService(this.conversationModel);

  addConversation() {
    //db reference to post
    _databaseReference = database.reference().child(nodeName);
    _databaseReference.push().set(conversationModel);
  }
}