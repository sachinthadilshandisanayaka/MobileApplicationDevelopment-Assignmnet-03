import 'dart:ui';

import 'package:flutter/material.dart';

class SecondActivity extends StatefulWidget {
  SecondActivity({Key key}) : super(key: key);

  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Text field should not be empty' : null,
                  ),
                  FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.send),
                      label: Text("Send"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
