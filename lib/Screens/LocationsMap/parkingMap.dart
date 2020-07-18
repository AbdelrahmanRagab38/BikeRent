import 'package:bikerent/Barking/Barking_screen.dart';
import 'package:bikerent/Database/database.dart';
import 'package:bikerent/Models/place.dart';
import 'package:bikerent/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingMap extends StatefulWidget {
  static final id = "/ParkingMap";
  @override
  _ParkingMapState createState() => _ParkingMapState();
}

class _ParkingMapState extends State<ParkingMap> {
  GoogleMapController _controller;
  String dropdownValue = "Select Place";
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(30.025, 31), zoom: 14);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _addMarker(Place place) {
    var markerIdVal = place.id;
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: place.position,
      infoWindow:
          InfoWindow(title: place.name, snippet: place.numOfBikes.toString()),
      onTap: () {
//        _onMarkerTapped(markerId);
      },
    );

//    setState(() {
    // adding a new marker to map
    markers[markerId] = marker;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: Set.of(markers.values),
            initialCameraPosition: _cameraPosition,
            onMapCreated: (controller) {
              _controller = controller;
            },
            zoomControlsEnabled: false,
          ),
          FutureBuilder(
            future: Database().getPlaces(),
            builder: (context, AsyncSnapshot<List<Place>> snapshot) {
              if (snapshot.hasData) {
                List<String> dropdownList = ['Select Place'];
                snapshot.data.forEach((place) {
                  dropdownList.add(place.name);
                  _addMarker(place);
                });
                Place selectedPlace;
                if (dropdownValue != 'Select Place') {
                  selectedPlace =
                      snapshot.data[dropdownList.indexOf(dropdownValue) - 1];
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, right: 10, left: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: Colors.blue,
                                      style: BorderStyle.solid,
                                      width: 0.80),
                                ),
                                child: Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      value: dropdownValue,
                                      items: dropdownList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                          if (dropdownValue != 'Select Place') {
                                            selectedPlace = snapshot.data[
                                                dropdownList.indexOf(
                                                        dropdownValue) -
                                                    1];
                                            setState(() {
                                              _cameraPosition = CameraPosition(
                                                  target:
                                                      selectedPlace.position,
                                                  zoom: 14);
                                              _controller.animateCamera(
                                                  CameraUpdate
                                                      .newCameraPosition(
                                                          _cameraPosition));
                                            });
                                          } else {
                                            selectedPlace = null;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(6)),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.motorcycle,
                                        color: Colors.white,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(selectedPlace != null
                                      ? selectedPlace.numOfBikes.toString()
                                      : 'select palce'),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(6)),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.local_parking,
                                        color: Colors.white,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(selectedPlace != null
                                      ? selectedPlace.availableSeats.toString()
                                      : 'select palce'),
                                ),
                              ],
                            ),
                            RoundedButton(
                              color: Colors.blue,
                              text: 'Park',
                              press: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BarkingScreen(
                                            place: selectedPlace)));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
