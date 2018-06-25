import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './data.class.dart';
import './zeitmanu_page.dart';

class Kunden2 extends StatefulWidget {
  @override
  KundenPageState createState() => new KundenPageState();
}

class KundenPageState extends State<Kunden2> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.178.217:5000/api/kunden"),
        headers: {
          "Accept": "application/json",
          "X-Auth-Token": ArgonData.data.token,
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
          backgroundColor: Colors.blue[900],
          title: new Text("Kunden"),
          centerTitle: true,
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
                    subtitle: Text(data[index]["strasse"] +
                        '   ' +
                        data[index]["plz"] +
                        ' ' +
                        data[index]["ort"]),
                        onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Manu()));
                        },
                  ),
                ],
              ));
            }));
  }
}
