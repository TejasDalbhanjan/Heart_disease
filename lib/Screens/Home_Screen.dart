import 'dart:convert';

import 'package:Heart_Disease/Api_call/call.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  String output = 'Enter the Data';
  var data;

  //Controllers for Storing String value
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _sexController = new TextEditingController();

  //Keys for Validation
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Heart Disease Prediction"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Age"),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  controller: _ageController,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Sex"),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  controller: _sexController,
                ),
              ),
              Container(
                child: RaisedButton(onPressed: () async {
                  var a = _ageController.text;
                  var b = _sexController.text;

                  url = 'https://my-flask-api-ml.herokuapp.com/ML?age=' +
                      a.toString() +
                      '&sexBoolean=' +
                      b.toString();
                  data = await fetchdata(url);
                  var decoded = data.toString();
                  setState(() {
                    output = decoded;
                  });
                }),
              ),
              Text(
                output,
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
