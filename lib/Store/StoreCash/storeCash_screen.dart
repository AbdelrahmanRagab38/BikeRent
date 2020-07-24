import 'package:flutter/material.dart';
import 'package:bikerent/Store/StoreCash/components/body.dart';

class StoreCashScreen extends StatelessWidget {
  static String id = "StoreCash";
  int rentedTime ;

  StoreCashScreen({this.rentedTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(rentedTime: rentedTime,),
    );
  }
}
