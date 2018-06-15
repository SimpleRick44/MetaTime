import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Zeiten extends StatefulWidget {
  @override
  ZeitenPageState createState() => new ZeitenPageState();
}

class ZeitenPageState extends State<Zeiten> {
  List data;

  Future<String> getData() async {
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
