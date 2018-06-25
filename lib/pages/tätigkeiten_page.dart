import 'package:flutter/material.dart';
import './übersicht_page.dart';

class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AutoState();
  }
}

class _AutoState extends State<Auto> {
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
          "Tätigkeiten",
          style: new TextStyle(fontSize: 50.0),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 1",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 00.01),
            border: const UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                  bottomRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0)),
            ),
            filled: true,
          ),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 2",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 00.01),
            border: const UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                  bottomRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0)),
            ),
            filled: true,
          ),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 3",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 00.01),
            border: const UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                  bottomRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0)),
            ),
            filled: true,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new FlatButton(
               onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Ueberischt()));
              },
              child: new Text("Übersicht", style: new TextStyle(fontSize: 20.0,),
             
            ),
            )],
        )
      ]),
    );
  }
}
