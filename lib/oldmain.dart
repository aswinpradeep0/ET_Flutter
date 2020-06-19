// import 'package:flutter/material.dart';
// import 'secondpage.dart' as SecondRoute;

// final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Layout title1",
//       navigatorKey: navigatorKey,
//       initialRoute: '/',
//       routes: {
//         '/someRoute': (context) => SecondRoute.SecondRoute(),
//       },
//       home: Scaffold(
//           // appBar: AppBar(
//           //   title: Text("appbartitle"),
//           // ),
//           body: Column(
//         children: [
//           Image.asset(
//             'images/sun.jpg',
//             width: 600,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           titleSection,
//           buttonSection,
//           textSection,
//           nextbutton
//         ],
//       )),
//     );
//   }
// }

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         /*1*/
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /*2*/
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 'Sunset in Material Design',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Imaginary location, Kerala',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),
//       /*3*/
//       Icon(
//         Icons.favorite,
//         color: Colors.red[500],
//       ),
//       Text('41'),
//     ],
//   ),
// );

// Widget textSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Text(
//     'It’s only when we can escape to nature does life truly reveal itself, in its immaculate entirety. You can’t ignore any aspect of life because it can be taken at any moment.Cherish every moment, particularly the sunsets.',
//     softWrap: true,
//   ),
// );

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(icon, color: color),
//       Container(
//         margin: const EdgeInsets.only(top: 8),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Color color = Colors.blueAccent;

// Widget buttonSection = Container(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _buildButtonColumn(color, Icons.call, 'CALL'),
//       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//       _buildButtonColumn(color, Icons.share, 'SHARE'),
//       _buildButtonColumn(color, Icons.mail_outline, 'MAIL'),
//       _buildButtonColumn(color, Icons.watch, 'SAVE'),
//     ],
//   ),
// );

// Widget nextbutton = Container(
//   child: RaisedButton(
//     // onPressed: () {Fluttertoast.showToast(
//     //   msg: "This is Long Toast",
//     //   toastLength: Toast.LENGTH_LONG,
//     // );},
//       color: Colors.blue[700],
      

//     onPressed: () {
//       navigatorKey.currentState.pushNamed('/someRoute');
//     },
//     // child: const Text('Enabled Button', style: TextStyle(fontSize: 10)),
//     child: const Text('   Next Page   ',style: TextStyle(color: Colors.white)),
//   ),
// );

// // class SecondRoute extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Second Route"),
// //       ),
// //       body: Center(
// //         child: RaisedButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           child: Text('Go back!'),
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'globals.dart' as globals;


// // Future<Null> globaltest() async {
// //   var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';
// //   var response = await http.get(url);
// //   var jsonResponse = convert.jsonDecode(response.body);
// //   final lst=[];
// //   print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
// //   print(jsonResponse);
// //  print((jsonResponse[3]["CATEGORY_NAME"])); 

 
  
// //  jsonResponse.forEach((i) {


// //   // print(i["CATEGORY_NAME"]);
// //   lst.add(i["CATEGORY_NAME"]);
// //   // print('index=$i');
// // });  

// // print(lst);
// //  print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

// // }


// void main() async {
// //   var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';
// //   var response = await http.get(url);
// //   var jsonResponse = convert.jsonDecode(response.body);
// //   final lst=[];
// //   print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
// //   print(jsonResponse);
// //  print((jsonResponse[3]["CATEGORY_NAME"])); 

 
  
// //  jsonResponse.forEach((i) {


// //   // print(i["CATEGORY_NAME"]);
// //   lst.add(i["CATEGORY_NAME"]);
// //   // print('index=$i');
// // });  

// // print(lst);
// //  print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

  

//   // Await the http get response, then decode the json-formatted response.
//   // var response = await http.get(new Uri.http("127.0.0.2:8081", "/tracker/register/liscategoryexpense"));

//   // if (response.statusCode == 200) {
//   //   var jsonResponse = convert.jsonDecode(response.body);
//   //   print(jsonResponse);
//   //   var itemCount = jsonResponse['totalItems'];
//   //   print('Number of books about http: $itemCount.');
//   // } else {
//   //   print('Request failed with status: ${response.statusCode}.');
//   // }
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
  

