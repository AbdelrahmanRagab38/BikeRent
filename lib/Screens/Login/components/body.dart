import 'package:bikerent/Screens/HomePage.dart';
import 'package:bikerent/Screens/Signup/signup_screen.dart';
import 'package:bikerent/admin/StoreHome/storeHome_screen.dart';
import 'package:bikerent/components/already_have_an_account_acheck.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/components/rounded_input_field.dart';
import 'package:bikerent/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentication.dart';
import 'background.dart';

class Body extends StatelessWidget {
  final adminPassword = 'Admin1234';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _email;
    String _password;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "          LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/bikee.svg",
              height: size.height * 0.30,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  Auth myauth = new Auth();

                  if (_password == adminPassword) {
                    try {
                      await myauth.signIn(_email, _password);
                      Navigator.pushNamed(context, StoreHome.id);
                    }
                    catch(e){
                      print(e);
                    }

                  }
else {
                    final authResult = await myauth.signIn(_email, _password);
                    print(authResult);

                    if (authResult.user.uid != null) {
                      print("success");
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    } else {
                      print("Eror");
                    }
                  }


                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
