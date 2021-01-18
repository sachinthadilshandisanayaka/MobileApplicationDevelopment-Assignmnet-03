import 'dart:html';

import 'package:flutter/material.dart';

class SecondActivity extends StatefulWidget {
  SecondActivity({Key key}) : super(key: key);

  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Second APP"),
      ),
    );
  }
}
