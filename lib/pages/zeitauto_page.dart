import 'package:flutter/material.dart';
import 'dart:io';

class Auto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     _getTimeApi() async {
      var httpClient = new HttpClient();
      var uri = new Uri.https('https://maps.googleapis.com/maps/api/timezone/json?location=38.908133,-77.047119&timestamp=1458000000&key=AIzaSyDdSna-wkK3zLS7QrjwSap2-voSZQOtSSY', unencodedPath)
    } 
    return new Column(
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
    );
  }
}
