import 'package:bikerent/Screens/HomePage.dart';
import 'package:bikerent/Screens/Login/login_screen.dart';
import 'package:bikerent/Screens/Signup/components/social_icon.dart';
import 'package:bikerent/components/ConfirmPaswword.dart';
import 'package:bikerent/components/already_have_an_account_acheck.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/components/rounded_input_field.dart';
import 'package:bikerent/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentication.dart';
import 'background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    String _userName;
    String _nationalID;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/m-bike.svg",
              height: size.height * 0.20,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your UserName",
              onChanged: (value) {
                _userName = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            ConfirmPaswword(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedInputField(
              hintText: "Your National Id",
              onChanged: (value) {
                _nationalID = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                Auth myAuth = new Auth();
                final authResult = await myAuth.signUp(
                    _email, _password, _userName, _nationalID);
                print(authResult.user.uid);
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
