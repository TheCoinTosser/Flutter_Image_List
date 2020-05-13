import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/PhotoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white
              )
          )
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
                "Flutter presentation",
                style: TextStyle(decorationColor: Colors.white)
            )
          ),
          body: PhotoList()
      )
    );
  }
}