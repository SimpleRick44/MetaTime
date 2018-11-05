import 'package:flutter/material.dart';
import './übersicht_page.dart';

class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AutoState();
  }
}

class _AutoState extends State<Auto> {
  var _textController = new TextEditingController();
   var _textController2 = new TextEditingController();
 var _textController3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        title: new Text("Tätigkeiten"),
        centerTitle: true,
      ),
      body: new ListView(children: <Widget>[
        new Text(
          "Tätigkeiten",
          style: new TextStyle(fontSize: 50.0),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 1",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          controller: _textController,
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
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 2",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          controller: _textController2,
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
        new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
            )
          ],
        ),
        new Text(
          "Tätigkeit 3",
          style: new TextStyle(fontSize: 30.0),
        ),
        new TextFormField(
          controller: _textController3,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new FlatButton(
               onPressed: () {
               var route = new MaterialPageRoute(builder:(BuildContext context) => new Ueberischt(value: _textController.text), );
               Navigator.of(context).push(route);
              },
              child: new Text("Übersicht", style: new TextStyle(fontSize: 20.0,),
             
            ),
            )],
        )
      ]),
    );
  }
}
