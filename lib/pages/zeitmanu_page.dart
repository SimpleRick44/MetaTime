import 'package:flutter/material.dart';

class Manu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(80.0),
      margin: const EdgeInsets.only(right: 100.0),
      child: new TextField(
        decoration: new InputDecoration(
            border: const UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    bottomRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0))),
            filled: true,
            labelText: 'Stunden:'),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
