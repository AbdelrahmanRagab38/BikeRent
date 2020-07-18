import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:flutter/material.dart';

class FinishRent extends StatelessWidget {
  final Bike bike;
  final Place destination;
  FinishRent({this.bike, this.destination});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: 80,
            child: RoundedButton(
              text: "Finish",
              press: () {
                Database().finishRide(bike, destination);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
