import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffoldAndroid.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffoldCupertino.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title = "Photos";

  @override
  Widget build(BuildContext context) {

    timeDilation = 1.0;

    switch(Theme.of(context).platform){
      case TargetPlatform.iOS: return PhotoListScaffoldCupertino(barTitle: title);
      default: return PhotoListScaffoldAndroid(barTitle: title);
    }
  }
}