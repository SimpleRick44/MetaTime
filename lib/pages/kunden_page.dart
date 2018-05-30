import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kunden extends StatefulWidget {
  @override
  KundenPageState createState() => new KundenPageState();
}

class KundenPageState extends State<Kunden> {

  var data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://api.timezonedb.com/v2/get-time-zone?key=3NEWA7XBCFKW&format=json&by=zone&zone=Europe/Berlin"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    print(data["status"]);
    
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
            child: new Text(data["formatted"]),
          );
        },
      ),
    );
  }
}