import 'package:flutter/material.dart';
import 'dart:ui';
import './pages/data.class.dart';
import './pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(new ArgonPlus());

class ArgonPlus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new MaterialApp(
      home: new LoginPage(title: 'Metaoffice Anmelden'),
      localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('de', 'DE'), 
      const Locale('en', 'US')
    ],
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String passwort = 'test1234';
  String email = 'demo@metacarp.de';
  bool isLoggin = false;

  void doLogin() async {
    if (isLoggin) {
      return;
    }
    setState(() {
      this.isLoggin = true;
    });
    String token = "";
    try {
      token = await ArgonData.data.login(this.email, this.passwort);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Sign in Error"),
            content:
                new Text("There was an error signing in. Please try again."),
          );
        },
      );
    }

    setState(() {
      this.isLoggin = false;
    });

    if (token.length > 0) {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final col = new Column(
      children: <Widget>[
        new Container(
          child: new Image.asset("bilder/logo.png"),
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        ),
        new TextField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            style: new TextStyle(
              color: Colors.white,
            ),
            controller: new TextEditingController(text: email),
            decoration: new InputDecoration(
                labelStyle: new TextStyle(
                  color: Colors.white,
                ),
                icon: new Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'email'),
            onChanged: (String val) {
              setState(() {
                email = val;
              });
            },
            autofocus: true),
        new TextField(
          controller: new TextEditingController(
            text: passwort,
          ),
          obscureText: true,
          style: new TextStyle(
            color: Colors.white,
          ),
          decoration: new InputDecoration(
              labelStyle: new TextStyle(
                color: Colors.white,
              ),
              icon: new Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              hintText: 'Password'),
          onChanged: (String val) {
            setState(() {
              passwort = val;
            });
          },
          keyboardType: TextInputType.text,
        ),
      ],
    );

    col.children.add(new Container(
      child: new FlatButton(
        onPressed: (passwort.length > 0 && email.length > 0 && !isLoggin)
            ? doLogin
            : null,
        child: new Text(isLoggin ? 'Wird Angemeldet…' : 'Anmelden'),
        color: Colors.blueAccent,
        textColor: Colors.white,
      ),
      margin: new EdgeInsets.all(15.0),
    ));
    col.children.add(new Text(
      "© 2018 Metacarp GmbH",
      style: Theme.of(context).textTheme.caption,
    ));
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 62, 74, 89),
      body: new Center(
        child: new Container(
          constraints: new BoxConstraints.tightForFinite(height: 275.0),
          child: col,
          margin: new EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
