import 'package:flutter/material.dart';

class Manu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      new Column(
        children: <Widget>[
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Datum'),
          ),
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Uhrzeit'),
          ),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Abschluss Datum'),
          ),
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Abschluss Uhrzeit'),
          ),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
           new Text(
        "Tätigkeit",
        style: new TextStyle(
          fontSize: 50.0,
        ),
        textAlign: TextAlign.left,
      ),
      new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 15,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.left,
          style: new TextStyle(fontSize: 30.0, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 00.01),
            border: const UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    bottomRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0))),
            filled: true,
          )),
        ],
      )
    ]);
  }
}
