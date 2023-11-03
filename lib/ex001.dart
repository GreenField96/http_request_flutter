import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
