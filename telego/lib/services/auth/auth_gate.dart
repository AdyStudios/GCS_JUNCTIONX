import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telego/pages/chat/chat_home_page.dart';
import 'package:telego/services/auth/login_or_reg.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const ChatHomePage();
          }
          else{
            return const LoginOrRegister();
          }
      })
    );
  }
}