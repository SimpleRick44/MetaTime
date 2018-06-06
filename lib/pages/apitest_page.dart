import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kunden extends StatefulWidget {
  @override
  KundenPageState createState() => new KundenPageState();
}

class KundenPageState extends State<Kunden> {
  List data;

  Future<String> getData() async {
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
    print(data[0]["kundenNr"]);

    return "Success!";
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
          title: new Text("Kunden"),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(data[index]["firma"]),
                    subtitle: Text(data[index]["strasse"] + '   ' + data[index]["plz"] + ' ' + data[index]["ort"]),
                  ),
                ],
              ));
            }));
  }
}
