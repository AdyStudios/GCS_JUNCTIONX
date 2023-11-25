import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var verificationId = ''; //TODO: ide kell valami obs dolog!?

  Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'username': userCredential.user!.displayName,
    }, SetOptions(merge: true));

      return userCredential;
    }   
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async{
    return await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signUpWithEmailandPassword(String email, String username, password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'username': username
    });

      return userCredential;
    }
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  Future<void> phoneAuthentication(String phoneNumber) async{
   await _firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: (credentials) async {
    await _firebaseAuth.signInWithCredential(credentials);
   }, 
    codeSent: (verificationId, resendToken){
      this.verificationId = verificationId;
    }, codeAutoRetrievalTimeout: (verificationId) {
      this.verificationId = verificationId;
    }, verificationFailed: (e){
      if(e.code == 'invalid-phone-number'){
        throw Exception('The provided phone number is not valid.');
      }
    },);
  }

  Future<bool> verifyOTP(String otp) async{
    final AuthCredential l_credential = PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otp);
   var cred = await _firebaseAuth.signInWithCredential(l_credential);
   return cred.user != null ? true : false;
  }
}