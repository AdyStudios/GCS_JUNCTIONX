import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/message.dart';

class ChatService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async{
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentuserEamil = _firebaseAuth.currentUser!.email.toString();
    final String currentUsername = _firebaseAuth.currentUser!.displayName.toString(); //TODO: EZ legyen displasName helyett username!
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentuserEamil,
      senderUsername: currentUsername,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_"); //<------how I'm feeling rn 
    await _fireStore.collection("chat_rooms").doc(chatRoomId).collection('messages').add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore.collection("chat_rooms").doc(chatRoomId).collection('messages').orderBy('timestamp', descending: false).snapshots();
  }
}