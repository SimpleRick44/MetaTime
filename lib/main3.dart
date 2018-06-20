import 'package:flutter/material.dart';
import './pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('de', 'DE'), 
      const Locale('en', 'US')
    ],
  ));
}
