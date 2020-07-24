import 'package:bikerent/admin/order.dart';
import 'package:bikerent/admin/toolcard.dart';
import 'package:bikerent/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bikerent/admin/order.dart';

import 'Barkedseat.dart';


class BarkingSeats extends StatelessWidget {
  static String id = "BarkingSeats";

  final firestoreInstance = Firestore.instance;

  Stream<QuerySnapshot> loadBarkingSeats() {
    return firestoreInstance.collection("Barking requests").snapshots();
  }

    @override
    Widget build(BuildContext context) {
      return  Scaffold(appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("All Parked Seats") ,
      ), body: Container(color: kPrimaryLightColor,

      child:StreamBuilder<QuerySnapshot>(
        stream: loadBarkingSeats(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator());
          }
          else {
            List<BarkedSeat> orders = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              print(doc.data);
              orders.add(BarkedSeat(
                  UserName:  data['userName'],
                  nationalId: data["natId"],
                  barkedSeat: data['seat'],
                StoreName: data['Store Name'],

              ));
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (context, index) {

                return VerticalUserCard(BarkedSeat: orders[index].barkedSeat,
                    Name: orders[index].UserName,
                    NationalId: orders[index].nationalId);

              },
            );
          }
        },
      ),


      )
      );





    }
  }


class VerticalUserCard extends StatelessWidget {

  final String Name;
  final String NationalId;
  final String BarkedSeat;
  final String StoreName;




  const VerticalUserCard({Key key, this.Name, this.NationalId,this.BarkedSeat, this.StoreName}) : super(key: key);

  // VerticalBookCard({this.imageUrl, this.title, this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),)
          borderRadius: BorderRadius.all(Radius.circular(30.0),)
      ),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.only(top: 5, ),
            child: ListTile(
              leading: Icon(Icons.add_circle),
              title: Text(
                "Seat number: " +BarkedSeat,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kPrimaryLightColor,
                ),
              ),

              subtitle: Column(
                children: [
                  Text(
               "Usernam:"+ Name,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Text(
                 "NationalId:"+   NationalId,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Text(
                    "StoreName:"+ StoreName,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),

                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}




