import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './data.class.dart';
class Zeiten extends StatefulWidget {
  @override
  ZeitenPageState createState() => new ZeitenPageState();
}

class ZeitenPageState extends State<Zeiten> {
  List data;

  Future<void> getData() async {
    if (ArgonData.data.token == null) return;
    var response = await http.get(
      Uri.encodeFull("http://192.168.178.217:5000/api/kunden"),
      headers: {
        "Accept": "application/json",
        "X-Auth-Token": ArgonData.data.token,
      },
    );
    if (response.statusCode != 200) return;
    dynamic data;
    try {
      data = jsonDecode(response.body);
    } catch (e) {
      return;
    }
    this.setState(() {
      data = data;
    });
  }


  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Berichte"),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.import_contacts),
                    title: Text(data[index]["firma"]),
                    subtitle: Text(data[index]["strasse"] + '   ' + data[index]["plz"] + ' ' + data[index]["ort"]),
                  ),
                ],
              ));
            }));
  }
}
