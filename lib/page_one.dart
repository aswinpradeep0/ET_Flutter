import 'package:demoapp/pubdropdown.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/mydart1.dart';
import 'package:demoapp/mydart2.dart';
import 'package:demoapp/mytab.dart';
import './page_two.dart';
import './bottombar.dart';
import './tab3.dart';
import './curvedbar.dart';
import 'dropdown.dart';
import './mediumdropdown.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: RaisedButton(
                child: Text('Navigate to Expense'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAppDropDown()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to BottomCurved'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to Tabs'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabBarDemo()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to BottomBar'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyBottomApp()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to Tab3'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp3()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to dropdown medium'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MediumApp()));
                },
              )),
              Center(
                  child: RaisedButton(
                child: Text('Navigate to dropdown medium'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PubDropdown()));
                },
              )),
            ],
          ),
        ));
  }
}
