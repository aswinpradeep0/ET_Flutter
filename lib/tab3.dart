import 'package:demoapp/mydart1.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/mytab.dart';

import './mydart2.dart';

class MyApp3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Nothing',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  TabController controller;
  //create internal state
  Choice _choice;
  @override
  void initState() {
    super.initState();
    //try to make the length to
    controller = new TabController(length: 2, vsync: this);
    //add listener to add change index callback
    //https://docs.flutter.io/flutter/material/TabController-class.html
    controller.addListener(_select);
    _choice = choices[0];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _select() {
    setState(() {
      _choice = choices[controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: new PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            title: Text("Expense Tracker"),
            //  title: SizedBox(

            //      height: kToolbarHeight,
            //        child:  Text("vvvvvvvvvvvvvvvv"),

            //    ),

            backgroundColor: Color(0xffa4a1fb),

            elevation: 0,
            bottom: new TabBar(
                // labelPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.all(0),
                controller: controller,
                //              indicatorPadding:const EdgeInsets.all(20.0) ,
                // labelColor: Colors.redAccent,
                // unselectedLabelColor: Colors.white,
                // indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color(_choice.color),
                indicatorWeight: .01,
                tabs: <Tab>[
                  //  new Tab ( text:'Incomex'),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF35B8C),
                        // borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: Colors.blue, width: 1)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Expense"),
                      ),
                    ),
                  ),
                  //  new Tab (text:'Expense'),

                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff69b5ff),
                        // borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: Colors.blue, width: 1)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Income"),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          //dummy page
          new MyApp1(),
          new MyApp2(),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.color});
  final String title;
  final IconData icon;
  final num color;
}

//create a list
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home, color: 0xFFF35B8C),
  const Choice(title: 'Support', icon: Icons.mail, color: 0xff69b5ff),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('dummy page'),
    );
  }
}
