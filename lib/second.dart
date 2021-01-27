import 'dart:ui';

import 'package:flutter/material.dart';

class SecondActivity extends StatefulWidget {
  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  final _formKey = GlobalKey<FormState>();
  String getName = '';
  String displayName = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Text(
            "Assignment",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      key: Key('input-name-field'),
                      validator: (value) => value.isEmpty
                          ? 'Text field should not be empty'
                          : null,
                      onChanged: (val) {
                        setState(() {
                          getName = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            displayName = getInputData(getName);
                          });
                        }
                      },
                      icon: Icon(Icons.send),
                      label: Text("Send"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      displayName,
                      style: TextStyle(color: Colors.green, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String getInputData(String name) {
  return name;
}
