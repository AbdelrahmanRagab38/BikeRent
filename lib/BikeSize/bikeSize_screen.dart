import 'package:flutter/material.dart';
import 'package:bikerent/BikeSize/components/body.dart';

class BikeSizeScreen extends StatelessWidget {
  static String id = "BikeSize";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
