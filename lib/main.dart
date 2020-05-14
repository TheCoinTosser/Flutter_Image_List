import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffoldAndroid.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffoldCupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title = "Flutter Presentation";

  @override
  Widget build(BuildContext context) {
    switch(Theme.of(context).platform){
      case TargetPlatform.iOS: return PhotoListScaffoldCupertino(barTitle: title);
      default: return PhotoListScaffoldAndroid(barTitle: title);
    }
  }
}