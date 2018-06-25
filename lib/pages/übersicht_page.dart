import 'package:flutter/material.dart';

class Ueberischt extends StatefulWidget {
  @override
  UebersichtPageState createState() => new UebersichtPageState();
}

class UebersichtPageState extends State<Ueberischt> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        title: new Text("Tätigkeiten"),
        centerTitle: true,
      ),
      body: new ListView(children: <Widget>[
        new Text("Übersicht"
        , style: new TextStyle(fontSize: 50.0),)
      ]),
    );
  }
}
