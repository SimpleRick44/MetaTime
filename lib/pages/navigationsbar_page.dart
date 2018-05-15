import 'package:flutter/material.dart';
import './zeitauto_page.dart' as auto;
import './zeitmanu_page.dart' as manu;



class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test"),backgroundColor: Colors.grey,
      ),
     
      bottomNavigationBar: new Material(
        color: Colors.grey,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.timer)),
            new Tab(icon: new Icon(Icons.border_color)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
           new auto.Auto(),
           new manu.Manu(),
        ]
      )
    );
  }
}
