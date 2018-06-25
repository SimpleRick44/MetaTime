import 'package:flutter/material.dart';
import './erfasstezeiten_page.dart';
import './kunden_page.dart';
import './apitest_page.dart';
import './data.class.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data2;
  String Pb1 =
      "https://www.metacarp.de/wp-content/uploads/2017/10/Alexxircle1-150x150.png";

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.178.217:5000/api/personal"),
        headers: {
          "Accept": "application/json",
          "X-Auth-Token": ArgonData.data.token,
        });

    this.setState(() {
      data2 = JSON.decode(response.body);
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
        title: new Text("MetaOffice"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                data2[8]["vorname"] + " " + data2[8]["nachname"],
                style: new TextStyle(color: Colors.black, fontSize: 23.0),
              ),
              accountEmail: new Text(
                ArgonData.data.user,
                style: new TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage(Pb1),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.contain,
                      image: new AssetImage("bilder/metalogo.png"))),
            ),
            new ListTile(
                title: new Text("Zeit erfassen"),
                trailing: new Icon(Icons.timer),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Kunden2()));
                }),
            new ListTile(
                title: new Text("Berichte"),
                trailing: new Icon(Icons.update),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Zeiten()));
                }),
            new ListTile(
                title: new Text("Kunden"),
                trailing: new Icon(Icons.person),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Kunden()));
                }),
            new Divider(),
            new ListTile(
              title: new Text("Schließen"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
