import 'package:bikerent/Barking/Barking_screen.dart';
import 'package:bikerent/Store/BikeStore/bikeRent_screen.dart';
import 'package:bikerent/admin/StoreHome/ViewComming/bikeRent_screen.dart';
import 'package:bikerent/admin/view_MaintainanceRequests.dart';
import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view_BarkingSeats.dart';
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
              "BIKE RENT 1 STORE",
              style: TextStyle(fontSize: 32 ,fontWeight: FontWeight.bold, color: kPrimaryLightColor),
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
                        Navigator.pushNamed(context, BikeStoreScreen.id);

                      }
                    ),
                    LightRoundedButton(
                        text: "VIEW COMING BIKE",
                        press: (){

                          Navigator.pushNamed(context, viewBikecommingScreen.id);


                        }
                    ),

                    LightRoundedButton(
                        text: "View Barking seats",
                        press: (){
                          Navigator.pushNamed(context, BarkingSeats.id);

                        }
                    ),

                    LightRoundedButton(
                        text: "View Maintainince Requests",
                        press: (){
                          Navigator.pushNamed(context, MaintainanceRequests.id);

                        }
                    ),

                    SizedBox(height: size.height * 0.2),
//                    LightRoundedButton(
//                        text: "BARCODE",
//                        press: (){
//                          Navigator.pushNamed(context, '/storeCash');
//
//                        }
//                    ),

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



