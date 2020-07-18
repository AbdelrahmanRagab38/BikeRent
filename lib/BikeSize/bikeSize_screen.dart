import 'package:bikerent/BikeSize/components/body.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:flutter/material.dart';

class BikeSizeScreen extends StatelessWidget {
  final Place place;
  final Bike bike;
  final List<Place> places;
  BikeSizeScreen({this.place, this.bike, this.places});
  static String id = "BikeSize";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(place: place, bike: bike, places: places),
    );
  }
}
