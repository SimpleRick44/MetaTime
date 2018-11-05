import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import './tätigkeiten_page.dart';
import './übersicht_page.dart';
class Manu extends StatefulWidget {
  @override
  ManuPageState createState() => new ManuPageState();
}

class ManuPageState extends State<Manu> {
  DateTime _date = new DateTime.now().toLocal();
  DateTime _date2 = new DateTime.now().toLocal();
  var arbeitsb = "";
  var besuchsb = "";
  

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

  Future<String> ab() async {
    var res = "Arebeitsbericht";
    setState(() {
      arbeitsb = res;
    });
    return arbeitsb;
  }

  Future<String> bb() async {
    var res = "Besuchsbericht";
    setState(() {
      besuchsb = res;
    });
    return besuchsb;
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new ListView(children: <Widget>[
            new Card(
                child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new FlatButton(
                  child: new Text(
                    "Arbeitsbericht",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  onPressed: ab,
                ),
                new Divider(),
                new FlatButton(
                    child: new Text(
                      "Besuchsbericht",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    onPressed: bb),
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Zeiterfassen"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: new ListView(children: <Widget>[
        new Container(
          alignment: Alignment.topLeft,
          child: new Text(
            "Start Datum",
            style: new TextStyle(fontSize: 50.0),
            textAlign: TextAlign.left,
          ),
        ),
        new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new IconButton(
                    alignment: Alignment.bottomLeft,
                    icon: Icon(Icons.date_range),
                    iconSize: 35.0,
                    onPressed: () {
                      _selectDate(context, 1);
                    },
                  ),
                  new Text(
                    '${df.format(_date)}',
                    style: new TextStyle(fontSize: 22.0),
                    
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.watch_later),
                    iconSize: 35.0,
                    onPressed: () {
                      _selectTime(context, 1);
                    },
                  ),
                  new Text(
                    ' ${tf.format(_date)}',
                    style: new TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              new Text("Abschluss Datum",
                  style: new TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                  )),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new IconButton(
                          alignment: Alignment.bottomLeft,
                          icon: Icon(Icons.date_range),
                          iconSize: 35.0,
                          onPressed: () {
                            _selectDate(context, 2);
                          },
                        ),
                        new Text(
                          '${df.format(_date2)}',
                          style: new TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new IconButton(
                          icon: Icon(Icons.watch_later),
                          iconSize: 35.0,
                          onPressed: () {
                            _selectTime(context, 2);
                          },
                        ),
                        new Text(
                          ' ${tf.format(_date2)}',
                          style: new TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  ])
            ]),
        new Text(
          "Bericht",
          style: new TextStyle(fontSize: 50.0),
        ),
           new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
            )
          ],
        ),
        new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                besuchsb + "  " + arbeitsb,
                style: new TextStyle(fontSize: 27.0),
                textAlign: TextAlign.center,
                             ),
            ]),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 170.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new FlatButton(
                  padding: EdgeInsets.only(
                      left: 35.0, right: 35.0, top: 10.0, bottom: 20.0),
                  child: new Text(
                    "Berichtart",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  onPressed: _showModalSheet,
                ),
                new FlatButton(
                    padding: EdgeInsets.only(
                        left: 120.0, right: 35.0, top: 10.0, bottom: 10.0),
                    child: new Text(
                      "Tätigkeit",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Auto()));
                    })
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
