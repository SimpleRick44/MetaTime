import 'package:flutter/material.dart';

class Manu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(80.0),
      margin: const EdgeInsets.only(right: 100.0),
        child: new TextField(
          style: const TextStyle(),
          decoration: new InputDecoration(
            border:const UnderlineInputBorder(),
            filled: true,
            labelText: 'Stunden'
          ),
          keyboardType: TextInputType.number,
        ),
      );
  }
}