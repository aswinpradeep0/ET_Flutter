import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:demoapp/tab3.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import './mytab.dart';
import 'mydart1.dart';

class MyBottomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'circular_bottom_navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 50;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home",Color(0xffa4a1fb), labelStyle: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "Search", Color(0xffa4a1fb), labelStyle: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Reports", Color(0xffa4a1fb),labelStyle: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.normal)),
    new TabItem(Icons.notifications, "Notifications", Color(0xffa4a1fb),labelStyle: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.normal)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: true,

// appBar: AppBar(
//    title: SizedBox(
     
//        height: kToolbarHeight,
//          child:  Text("vvvvvvvvvvvvvvvv"),
         
         
//      ),
//         flexibleSpace: SafeArea(
          
//           child:  AppBar(
            
//           title: Text('Home Page xxxxxxxxxxxxx'),
//           backgroundColor: Color(0xFFF35B8C),
//         ),
//         ),
//       ),


      
        
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    Object slogan;
    switch (selectedPos) {
      case 0:
        slogan = MyApp3();
        break;
      case 1:
        slogan = MyApp3();
        break;
      case 2:
        slogan = TabBarDemo();
        break;
      case 3:
        slogan = TabBarDemo();
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: slogan
        ),
      ),
      // onTap: () {
      //   if (_navigationController.value == tabItems.length - 1) {
      //     _navigationController.value = 0;
      //   } else {
      //     _navigationController.value++;
      //   }
      // },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      normalIconColor: Colors.white,
      // barBackgroundColor: Colors.white,
      barBackgroundColor:Color(0xffa4a1fb),
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}