import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String nationalId;
  final String email;
  final List<DocumentSnapshot> rides;

  User({this.rides, this.username, this.email, this.nationalId});

  factory User.fromDoc(DocumentSnapshot doc, List<DocumentSnapshot> rides) {
    return User(
        username: doc['username'],
        nationalId: doc['nationalId'],
        email: doc['email'],
        rides: rides);
  }
}
