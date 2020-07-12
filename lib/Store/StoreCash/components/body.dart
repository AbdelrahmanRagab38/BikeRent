import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class Body extends StatelessWidget {

   Body({
    Key key,
  }) : super(key: key);

   String cashData = "Here is the data";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.05),
            Text(
              "CASH",
              style: TextStyle(fontSize: 44 ,fontWeight: FontWeight.bold, color: kPrimaryLightColor),
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
                    cashData,
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
                //Navigator.pushNamed(context, '/bikeStore');
              }
            ),

          ],
        ),
      ),
    );


  }
}



