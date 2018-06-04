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
      Uri.encodeFull("http://192.168.178.55:5000/api/kunden"),
      headers: {
        "Accept": "application/json",
        "X-Auth-Token": "0ce0d5ab-76d3-4e06-ae8b-fc083cdb476e",
        "Connection": "keep-alive",
        "Host": "192.168.178.55:5000",
        "Referer": "http://192.168.178.55:5000/"
      }
    );
    this.setState(() {
      data = JSON.decode(response.body);
      data["KundenNr"].toString();
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
        title: new Text("Kunden"),
      ),
      body: new ListView(
        children: <Widget>[
          new Text(data["KundenNr"]),
          new Text(data["Firma"]),
          new Text(data["Strasse"])
        ],
      )
    );
  }
}