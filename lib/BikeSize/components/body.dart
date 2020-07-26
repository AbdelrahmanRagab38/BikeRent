import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/Models/place.dart';
import 'package:bikerent/Screens/Rented/finish.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/components/sRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {
  final Place place;
  final Bike bike;
  final List<Place> places;
  Body({this.place, this.bike, this.places});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String toTime = "To";
  Place toPlace;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BIKE SIZE",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            /*SvgPicture.asset(
              "assets/icons/bikee.svg",
              height: size.height * 0.30,
            ),*/
            Text(
              "Size: " + widget.bike.size,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "TIME",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SRoundedButton(
                        text: DateTime.now().hour.toString() +
                            ":" +
                            DateTime.now().minute.toString(),
                        press: () {}),
                    SRoundedButton(
                        text: toTime,
                        press: () async {
                          TimeOfDay selectedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                              useRootNavigator: true,
                              builder: (BuildContext context, Widget child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: false),
                                  child: child,
                                );
                              });
                          print(selectedTime.minute.toString());
                          setState(() {
                            toTime = selectedTime.hour.toString() +
                                ":" +
                                selectedTime.minute.toString();
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "PLACE",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SRoundedButton(text: widget.place.name, press: () {}),
                    SRoundedButton(
                        text: toPlace != null ? toPlace.name : "select place",
                        press: () {
                          print(widget.places[0].name);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Scaffold(
                                  body: ListView(
                                    children: widget.places.map((place) {
                                      return GestureDetector(
                                          onTap: () {
                                            if (place.name !=
                                                widget.place.name) {
                                              setState(() {
                                                toPlace = place;
                                              });
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              place.name,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 17),
                                            ),
                                          ));
                                    }).toList(),
                                  ),
                                );
                              });
                        }),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
                text: "RENT",
                press: () {
                  if (toPlace != null && toTime != "To") {
                    Database().rentBike(widget.bike , toPlace);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinishRent(
                                   rentedTime: DateTime.now().hour,
                                  bike: widget.bike,
                                  destination: toPlace,
                                )));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
