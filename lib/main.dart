/*
Objective learning 
-awayt/async
-try/catch with Network issue
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key? key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sample App"),
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      http.Response response = await http.get(url);
      setState(() {
        widgets = json.decode(response.body);
      });
    } catch (error) {
      print('#issue : ${error}');
    }
  }
}
