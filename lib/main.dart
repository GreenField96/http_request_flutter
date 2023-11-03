/*
Objective learning 
-awayt/async
-try/catch with Network issue
 */

// import 'package:app008/ex001.dart';
import 'package:app008/ex002.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
