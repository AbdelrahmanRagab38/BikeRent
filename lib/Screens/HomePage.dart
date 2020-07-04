import 'package:bikerent/Screens/Login/login_screen.dart';
import 'package:bikerent/Screens/Signup/signup_screen.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import 'Login/components/background.dart';


class HomePage extends StatelessWidget {
static String id = "HomePage";
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Text(
              "WELCOME TO Bike Rent",
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 21),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),*/
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Rent",
              press: () {

              },
            ),
            RoundedButton(
              text: "Barking",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {

              },
            ),

            RoundedButton(
              text: "Maintainance",
              press: () {

              },
            ),



          ],
        ),
      ),
    );
  }
}

























































/*import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      //  margin: const EdgeInsets.all(120.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 RaisedButton(
                   onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                    alignment: Alignment.center,

                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(30.0),
                      child: const Text('Rent ',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),

              ],
            ),
            Row(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
*/