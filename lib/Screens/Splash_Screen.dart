import 'dart:async';

import 'package:bikerent/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushNamed(context, WelcomeScreen.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image.asset(
                "assets/images/Bikee.png",
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.contain,
              ),
            ),

            Center(

            child: const Text.rich(
              TextSpan(
                text: 'Bike',
                style: TextStyle(fontSize: 28, color: Colors.grey),// default text style
                children: <TextSpan>[
                  TextSpan(text: ' Rent ', style: TextStyle( fontSize: 28, color: Colors.grey, fontStyle: FontStyle.italic)),
                ],

              )

            )

            ),
            Container(height: 20, width: 20,),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.46),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ]),
    );
  }
}
