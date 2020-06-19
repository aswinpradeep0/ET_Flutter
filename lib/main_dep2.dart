import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter FormBuilder Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
      GlobalKey<FormBuilderState> _fbKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FormBuilder Example'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                FormBuilder(
                  context,
                  key: _fbKey,
                  autovalidate: autoValidate,
                  readonly: readOnly,
                  /*onChanged: (formValue) {
                    print(formValue);
                  },*/
                  controls: [
 FormBuilderInput.number(
                      attribute: "age",
                      decoration: InputDecoration(labelText: "Your Age"),
                      // require: true,
                      // min: 18,
                    ),
                   FormBuilderInput.textField(
                      type: FormBuilderInput.TYPE_PHONE,
                      attribute: "phone",
                      decoration: InputDecoration(labelText: "Phone Number"),
                      //require: true,
                    ),
                   
                    FormBuilderInput.datePicker(
                      decoration: InputDecoration(labelText: "Date of Birth"),
                      readonly: true,
                      attribute: "dob",
                      firstDate: DateTime(1970),
                      value: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 1)),
                      format: 'dd, MM yyyy',
                    ),
                    
                    ],
              ),
              MaterialButton(
                child: Text('External submit'),
                onPressed: () {
                  _fbKey.currentState.save();
                  if (_fbKey.currentState.validate()) {
                    print('validationSucceded');
                    print(_fbKey.currentState.value);
                  } else {
                    print("External FormValidation failed");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String imageUrl;

  const Contact(this.name, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}