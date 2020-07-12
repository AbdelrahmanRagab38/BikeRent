import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/material.dart';
import 'components/background.dart';

class QrBarkingScan extends StatelessWidget {

  QrBarkingScan({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: size.height * 0.05),
              Text(
                "BARKING",
                style: TextStyle(fontSize: 44 ,fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),

              //SizedBox(height: size.height * 0.03),

              Container(
                margin: EdgeInsets.all(20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                  child: Container(
                    color: kPrimaryColor,
                    width: size.width * 0.9,
                    height: size.width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child:
                    //here to put the QR code
                    Image.asset(
                      "assets/images/Bikee.png",
                    ),
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );


  }
}



