import 'package:bikerent/Barking/Barking_screen.dart';
import 'package:bikerent/Barking/qrBarkingScan.dart';
import 'package:bikerent/BikeSize/bikeSize_screen.dart';
import 'package:bikerent/Maintainence/Maintainence_screen.dart';
import 'package:bikerent/Screens/HomePage.dart';
import 'package:bikerent/Screens/LocationsMap/map.dart';
import 'package:bikerent/Screens/Splash_Screen.dart';
import 'package:bikerent/Store/BikeStore/bikeRent_screen.dart';
import 'package:bikerent/Store/StoreCash/storeCash_screen.dart';
import 'package:bikerent/Store/StoreLogin/storeLogin_screen.dart';
import 'package:bikerent/admin/StoreHome/storeHome_screen.dart';
import 'package:bikerent/admin/view_MaintainanceRequests.dart';
import 'package:flutter/material.dart';

import 'Screens/LocationsMap/parkingMap.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomePage.id: (context) => HomePage(),
        BarkingScreen.id: (context) => BarkingScreen(),
        StoreLoginScreen.id: (context) => StoreLoginScreen(),
        StoreCashScreen.id: (context) => StoreCashScreen(),
        BikeStoreScreen.id: (context) => BikeStoreScreen(),
        BikeSizeScreen.id: (context) => BikeSizeScreen(),
        QrBarkingScan.id: (context) => QrBarkingScan(),
        ParkingMap.id: (context) => ParkingMap(),
        LocationsMap.id: (context) => LocationsMap(),
        MaintainenceScreen.id: (context) => MaintainenceScreen(),
        StoreHome.id: (context) => StoreHome(),
        MaintainanceRequests.id: (context) => MaintainanceRequests(),


      },
    );
  }
}
