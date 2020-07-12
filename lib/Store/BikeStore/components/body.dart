import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/constants.dart';
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
              "TAHRIR STORE",
              style: TextStyle(fontSize: 32 ,fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            /*SvgPicture.asset(
              "assets/icons/bikee.svg",
              height: size.height * 0.30,
            ),*/

            SizedBox(height: size.height * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    LightRoundedButton(
                      text: "VIEW RENTING BIKE",
                      press: (){

                      }
                    ),
                    SizedBox(height: size.height * 0.03),
                    LightRoundedButton(
                        text: "VIEW COMING BIKE",
                        press: (){

                        }
                    ),
                    SizedBox(height: size.height * 0.2),
                    LightRoundedButton(
                        text: "BARCODE",
                        press: (){
                          Navigator.pushNamed(context, '/storeCash');

                        }
                    ),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );


  }
}



