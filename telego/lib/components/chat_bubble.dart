import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telego/Variables.dart';


class ChatBubble extends StatelessWidget {
  final String message;
  final Map<String, dynamic> data;
  final FirebaseAuth locFirebaseAuth = FirebaseAuth.instance;
  
  ChatBubble({
    super.key, 
    required this.message, 
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (data['senderId'] == locFirebaseAuth.currentUser!.uid)
            ? primary_orange_color
            :kPrimaryColor,
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      )
    );
  }
}