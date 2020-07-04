import 'package:flutter/material.dart';
import 'package:bikerent/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
