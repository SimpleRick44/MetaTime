import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './navigationsbar_page.dart';




class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AutoState();
  }
}

class _AutoState extends State<Auto> {
  var data;
  String displayedsring = "";
  String displayedstring2 = "";

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

  Future<String> getData2() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://api.timezonedb.com/v2/get-time-zone?key=3NEWA7XBCFKW&format=json&by=zone&zone=Europe/Berlin"),
        headers: {"Accept": "application/json"});
    data = JSON.decode(response.body);
    setState(() {
      displayedstring2 = data["formatted"];
    });
    return "Success!";
  }

Future<String> getData3() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.178.205:5000/api/kunden"),
        headers: {
          "Accept": "application/json",
          "Accept-Encoding": "gzip, deflate",
          "X-Auth-Token": "cffb1b7b-ac2e-46c7-8392-a92093cf5a4a",
          "Connection": "keep-alive",
          "Host": "192.168.178.205:5000",
          "Referer": "http://192.168.178.205:5000/"
        });

    this.setState(() {
      data = JSON.decode(response.body);
    });
  

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData3();
  }


  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                padding: EdgeInsets.only(
                    left: 85.0, right: 85.0, top: 30.0, bottom: 50.0),
                color: Colors.blue,
                child: new Text(
                  "Start",
                  style: new TextStyle(fontSize: 55.0),
                ),
                onPressed: getData,
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
              new Text(
                displayedsring,
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
              new RaisedButton(
                padding: EdgeInsets.only(
                    left: 85.0, right: 85.0, top: 30.0, bottom: 50.0),
                color: Colors.red,
                child: new Text(
                  "Stopp",
                  style: new TextStyle(fontSize: 55.0),
                ),
                onPressed: getData2,
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
              new Text(
                displayedstring2,
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
              new Row(children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                      color: Colors.red,
                      child: new Text(
                        "Löschen",
                        style: new TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(30.0),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyTabs()));
                      }),
                ),
                new Expanded(
                  child: new RaisedButton(
                    color: Colors.lightGreen,
                    child: new Text(
                      "Speichern",
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(30.0),
                    onPressed: () {
                      print("Speichern");
                    }
                  ),
                ),
              ]),
            ])
      ],
    );
  }
}
