import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PhotoList.dart';

class PhotoListScaffoldAndroid extends StatelessWidget{

  final String barTitle;

  PhotoListScaffoldAndroid({
    @required this.barTitle
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white)
            )
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                    barTitle,
                    style: TextStyle(decorationColor: Colors.white)
                )
            ),
            body: PhotoList()
        )
    );
  }
}