import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'globals.dart' as globals;
import './mediumdropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:find_dropdown/find_dropdown.dart';


class MyApp2 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp2> {
  TextEditingController useridController = TextEditingController();
  TextEditingController dateController = TextEditingController(
      text: "${"${DateTime.now().toLocal()}".split(' ')[0]}");
  TextEditingController itemController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  DateTime selectedDate = DateTime.now();
// var abc=[''];
  List<String> abc = List();

  var url = 'http://192.168.1.103:8081/tracker/register/liscategoryincome';
  //  List<String> lst;
  // var lst[];
  List<String> lst = List();
  List<int> lstid = List();

  List<String> _getapidetails = List();
  void getapidetails() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    

    jsonResponse.forEach((i) {
      // print(i["CATEGORY_NAME"]);
      lst.add(i["CATEGORY_NAME"]);
      lstid.add(i["ID"]);
      // print('index=$i');
    });
    setState(() {
      _getapidetails = lst;
      print(_getapidetails);
      print(abc);
      print(lstid);
      print(lstid[10]);
      
      // dan kita set kedalam variable _dataProvince
    });
  }

//   dynamic data;

//   Future<dynamic> makeRequest() async {
//     var url = 'http://192.168.1.103:8081/tracker/register/liscategoryincome';

//     var response = await http.get(url);

//     setState(() {
//       var jsonResponse = convert.jsonDecode(response.body);
//       final lst = [];
//       // print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//       // print(jsonResponse);
// //  print((jsonResponse[3]["CATEGORY_NAME"]));
//       jsonResponse.forEach((i) {
//         // print(i["CATEGORY_NAME"]);
//         lst.add(i["CATEGORY_NAME"]);
//         // print('index=$i');
//       });

//       print(lst);
//       print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//       data = lst;
//     });
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   globaltest();
//   // }

  @override
  void initState() {
    super.initState();
    getapidetails();
  }

  @override
  Widget build(BuildContext context) {
      String dropdownValue = 'Tom Cruise';
 
  // To show Selected Item in Text.
  String holder = '' ;
 
  List <String> actorsName = [
    'Robert Downey, Jr.', 
    'Tom Cruise', 
    'Leonardo DiCaprio', 
    'Will Smith', 
    'Tom Hanks'
    ] ;
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff69b5ff),

        // appBar: AppBar(
        //   backgroundColor: Color(0xff69b5ff),
        //   title: Center(child: Text('Income')),
        // ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child: TextField(
                //     controller: useridController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'User ID',
                //     ),
                //   ),
                // ),

                Center(
                  child: Container(
                    // width: 200,
                    padding: EdgeInsets.only(right: 100, left: 100),
                    child: TextField(
                      textAlign: TextAlign.center,
                      focusNode: FocusNode(),
                      enableInteractiveSelection: false,
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: itemController,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                    ),
                  ),
                ),
////////////
                Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    
                    showSelectedItem: true,
                    items: lst,
                    
                    label: "Category",
                    
                    popupBackgroundColor: Colors.white,
                    // hint: "Choose Category",
                    
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (String data){print(data);categoryController.text=data;},
                    // onChanged:print,
                    // showClearButton: true,
                    dropdownSearchDecoration: InputDecoration( contentPadding: const EdgeInsets.all(0.0),labelText: 'Category',labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        
                              borderSide: BorderSide(color: Colors.white),
                              //  when the TextFormField in unfocused 
                            ) ,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              //  when the TextFormField in focused 
                            ) ,),
                    
                    
                  ),
                ),
///////////////////////////////

                Container(
                  width: 200,
                  padding: EdgeInsets.all(10),
                  child: DropdownButtonFormField<String>(
                     decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        
                              borderSide: BorderSide(color: Colors.white),
                              //  when the TextFormField in unfocused 
                            ) ,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              //  when the TextFormField in focused 
                            ) ,
                      
                    ),
                    isExpanded: true,
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      onChanged: (String data) {
              setState(() {
                dropdownValue = data;
                print(dropdownValue);
                holder=dropdownValue;
              });
            },
            items: actorsName.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                
                
                value: value,
                child: Text(value,style: TextStyle(color:Colors.white),),
              );
            }).toList(),
    )
                ),

///////////////////////
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SimpleAutoCompleteTextField(
                    
                    // controller: categoryController,
                    controller: categoryController,
                    key: key,
                    // suggestions: lst,
                    suggestions: [
                      "Apple",
                      "Armidillo",
                      "Actual",
                      "Actuary",
                      "America",
                      "Argentina",
                      "Australia",
                      "Antarctica",
                      "Blueberry",
                    ],
                    style:TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Category',counterStyle: new TextStyle(
color: Colors.white
              ),),
                  ),
                ),
                Container(
                    height: 60,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xFF37364B),
                      child: Text('Add Income'),
                      onPressed: () async {
                        print(useridController.text);
                        print(dateController.text);
                        print(itemController.text);
                        print(amountController.text);
                        print(categoryController.text);
                        print(lst);
                        print(lstid);
                        print(lst.indexOf(categoryController.text));
                        var idx = lst.indexOf(categoryController.text);
                        print(lstid[idx]);

                        // var url = 'http://192.168.1.103:8081/tracker/register/addexpensecategory?categoryName=${dateController.text}';
                        // var response = await http.post(url);
                        // print('Response status: ${response.statusCode}');
                        // print('Response body: ${response.body}');
                      },
                    )),
              ],
            )));
  }

  //void _selectDate(BuildContext context) {}

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        print("${selectedDate.toLocal()}".split(' ')[0]);
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

//   globalstate() async {
//   var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';
//   var response = await http.get(url);
//   var jsonResponse = convert.jsonDecode(response.body);
//   final lst=[];
//   print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//   print(jsonResponse);
//  print((jsonResponse[3]["CATEGORY_NAME"]));

//  jsonResponse.forEach((i) {

//   // print(i["CATEGORY_NAME"]);
//   lst.add(i["CATEGORY_NAME"]);
//   // print('index=$i');
// });

// print(lst);
//  print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//  return(lst);

// }

}
