import 'package:flutter/material.dart';
import 'package:bikerent/Store/BikeStore/components/body.dart';

class BikeStoreScreen extends StatelessWidget {
  static String id = "Bike Store";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
