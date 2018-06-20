import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './navigationsbar_page.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import './data.class.dart';

class Manu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ManuState();
  }
}

class _ManuState extends State<Manu> {
  DateTime _date = new DateTime.now().toLocal();
  DateTime _date2 = new DateTime.now().toLocal();
  var data3;
  Future<Null> _selectDate(BuildContext context, int pos) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: pos == 1 ? _date : _date2,
      firstDate: new DateTime(2001),
      lastDate: new DateTime(2030),
    );
    if (picked != null && picked != _date) {
      DateTime newdate = DateTime(
        picked.year,
        picked.month,
        picked.day,
        _date.hour,
        _date.minute,
      );
      setState(() {
        if (pos == 1) {
          _date = newdate;
        } else {
          _date2 = newdate;
        }
      });
    }
  }

  Future<Null> _selectTime(BuildContext context, int pos) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.fromDateTime(
        pos == 1 ? _date : _date2,
      ),
    );
    if (picked != null) {
      DateTime newdate = DateTime(
        _date.year,
        _date.month,
        _date.day,
        picked.hour,
        picked.minute,
      );
      setState(() {
        if (pos == 1) {
          _date = newdate;
        } else {
          _date2 = newdate;
        }
      });
    }
  }

  Future<void> getData3() async {
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
      data3 = data;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData3();
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new ListView.builder(
              itemCount: data3 == null ? 0 : data3.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data3[index]["firma"]),
                      subtitle: Text(data3[index]["strasse"] +
                          '   ' +
                          data3[index]["plz"] +
                          ' ' +
                          data3[index]["ort"]),
                    ),
                  ],
                ));
              });
        });
  }

  void _showModalSheet2() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new ListView(children: <Widget>[
            new Card(
                child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new FlatButton(
                  child: new Text("Arbeitsbericht"),
                  onPressed: () {},
                ),
                new Divider(),
                new FlatButton(
                  child: new Text("Besuchsbericht"),
                  onPressed: () {},
                ),
              ],
            ))
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat df =
        DateFormat.yMd(Localizations.localeOf(context).languageCode);
    DateFormat tf = DateFormat.Hm(Localizations.localeOf(context).languageCode);

    return new ListView(children: <Widget>[
      new Column(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () {
              _selectDate(context, 1);
            },
          ),
          new Text(
            'Start Datum: ${df.format(_date)}',
            style: new TextStyle(fontSize: 18.0),
          ),
          new IconButton(
            icon: Icon(Icons.watch_later),
            onPressed: () {
              _selectTime(context, 1);
            },
          ),
          new Text(
            'Start Uhrzeit: ${tf.format(_date)}',
            style: new TextStyle(fontSize: 18.0),
          ),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
          new IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () {
              _selectDate(context, 2);
            },
          ),
          new Text('Abschluss Datum: ${df.format(_date2)}',
              style: new TextStyle(fontSize: 18.0)),
          new IconButton(
            icon: Icon(Icons.watch_later),
            onPressed: () {
              _selectTime(context, 2);
            },
          ),
          new Text('Abschluss Uhrzeit: ${tf.format(_date2)}',
              style: new TextStyle(fontSize: 18.0)),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
          new Text(
            "Tätigkeit",
            style: new TextStyle(
              fontSize: 50.0,
            ),
            textAlign: TextAlign.left,
          ),
          new TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            maxLength: 1150,
            maxLengthEnforced: true,
            autocorrect: true,
            textAlign: TextAlign.left,
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 00.01),
              border: const UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    bottomRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0)),
              ),
              filled: true,
            ),
          ),
        ],
      ),
      new Container(
        height: 100.0,
        width: 150.0,
        color: Colors.blue[900],
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new IconButton(
                  icon: new Icon(Icons.people),
                  onPressed: _showModalSheet,
                  iconSize: 30.0,
                ),
              ),
              new Text("Kunden"),
              new IconButton(
                icon: Icon(Icons.account_box),
                iconSize: 30.0,
                onPressed: _showModalSheet2,
              ),
              new Text("Bericht"),
              new IconButton(
                icon: Icon(Icons.save),
                iconSize: 30.0,
                onPressed: () {},
              ),
              new Text("Speichern"),
              new IconButton(
                  icon: Icon(Icons.cancel),
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new MyTabs(),
                          ),
                        );
                  }),
              new Text("Abbrechen"),
            ]),
      ),
    ]);
  }
}
