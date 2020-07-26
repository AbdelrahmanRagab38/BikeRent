import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/bike.dart';
import 'package:bikerent/components/lightRounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
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
                                            title: Text( "bike id: "+
                                                bike.id,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: kPrimaryLightColor,
                                              ),
                                            ),

                                            subtitle: Column(
                                              children: [
                                                Text(
                                                  "Bike size:"+ bike.size,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: kPrimaryLightColor,
                                                  ),
                                                ),
                                                Text(
                                                  "state:"+   bike.state,
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
                                  /*Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[

                                              Text("Bike size :"+bike.size +"    ",style:TextStyle(
                                              color: Colors.blue,
                                              fontSize: 17)),
                                              Text(
                                               "Bike ID :"+ bike.id,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        );*/
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
