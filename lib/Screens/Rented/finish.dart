import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:bikerent/Store/StoreCash/storeCash_screen.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/material.dart';

class FinishRent extends StatelessWidget {
  final Bike bike;
  final Place destination;
  int rentedTime ;
  FinishRent({this.bike, this.destination ,this.rentedTime});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: 180,
            child: Column(
              children: <Widget>[
                Text("Your destination :"+ destination.name  , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: kPrimaryColor) ,),
                SizedBox(height: 5,),
                RoundedButton(
                  text: "Finish",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoreCashScreen(rentedTime: rentedTime,)));
                    Database().finishRide(bike, destination);
                    //Navigator.pop(context);
                //    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
