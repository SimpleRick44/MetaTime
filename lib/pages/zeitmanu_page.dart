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
           new DropdownButton(
             hint: new Text("Kunde"),
                items: <String>['TestFirma', 'TestFirma2'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 90.0),
              )
            ],
          ),
          new RaisedButton(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 40.0, right: 40.0),
            child: const Text('Speichern'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blue,
            onPressed: () {
              print("test");
            },
          )
        ],
      )
    ]);
  }
}
