import 'package:bikerent/Models/bike.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id;
  final String name;
  final int numOfBikes;
  final int availableSeats;
  final List<Bike> bikes;
  final LatLng position;

  Place(
      {this.id,
      this.position,
      this.name,
      this.availableSeats,
      this.bikes,
      this.numOfBikes});

  factory Place.fromDoc(DocumentSnapshot doc, List<Bike> bikes) {
    return Place(
        name: doc['name'],
        id: doc.documentID.toString(),
        numOfBikes: doc['numOfBikes'],
        availableSeats: doc['availableSeats'],
        bikes: bikes,
        position: LatLng(double.parse(doc['position'][0].toString()),
            double.parse(doc['position'][1].toString())));
  }
}
