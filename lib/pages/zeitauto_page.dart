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
        Uri.encodeFull("http://192.168.178.217:5000/api/kunden"),
        headers: {
          "Accept": "application/json",
          "Accept-Encoding": "gzip, deflate",
          "X-Auth-Token": "445c10f6-c63f-477d-87f5-a916419b0776",
          "Connection": "keep-alive",
          "Host": "192.168.178.205:5000",
          "Referer": "http://192.168.178.217:5000/"
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
    return new ListView(children: <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[],
      ),
      new Container(
        height: 100.0,
        color: Colors.blue[900],
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new FloatingActionButton(
              heroTag: "start",
              child: new Text("Start"),
              backgroundColor: Colors.lightGreen[600],
              elevation: 30.0,
              onPressed: getData,
            ),
            new Container(padding: const EdgeInsets.only(left: 20.0)),
            new Text(
              displayedsring,
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            new Container(
              padding: const EdgeInsets.only(left: 10.0),
            ),
          ],
        ),
      ),
      new Container(
        height: 100.0,
        color: Colors.blue[900],
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new FloatingActionButton(
              heroTag: "stop",
              child: new Text("Stop"),
              backgroundColor: Colors.red,
              elevation: 30.0,
              onPressed: getData2,
            ),
            new Container(padding: const EdgeInsets.only(left: 20.0)),
            new Text(
              displayedstring2,
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
      ),
      new Text(
        "Tätigkeit",
        style: new TextStyle(fontSize: 50.0),
        textAlign: TextAlign.left,
      ),
      new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 15,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.start,
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
      new Container(
          height: 100.0,
          color: Colors.blue[900],
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              ]))
    ]);
  }
}
