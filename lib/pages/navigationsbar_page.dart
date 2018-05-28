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
        title: new Text("Zeit erfassen"),backgroundColor: Colors.grey,
        actions: <Widget>[
          new PopupMenuButton(
            icon: new Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: const Text('Test')
              )
            ]
          )
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.timer, color: Colors.grey,)),
            new Tab(icon: new Icon(Icons.border_color, color: Colors.grey,)),
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
