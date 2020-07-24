import 'package:bikerent/admin/order.dart';
import 'package:bikerent/admin/toolcard.dart';
import 'package:bikerent/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bikerent/admin/order.dart';


class MaintainanceRequests extends StatelessWidget {
  static String id = "MaintaininceRequests";

  final firestoreInstance = Firestore.instance;

  Stream<QuerySnapshot> loadreqtools() {
    return firestoreInstance.collection("requested tools").snapshots();
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryLightColor,
        child: ListView.builder(
          itemCount: toolsList.length,
          itemBuilder: (context, index){
            return Container(
              child: ToolsCard(tools: toolsList[index],),
            );
          },
        ),
      ),
    );
  }*/
    @override
    Widget build(BuildContext context) {
      return  Scaffold(appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("All requested orders") ,
      ), body: Container(color: kPrimaryLightColor,

      child:StreamBuilder<QuerySnapshot>(
        stream: loadreqtools(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator());
          }
          else {
            List<order> orders = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              print(doc.data);
              orders.add(order(
                  UserName: data['username'],
                  nationalId: data["NationalId"],
                  requested_tool: data['requested tool']
              ));
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (context, index) {

                return VerticalUserCard(Requested_tool:
                orders[index].requested_tool,
                    Name: orders[index].UserName,
                    NationalId: orders[index].nationalId);

              },
            );
          }
        },
      ),


      )
      );

        StreamBuilder<QuerySnapshot>(
                            stream: loadreqtools(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              else {
                                List<order> orders = [];
                                for (var doc in snapshot.data.documents) {
                                  var data = doc.data;
                                  print(doc.data);
                                  orders.add(order(
                                      UserName: data['username'],
                                      nationalId: data["NationalId"],
                                      requested_tool: data['requested tool']
                                  ));
                                }
                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: orders.length,
                                  itemBuilder: (context, index) {
                                    return VerticalUserCard(Requested_tool:
                                         orders[index].requested_tool,
                                        Name: orders[index].UserName,
                                        NationalId: orders[index].nationalId);

                                  },
                                );
                              }
                            },
                          );






    }
  }


class VerticalUserCard extends StatelessWidget {

  final String Name;
  final String NationalId;
  final String Requested_tool;


  const VerticalUserCard({Key key, this.Name, this.NationalId,this.Requested_tool}) : super(key: key);

  // VerticalBookCard({this.imageUrl, this.title, this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),)
          borderRadius: BorderRadius.all(Radius.circular(30.0),)
      ),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.only(top: 5, ),
            child: ListTile(
              leading: Icon(Icons.add_circle),
              title: Text(
                Requested_tool,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kPrimaryLightColor,
                ),
              ),

              subtitle: Column(
                children: [
                  Text(
               "Usernam:"+ Name,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Text(
                 "NationalId:"+   NationalId,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),
                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}





/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*


return new ListView.builder(
scrollDirection: Axis.vertical,
itemCount: snapshot.data.documents.length,
itemBuilder: (context, index) {
if (index == 0) {
return someWidget, // return the widget you want as "header" here
} else {
return _buildList( context, snapshot.data.documents[index-1]),
}
}
);



















return ListView.builder(
itemCount: snapshot.data.length,
itemBuilder: (BuildContext context, int index){
return Card(
elevation: 0.0,
child: Padding(
padding: const EdgeInsets.all(0.0),
child:  SizedBox(
height: MediaQuery.of(context).size.height*0.15,
width: MediaQuery.of(context).size.width,
child:  Card(
elevation: 0,
child: Row(
children: <Widget>[
new Container(
child: Image.network(snapshot.data[index].iconUrl,height: MediaQuery.of(context).size.width*0.3,width: MediaQuery.of(context).size.width*0.3,),
),
Padding(
padding: const EdgeInsets.only(left: 10,right: 5,top: 5),
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: <Widget>[
new Container(
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: <Widget>[
Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Row(
children: <Widget>[
condition('${snapshot.data[index].vegOrNon}')==true? new Image.asset('images/non_veg.png',height: 15,width: 15,): new Image.asset('images/veg.jpg',height: 15,width: 15),
SizedBox(width: 5),
Text(snapshot.data[index].foodtitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,fontFamily: 'Roboto-Black'),)
],
),

SizedBox(height:10.0),
Row(
children: <Widget>[
new IconTheme(
data: new IconThemeData(
color: Colors.black26),
child: new Icon(Icons.timer,size: 20.0,),
),
Text('${snapshot.data[index].PreptimeInMins} minutes',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black26),),
],
),
],
)
],
),
),
],
),
),

],
)
)
*/