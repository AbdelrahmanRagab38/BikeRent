import 'package:bikerent/Barking/components/body.dart';
import 'package:bikerent/Models/place.dart';
import 'package:flutter/material.dart';

class BarkingScreen extends StatelessWidget {
  final Place place;
  BarkingScreen({this.place});
  static String id = "Barking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(place: place),
    );
  }
}
