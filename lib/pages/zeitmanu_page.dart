import 'package:flutter/material.dart';
import 'dart:async';



class Manu extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new _ManuState();
  }
}
class _ManuState extends State<Manu> {

  DateTime _date = new DateTime.now().toLocal();
  DateTime _date2 = new DateTime.now().toLocal();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date, 
      firstDate: new DateTime(2001).toLocal(), 
      lastDate: new DateTime(2030).toLocal()
      
    );
    if (picked != null && picked != _date) {
      print('Date: ${_date.toString()}'); 
      setState(() {
              _date = picked;
            });
    }
  }

   Future<Null> _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date2, 
      firstDate: new DateTime(2001).toLocal(), 
      lastDate: new DateTime(2030).toLocal()
      
    );
    if (picked != null && picked != _date2) {
      print('Date: ${_date2.toString()}'); 
      setState(() {
              _date2 = picked;
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      new Column(
        children: <Widget>[
          new IconButton(icon: Icon(Icons.date_range), onPressed: () {_selectDate(context);},),
          new Text('Start Datum: ${_date.toString()}',),
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Uhrzeit'),
          ),
          new Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
           new IconButton(icon: Icon(Icons.date_range), onPressed: () {_selectDate2(context);},),
          new Text('Abschluss Datum: ${_date2.toString()}',),
          new TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 30.0),
                border: const UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0))),
                filled: true,
                labelText: 'Abschluss Uhrzeit'),
          ),
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
        textAlign: TextAlign.start,
      ),
      new TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 15,
          maxLength: 1150,
          maxLengthEnforced: true,
          autocorrect: true,
          textAlign: TextAlign.left,
          style: new TextStyle(fontSize: 30.0, color: Colors.black),
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
        ],
      )
    ]);
  }
}