//   @override
//   _State createState() => _State();
// }

// class _State extends State<MyApp> {
//   TextEditingController useridController = TextEditingController();
//   TextEditingController dateController = TextEditingController(
//       text: "${"${DateTime.now().toLocal()}".split(' ')[0]}");
//   TextEditingController itemController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
//   DateTime selectedDate = DateTime.now();
  
//   dynamic data;

  

//   Future<dynamic> makeRequest() async 
//   {
//   var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';

  
//   var response = await http.get(url);

//   setState(() {
//   var jsonResponse = convert.jsonDecode(response.body);
//   final lst=[];
//   // print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//   // print(jsonResponse);
// //  print((jsonResponse[3]["CATEGORY_NAME"])); 
//  jsonResponse.forEach((i) {
//   // print(i["CATEGORY_NAME"]);
//   lst.add(i["CATEGORY_NAME"]);
//   // print('index=$i');
// });  

// print(lst);
//  print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//  data=lst;
//   });
// }
  

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   globaltest();
//   // }

//    @override
//   void initState() {
//     super.initState();
//     makeRequest();
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFF35B8C),
//           title: Center(child: Text('Expense')),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(10),
//             child: ListView(
//               children: <Widget>[
//                 // Container(
//                 //   padding: EdgeInsets.all(10),
//                 //   child: TextField(
//                 //     controller: useridController,
//                 //     decoration: InputDecoration(
//                 //       border: OutlineInputBorder(),
//                 //       labelText: 'User ID',
//                 //     ),
//                 //   ),
//                 // ),

//                 Center(
//                   child: Container(
//                     // width: 200,
//                     padding: EdgeInsets.only(right: 100, left: 100),
//                     child: TextField(
//                       textAlign: TextAlign.center,
//                       focusNode: FocusNode(),
//                       enableInteractiveSelection: false,
//                       controller: dateController,
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                       ),
//                       onTap: () {
//                         _selectDate(context);
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: itemController,
//                     decoration: InputDecoration(
//                       labelText: 'Item Name',
//                     ),
//                   ),
//                 ),

//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: amountController,
//                     decoration: InputDecoration(
//                       labelText: 'Amount',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: SimpleAutoCompleteTextField(
//                     // controller: categoryController,
//                     controller: categoryController,

//                     key: key,
//                     // suggestions: data,
//                     suggestions: [
//                       "Apple",
//                       "Armidillo",
//                       "Actual",
//                       "Actuary",
//                       "America",
//                       "Argentina",
//                       "Australia",
//                       "Antarctica",
//                       "Blueberry",
//                     ],
//                     decoration: InputDecoration(labelText: 'Category'),
                  
//                   ),
//                 ),
//                 Container(
//                     height: 60,
//                     padding: EdgeInsets.all(10),
//                     child: RaisedButton(
//                       textColor: Colors.white,
//                       color: Color(0xFF37364B),
//                       child: Text('Add Expense'),
//                       onPressed: () async {
//                         print(useridController.text);
//                         print(dateController.text);
//                         print(itemController.text);
//                         print(amountController.text);
//                         print(categoryController.text);

//                         // var url = 'http://192.168.1.103:8081/tracker/register/addexpensecategory?categoryName=${dateController.text}';
//                         // var response = await http.post(url);
//                         // print('Response status: ${response.statusCode}');
//                         // print('Response body: ${response.body}');
//                       },
//                     )),
//               ],
//             )));
//   }

//   //void _selectDate(BuildContext context) {}

//   Future<Null> _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;

//         print("${selectedDate.toLocal()}".split(' ')[0]);
//         dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
//       });
//   }

// //   globalstate() async {
// //   var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';
// //   var response = await http.get(url);
// //   var jsonResponse = convert.jsonDecode(response.body);
// //   final lst=[];
// //   print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
// //   print(jsonResponse);
// //  print((jsonResponse[3]["CATEGORY_NAME"])); 

 
  
// //  jsonResponse.forEach((i) {


// //   // print(i["CATEGORY_NAME"]);
// //   lst.add(i["CATEGORY_NAME"]);
// //   // print('index=$i');
// // });  

// // print(lst);
// //  print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
// //  return(lst);

// // }




// }

