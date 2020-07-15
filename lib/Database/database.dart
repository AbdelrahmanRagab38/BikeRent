import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseDatabase {
  Future<List<Place>> getPlaces();
  Future<bool> rentBike(Bike bike);
  Future<bool> park(Place place);
  Future<bool> bookMaintenance(Place place, String time);
  Future<Bike> getBike(String id);
  Future<bool> finishRide(Bike bike, Place place);
  Future<List<DocumentSnapshot>> getMaintenance(Place place);
  Future<bool> finishParking(Place place);
}

class Database implements BaseDatabase {
  final _firestore = Firestore.instance;

  @override
  Future<bool> bookMaintenance(Place place, String time) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await _firestore
        .collection('places')
        .document(place.id)
        .collection('maintenance')
        .add({"time": time, "user": user.uid});
    return true;
  }

  @override
  Future<List<DocumentSnapshot>> getMaintenance(Place place) async {
    QuerySnapshot maintenanceQuery = await _firestore
        .collection('places')
        .document(place.id)
        .collection('maintenance')
        .getDocuments();
    return maintenanceQuery.documents.toList();
  }

  @override
  Future<List<Place>> getPlaces() async {
    QuerySnapshot places = await _firestore.collection('places').getDocuments();
    List<Place> placesList;
    places.documents.forEach((place) async {
      QuerySnapshot bikes = await _firestore
          .collection('places')
          .document(place.documentID)
          .collection('bikes')
          .getDocuments();
      Place finalPlace = Place.fromDoc(place, bikes.documents.toList());
      placesList.add(finalPlace);
    });

    return placesList;
  }

  @override
  Future<bool> park(Place place) async {
    DocumentSnapshot placeDoc =
        await _firestore.collection("places").document(place.id).get();
    int seats = placeDoc['availableSeats'] - 1;
    await _firestore
        .collection("places")
        .document(place.id)
        .setData({'availableSeats': seats});
    return true;
  }

  @override
  Future<bool> rentBike(Bike bike) async {
    DocumentSnapshot place =
        await _firestore.collection('places').document(bike.placeId).get();
    int num = place['numOfBikes'] - 1;
    await _firestore
        .collection('places')
        .document(bike.placeId)
        .setData({'numOfBikes': num});
    await _firestore
        .collection('places')
        .document(bike.placeId)
        .collection('bikes')
        .document(bike.id)
        .delete();
    await _firestore
        .collection("rented")
        .document(bike.id)
        .setData(bike.toMap());
    return true;
  }

  @override
  Future<Bike> getBike(String id) async {
    DocumentSnapshot bikeDoc =
        await _firestore.collection("bikes").document(id).get();
    QuerySnapshot ridesCollection = await _firestore
        .collection("bikes")
        .document(id)
        .collection('rides')
        .getDocuments();
    Bike bike = Bike.fromDoc(bikeDoc, ridesCollection.documents.toList());
    return bike;
  }

  @override
  Future<bool> finishRide(Bike bike, Place destination) async {
    DocumentSnapshot place =
        await _firestore.collection('places').document(destination.id).get();
    int num = place['numOfBikes'] + 1;
    await _firestore
        .collection('places')
        .document(destination.id)
        .setData({'numOfBikes': num});
    await _firestore
        .collection('places')
        .document(destination.id)
        .collection('bikes')
        .document(bike.id)
        .setData(bike.toMap());
    await _firestore.collection("rented").document(bike.id).delete();
    return true;
  }

  @override
  Future<bool> finishParking(Place place) async {
    DocumentSnapshot placeDoc =
        await _firestore.collection("places").document(place.id).get();
    int seats = placeDoc['availableSeats'] + 1;
    await _firestore
        .collection("places")
        .document(place.id)
        .setData({'availableSeats': seats});
    return true;
  }
}
