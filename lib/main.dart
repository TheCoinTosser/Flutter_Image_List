import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/PhotoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tigerspike Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoList()
    );
  }
}