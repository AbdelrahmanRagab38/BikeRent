import 'package:bikerent/admin/order.dart';
import 'package:bikerent/admin/toolModel.dart';
import 'package:bikerent/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolsCard extends StatelessWidget {



  String Name;
  String NationalId;
  String Requested_tool;


  ToolsCard(this.Name, this.NationalId, this.Requested_tool);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
                    Name,
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Text(
                    NationalId,
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