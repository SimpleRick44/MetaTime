import 'package:flutter/material.dart';

class Auto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new ListView(
     children: <Widget>[
       new Text("Test",textAlign: TextAlign.center,style: new TextStyle(fontSize: 23.0, fontFamily: "helvetica",color: Colors.grey))
     ]
   );
  }
}