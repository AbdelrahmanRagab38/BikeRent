import 'package:flutter/material.dart';
import 'package:bikerent/Barking/components/body.dart';

class BarkingScreen extends StatelessWidget {
  static String id = "Barking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
