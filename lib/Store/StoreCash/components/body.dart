import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatelessWidget {
  int rentedTime ;
  Body({this.rentedTime});


  @override
  Widget build(BuildContext context) {
    double price = (DateTime.now().hour+ 2 - rentedTime)  * 2.5;
    int time = rentedTime -DateTime.now().hour +1 ;

    String cashData = "You rent the bike for";
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              "CASH",
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryLightColor),
            ),

            //SizedBox(height: size.height * 0.03),

            Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Container(
                  color: Colors.white,
                  width: size.width * 0.9,
                  height: size.height * 0.68,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    cashData + " $time Hours" +"\nAnd it costs : "+ "$price" +" \$",
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  ),
                ),
              ),
            ),

            //SizedBox(height: size.height * 0.03),

            LightRoundedButton(
                text: "DONE",
                press: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();


                  //Navigator.pushNamed(context, '/bikeStore');
                }),
          ],
        ),
      ),
    );
  }
}
