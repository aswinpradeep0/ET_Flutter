import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Two'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: FlatButton(
                child: Text('Navigate to Page One'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
            ],
          ),
        ));
  }
}