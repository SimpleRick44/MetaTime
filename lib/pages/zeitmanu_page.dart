import 'package:flutter/material.dart';

class Manu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new TextField(
          decoration: new InputDecoration(
            border:const UnderlineInputBorder(),
            filled: true,
            labelText: 'Stunden'
          ),
          keyboardType: TextInputType.number,
        )
      )
    );
  }
}