import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<AuthResult> signIn(String email, String password);

  Future<AuthResult> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}


class Auth implements BaseAuth {

 /* User _userFromFirebaseUser(FirebaseUser user){
   // return user!=null? User(user.uid)
  }*/


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 // static final _firestore = Firestore.instance;


  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<AuthResult> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);


   // FirebaseUser user = result.user;
    return result;
  }



  Future<AuthResult> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    //FirebaseUser user = result.user;
    return result;
  }



  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}