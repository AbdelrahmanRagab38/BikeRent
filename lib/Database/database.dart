import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseDatabase {
  Future<List<Place>> getPlaces();
  Future<bool> rentBike(Bike bike , Place p1);
  Future<int> park(Place place , String userName , String natId);
  Future<bool> bookMaintenance(Place place, String time ,String requestedTool);
  Future<Bike> getBike(String id);
  Future<bool> finishRide(Bike bike, Place place);
  Future<List<DocumentSnapshot>> getMaintenance(Place place);
  Future<bool> finishParking(Place place , String userName, String Nat);
  Future<List<Bike>> getRentedBikes();
  Future<List<Bike>> getCommingBikes(String placeName);

}

class Database implements BaseDatabase {
  final _firestore = Firestore.instance;

  @override
  Future<bool> bookMaintenance(Place place, String time, String requstedTool) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await _firestore
        .collection('places')
        .document(place.id)
        .collection('maintenance')
        .add({"time": time, "user": user.uid , "request": requstedTool});
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
    List<Place> placesList = List<Place>();
    List<Bike> bikesList = List<Bike>();
    QuerySnapshot places = await _firestore.collection('places').getDocuments();

    await Future.forEach(places.documents, (place) async {
      QuerySnapshot bikes = await _firestore
          .collection('places')
          .document(place.documentID)
          .collection('bikes')
          .getDocuments();
      await Future.forEach(bikes.documents, (bike) async {
        QuerySnapshot rides = await _firestore
            .collection('places')
            .document(place.documentID)
            .collection('bikes')
            .document(bike.documentID)
            .collection('rides')
            .getDocuments();
        Bike finalBike = Bike.fromDoc(bike, rides.documents.toList());
        bikesList.add(finalBike);
      });
      Place finalPlace = Place.fromDoc(place, bikesList);
      placesList.add(finalPlace);
    });
    return placesList;
  }

  @override
  Future<int> park(Place place, String userName , String natId) async {
    DocumentSnapshot placeDoc =
    await _firestore.collection("places").document(place.id).get();
    int seats = placeDoc['availableSeats'] - 1;
    await _firestore
        .collection("places")
        .document(place.id)
        .updateData({'availableSeats': seats});

    _firestore.collection("Barking requests").document(natId).setData({
      "Store Name" : placeDoc["name"],
      "seat" : seats+1,
      "userName" : userName,
      "natId": natId,

    });


    /// user hot
    return seats+1;
  }

  @override
  Future<bool> rentBike(Bike bike , Place toPlace) async {
    DocumentSnapshot place =
    await _firestore.collection('places').document(bike.placeId).get();
    int num = place['numOfBikes'] - 1;
    await _firestore
        .collection('places')
        .document(bike.placeId)
        .updateData({'numOfBikes': num});
    await _firestore
        .collection('places')
        .document(bike.placeId)
        .collection('bikes')
        .document(bike.id)
        .delete();
    await _firestore
        .collection("rented")
        .document(bike.id)
        .setData({'size': bike.size, 'state': 'rented', "lastPlace":place["name"] , "to":toPlace.name });
    /*await _firestore
        .collection("routes")
        .add({'size': bike.size, 'state': 'rented', "from": place["name"] , "to": toPlace.name  , "bikeId": bike.id});*/

    await Future.forEach(bike.rides, (ride) async {
      await _firestore
          .collection("rented")
          .document(bike.id)
          .collection('rides')
          .document(ride.documentID)
          .setData({"user": ride['user']});
    });
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
        .updateData({'numOfBikes': num});
    await _firestore
        .collection('places')
        .document(destination.id)
        .collection('bikes')
        .document(bike.id)
        .setData(
        {'size': bike.size, 'state': 'free', "placeId": destination.id});
    await Future.forEach(bike.rides, (ride) async {
      await _firestore
          .collection("places")
          .document(destination.id)
          .collection('bikes')
          .document(bike.id)
          .collection('rides')
          .document(ride.documentID)
          .setData({"user": ride['user']});
    });
    await _firestore.collection("rented").document(bike.id).delete();
    return true;
  }

  @override
  Future<bool> finishParking(Place place, String userName, String Nat) async {

    DocumentSnapshot placeDoc = await _firestore.collection("places").document(place.id).get();
    int seats = placeDoc['availableSeats'] + 1;
    await _firestore
        .collection("places")
        .document(place.id)
        .updateData({'availableSeats': seats});
    await _firestore .collection("Barking requests").document(Nat).delete();


    return true;
  }

  @override
  Future<List<Bike>> getRentedBikes() async {
    List<Bike> bikes = List<Bike>();
    QuerySnapshot bikesDocs =
    await _firestore.collection('rented').getDocuments();
    await Future.forEach(bikesDocs.documents, (doc) {
      bikes.add(Bike.fromDoc(doc, null));
    });
    return bikes;
  }

  @override
  Future<List<Bike>> getCommingBikes(String stroeName) async {
    List<Bike> bikes = List<Bike>();
    QuerySnapshot comBikes= await _firestore.collection("rented").where("to" ,  isEqualTo: "Bike Rent 1").getDocuments();

    await Future.forEach(comBikes.documents , (value){
      Bike b = new Bike.fromDoc(value, null);
      bikes.add(b);
    }  );

    return bikes;
  }
}
