import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/place.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {
  final Place place;

  Body({this.place});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final firestoreInstance = Firestore.instance;

  String message = 'Park here';

  String buttonText = 'confirm';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              widget.place.name,
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),

            SizedBox(height: size.height * 0.1),

            Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Container(
                  color: kPrimaryLightColor,
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 20, color: kPrimaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            //SizedBox(height: size.height * 0.03),

            RoundedButton(
                text: buttonText,
                press:  ()  async{
                  if (message == 'Park here') {

                    var firebaseUser = await FirebaseAuth.instance.currentUser();
                    String username = "";
                    String Nat  = "";
                    int seat ;


                  await  firestoreInstance.collection("users").document(firebaseUser.uid).get().then((value) async {
                      username = value['username'];
                      Nat = value ["nationalID"];
                      print(username);
                     seat= await Database().park(widget.place , username , Nat);

                    });


//                    DocumentSnapshot placeDoc =
//                    await firestoreInstance.collection("places").document(widget.place.id).get();
//                    int seats = placeDoc['availableSeats'] ;
//
//                    message = '$username + You parked at $seats';



                    setState(() {
                      message = 'Hello mr, $username Your Parked seat is $seat';
                      buttonText = 'finish';
                    });
                  } else {
                 //   await firestoreInstance.collection("Barking requests").document(bike.id).delete();

                    var firebaseUser = await FirebaseAuth.instance.currentUser();
                    String username = "";
                    String Nat  = "";


                    firestoreInstance.collection("users").document(firebaseUser.uid).get().then((value){
                      username = value['username'];
                      Nat = value ["nationalID"];
                      print(username);
                      print(Nat);
                      Database().finishParking(widget.place,username ,Nat);

                    });




                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
