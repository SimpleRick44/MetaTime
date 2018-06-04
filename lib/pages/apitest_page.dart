import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kunden extends StatefulWidget {
  @override
  KundenPageState createState() => new KundenPageState();
}

class KundenPageState extends State<Kunden> {
  String displayedsring = "";

  var data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://api.timezonedb.com/v2/get-time-zone?key=3NEWA7XBCFKW&format=json&by=zone&zone=Europe/Berlin"),
        headers: {"Accept": "application/json"});

    data = JSON.decode(response.body);
    setState(() {
      displayedsring = data["formatted"];
    });
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Kunden"),
        ),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(displayedsring),
            new RaisedButton(
                child: new Text('GetData'),
                onPressed: () {
                  print(new DateTime.now());
                })
          ],
        )));
  }
}
