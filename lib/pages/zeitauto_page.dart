import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AutoState();
  }
}

class _AutoState extends State<Auto> {
  Color _myColor = Colors.green;
  String _myButtonState = 'NULL';
  Color _farbeBox = Colors.green;
  String _buttonText = 'Start';
  var _zeitGestartet = 'Gestartet: ';
  var _zeitGestoppt = 'Gestoppt: ';
  var data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://api.timezonedb.com/v2/get-time-zone?key=3NEWA7XBCFKW&format=json&by=zone&zone=Europe/Berlin"),
        headers: {"Accept": "application/json"});
    data = JSON.decode(response.body);
    print(data["status"]);

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(''),
          new Text(' '),
          new Text(' '),
          new RaisedButton(
              padding: EdgeInsets.all(50.0),
              child: new Text(_buttonText,
                  style: new TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold)),
              color: _farbeBox,
              onPressed: () {
                setState(() {
                  if (_myColor == Colors.red) {
                    _myColor = Colors.green;
                    _farbeBox = Colors.green;
                    _buttonText = "Start";
                    _zeitGestoppt = 'Gestoppt: ' + data["formatted"];
                    final snackBar = new SnackBar(
                        content: new Text('Zeiterfassung beendet'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    _myColor = Colors.red;
                    _farbeBox = Colors.red;
                    _buttonText = "Ende";
                    _zeitGestartet = 'Gestartet: ' + data["formatted"];
                    final snackBar = new SnackBar(
                        content: new Text('Zeiterfassung gestartet'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                });
              }),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Text(
            _zeitGestartet,
            style: new TextStyle(fontSize: 23.0),
          ),
          new Text(' '),
          new Text(' '),
          new Text(
            _zeitGestoppt,
            style: new TextStyle(fontSize: 23.0),
          ),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new RaisedButton(
                  color: Colors.red,
                  child: new Text(
                    'Löschen',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(30.0),
                  onPressed: () {
                    print('Löschen');
                  },
                ),
              ),
              new Expanded(
                child: new RaisedButton(
                  color: Colors.blue,
                  child: new Text(
                    'Speichern',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(30.0),
                  onPressed: () {
                    print('Speichern');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );

/* class Auto extends StatelessWidget {
  Color buttonColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    /*_getTimeApi() async {
      var httpClient = new HttpClient();
      var uri = new Uri.https('https://maps.googleapis.com/maps/api/timezone/json?location=38.908133,-77.047119&timestamp=1458000000&key=AIzaSyDdSna-wkK3zLS7QrjwSap2-voSZQOtSSY', unencodedPath)
     } */
    /* return new GestureDetector(
      child: new Center(
        child: new RaisedButton(
          padding:
              EdgeInsets.only(left: 65.0, right: 65.0, bottom: 50.0, top: 50.0),
          child: new Text('Start',
              style:
                  new TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
          color: Colors.green,
          splashColor: Colors.greenAccent,
          onPressed: () {
            final snackBar =
                new SnackBar(content: new Text('Zeiterfassung gestartet'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    ); */
    /* return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RaisedButton(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 30.0, left: 60.0, right: 60.0),
            child: const Icon(Icons.timer),
            color: Colors.green,
            elevation: 4.0,
            splashColor: Colors.greenAccent,
            onPressed: () {
              print("Start");
              new Column(
                children: <Widget>[new Text('Test')],
              );
            }),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 200.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RaisedButton(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 30.0, left: 60.0, right: 60.0),
              child: const Icon(Icons.timer_off),
              color: Colors.red,
              elevation: 4.0,
              splashColor: Colors.redAccent,
              onPressed: () {
                print("Ende");
              },
            )
          ],
        ),
      ],
    ); */ */
  }
}
