import 'package:bikerent/components/rounded_button.dart';
import 'package:bikerent/components/rounded_input_field.dart';
import 'package:bikerent/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'background.dart';




class Body extends StatefulWidget {

  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyStatee createState() => _BodyStatee();
}



class _BodyStatee extends State<Body> {
  final firestoreInstance = Firestore.instance;
  String dropdownValue = "Tier";
  String _request = "" ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.03),
            Text(
              "Bike Rent 1",
              style: TextStyle(fontSize: 44 ,fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),

            SizedBox(height: size.height * 0.1),




            Row(
              children: <Widget>[
                Text(
                  "    Availble tools:   ",
            style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold, color: kPrimaryColor),

      ),


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
                  hint: Text("Available tools"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                  onChanged: (String value){
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  items: <String> ['Tier','Dental pick','Clean rags','Tire levers','Clean Tiers','Chain brush','Floor pump with gauge','Latex gloves']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),







            //s

/*

StreamBuilder<QuerySnapshot>(
  stream: Firestore.instance.collection("material").snapshots(),
  // ignore: missing_return
  builder: (context , snapshot){
    if(!snapshot.hasData){
      Text("loading");
    }
    else{
      List<DropdownMenuItem> mat =[];
      for(int i = 0 ; i < snapshot.data.documents.length; i++){
        DocumentSnapshot  snap = snapshot.data.documents[i];



      }

    }
  },


)
*/

            //e














            Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                child: Container(
                  color: kPrimaryLightColor,
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      RoundedInputField(
                        hintText: "If not availble write Your Request",
                        icon: Icons.directions_bike,
                        onChanged: (value) {
                          _request = value;
                        },
                      ),

                    ],
                  ),
                ),

              ),
            ),

            //SizedBox(height: size.height * 0.03),

            RoundedButton(
              text: "CONFIRM",
              press: () async{
                var firebaseUser = await FirebaseAuth.instance.currentUser();
                String username = "";


                firestoreInstance.collection("users").document(firebaseUser.uid).get().then((value){
                username = value['username'];
                print(username);
                firestoreInstance.collection("requested tools").add(
                    {
                      "requested tool" : dropdownValue,
                      "userId": firebaseUser.uid,
                      "username": username,
                      "NationalId":value['nationalID'],

                    }).then((value){
                  print(value.documentID);
                });
                });







    if(_request != ""){
                firestoreInstance.collection("requests").add(
                    {
                      "requested tool" : _request,
                    }).then((value){
                  print(value.documentID);



                });


              }
                final snackBar = SnackBar(
                  content: Text('Your request submited sucuessfuly !'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);

              }
            ),

          ],
        ),
      ),
    );


  }
}



