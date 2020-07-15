import 'package:cloud_firestore/cloud_firestore.dart';

class Bike {
  final String id;
  final String size;
  final String placeId;
  final List<DocumentSnapshot> rides;
  final String state;

  Bike({this.size, this.state, this.id, this.placeId, this.rides});

  factory Bike.fromDoc(DocumentSnapshot doc,List<DocumentSnapshot> rides) {
    return Bike(
        size: doc['size'],
        id: doc.documentID,
        placeId: doc['placeId'],
        state: doc['state'],
        rides:rides
    );
  }

  Map toMap() {
    return {'size':this.size,'placeId':this.placeId,'rides':rides,'state':state};
  }
}
