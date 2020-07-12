import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/components/sRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {

   Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
   String dropdownValue = "MEDIUM";

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
              style: TextStyle(fontSize: 32 ,fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            /*SvgPicture.asset(
              "assets/icons/bikee.svg",
              height: size.height * 0.30,
            ),*/

            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: kPrimaryColor,
              ),
              //dropdownColor: kPrimaryLightColor,
              hint: Text("  Bike size"),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
              onChanged: (String value){
              setState(() {
                dropdownValue = value;
              });
              },
              items: <String> ['SMALL','MEDIUM','LARGE']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            /*Column(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "SMALL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: kPrimaryLightColor,
                  hoverColor: kPrimaryColor,
                  onPressed: (){},
                ),
                FlatButton(
                  child: Text(
                    "MEDIUM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: kPrimaryLightColor,
                  hoverColor: kPrimaryColor,
                  onPressed: (){},
                ),
                FlatButton(
                  child: Text(
                    "LARGE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: kPrimaryLightColor,
                  hoverColor: kPrimaryColor,
                  onPressed: (){},
                ),
              ],
            ),*/
            SizedBox(height: size.height * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "TIME",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                    SRoundedButton(
                      text: "FROM",
                      press: (){

                      }
                    ),
                    SRoundedButton(
                        text: "TO",
                        press: (){

                        }
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "PLACE",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                    SRoundedButton(
                        text: "FROM",
                        press: (){

                        }
                    ),
                    SRoundedButton(
                        text: "TO",
                        press: (){

                        }
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: size.height * 0.03),

            RoundedButton(
                text: "RENT",
                press: (){

                  Navigator.pushNamed(context, '/storeLogin');
                }
            ),

          ],
        ),
      ),
    );


  }
}



