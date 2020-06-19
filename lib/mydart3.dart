import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';


class MyApp33 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp33> {
  TextEditingController useridController = TextEditingController();
  TextEditingController dateController = TextEditingController(
      text: "${"${DateTime.now().toLocal()}".split(' ')[0]}");
  TextEditingController itemController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  List<String> abc = List();

  var url = 'http://192.168.1.103:8081/tracker/register/liscategoryincome';

  List<String> lst = List();
  List<int> lstid = List();

  List<String> _getapidetails = List();
  void getapidetails() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    jsonResponse.forEach((i) {
      lst.add(i["CATEGORY_NAME"]);
      lstid.add(i["ID"]);
    });
    setState(() {
      _getapidetails = lst;
      print(_getapidetails);
      print(abc);
      print(lstid);
      print(lstid[10]);
    });
  }

  @override
  void initState() {
    super.initState();
    getapidetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff69b5ff),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Container(
                    // width: 200,
                    padding: EdgeInsets.only(right: 100, left: 100),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      focusNode: FocusNode(),
                      enableInteractiveSelection: false,
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    controller: itemController,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        //  when the TextFormField in focused
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: '₹',
                      labelText: 'Amount(₹)',
                      
                      prefixStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        //  when the TextFormField in focused
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SimpleAutoCompleteTextField(
                    // controller: categoryController,
                    controller: categoryController,
                    style: TextStyle(color: Colors.white),
                    key: key,
                    suggestions: lst,
                    // suggestions: [
                    //   "Apple",
                    //   "Armidillo",
                    //   "Actual",
                    //   "Actuary",
                    //   "America",
                    //   "Argentina",
                    //   "Australia",
                    //   "Antarctica",
                    //   "Blueberry",
                    // ],
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[350]),
                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        //  when the TextFormField in focused
                      ),
                    ),
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
//  if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
// Fluttertoast.showToast(
//         msg: "Insertion Successful",
//         gravity: ToastGravity.BOTTOM,
//     );
                        print(useridController.text);
                        print(dateController.text);
                        print(itemController.text);
                        print(amountController.text);
                        print(categoryController.text);
                        print(lst);
                        print(lstid);
                        print(lst.indexOf(categoryController.text));
                      var idx2;
                        var idx = lst.indexOf(categoryController.text);
                        if(idx>0&&idx<100){
                         idx2 = lstid[idx];}
                       
                        var url =
                            'http://192.168.1.103:8081/tracker/register/addincome?userId=1&item=${itemController.text}&categoryId=$idx2&amount=${amountController.text}&transactionDate=${dateController.text}';

                        var response = await http.post(url);
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');
                        if (response.statusCode == 200) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Insertion Successfull')));
                              itemController.text='';
                              amountController.text='';
                              categoryController.text='';
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Error!Cannot complete operation.')));
                        }
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
