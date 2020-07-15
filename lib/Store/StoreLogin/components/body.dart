import 'package:bikerent/authentication.dart';
import 'package:bikerent/components/lightRounded_button.dart';
import 'package:bikerent/components/rounded_input_field.dart';
import 'package:bikerent/components/rounded_password_field.dart';
import 'package:bikerent/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BIKE RENT",
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryLightColor),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "STORE LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kPrimaryLightColor),
            ),
            SizedBox(height: size.height * 0.03),
            /*SvgPicture.asset(
              "assets/icons/bikee.svg",
              height: size.height * 0.30,
            ),*/
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Store Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            LightRoundedButton(
                text: "LOGIN",
                press: () async {
                  final auth = Auth();
                  AuthResult authResult = await auth.signIn(_email, _password);
                  if (authResult.user != null) {
                    Navigator.pushNamed(context, '/bikeStore');
                  } else {
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
