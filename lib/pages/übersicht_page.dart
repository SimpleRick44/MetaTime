import 'package:flutter/material.dart';

class Ueberischt extends StatefulWidget {
  String value;
  Ueberischt({Key key, this.value}) : super (key: key);
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
        new Text(
          "Übersicht",
          style: new TextStyle(fontSize: 50.0),
        ),
            new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
            )
          ],
        ),
        new Text("Datum",
        style: new TextStyle(fontSize: 30.0),),
            new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
            )
          ],
        ),
        new Text("Tätigkeit",
        style: new TextStyle(fontSize: 30.0)),
            new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
            )
          ],
        ),
        new Text("- Tätigkeit 1",
        style: new TextStyle(fontSize: 24.0,)),
        new Text("${widget.value}", style: new TextStyle(fontSize: 22.0),)
      ]),
    );
  }
}
