import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/constants.dart';
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

            SizedBox(height: size.height * 0.03),
            Text(
              "TAHRIR GARAGE",
              style: TextStyle(fontSize: 44 ,fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),

            SizedBox(height: size.height * 0.1),

            Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                child: Container(
                  color: kPrimaryLightColor,
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "REQUEST",
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),

              ),
            ),

            //SizedBox(height: size.height * 0.03),

            RoundedButton(
              text: "CONFIRM",
              press: () {

                Navigator.pushNamed(context, '/qrBarkingScan');
              }
            ),

          ],
        ),
      ),
    );


  }
}



