import 'package:flutter/material.dart';
import './navigationsbar_page.dart';
import './erfasstezeiten_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
String Pb1 = "https://www.metacarp.de/wp-content/uploads/2017/10/Alexxircle1-150x150.png";
String Pb2 = "http://talentfinder.firstsearch.de/wp-content/uploads/2018/04/Mathias-Tinz_2010-110x110.png";

void switchUser() {
  String backupsting = Pb1;
  this.setState((){
    Pb1 = Pb2;
    Pb2 = backupsting;
  });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("MetaTime"), backgroundColor: Colors.grey,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Admin",style: new TextStyle(color: Colors.black, fontSize: 23.0),),
              accountEmail: new Text("admin@metacarp.de", style: new TextStyle(color: Colors.black, fontSize: 15.0),),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                 backgroundImage: new NetworkImage(Pb1)
                ),
              ),
              otherAccountsPictures: <Widget>[
                 new GestureDetector(
                   onTap: () => switchUser(),
                child: new CircleAvatar(
                 backgroundImage: new NetworkImage(Pb2)
                ))],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.contain,
                  image: new NetworkImage("https://www.metacarp.de/wp-content/uploads/2017/10/logo_metacarp-e1508146599603.png")
                )
              ),
            ),
            new ListTile(
              title: new Text("Zeit erfassen"),
              trailing: new Icon(Icons.timer),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyTabs()));
              }
            ),
             new ListTile(
              title: new Text("Erfasste Zeiten"),
              trailing: new Icon(Icons.update),
               onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Zeiten()));
              }
            ),
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