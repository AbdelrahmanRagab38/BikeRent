import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/components/lightRounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bike Rent 1",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Column(
              children: [
                LightRoundedButton(
                    text: "VIEW Rented BIKES",
                    press: () async {
                      List<Bike> bikes = await Database().getRentedBikes();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Scaffold(
                              body: bikes.length > 0
                                  ? ListView(
                                      children: bikes.map((bike) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            bike.id,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : Center(
                                      child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('No Bikes is Rented'),
                                        RaisedButton(
                                          child: Text('Back'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    )),
                            );
                          });
                    }),
                SizedBox(height: size.height * 0.03),
                LightRoundedButton(
                    text: "Back",
                    press: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
