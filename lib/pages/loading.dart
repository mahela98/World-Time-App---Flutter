import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
   Map data =  jsonDecode(response.body);
   print(response);
   print(data['id']);
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading'),
    );
  }
}
