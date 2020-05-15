import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutterpresentation/screens/list/PhotoListScaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    timeDilation = 1.0;

    return PhotoListScaffold();
  }
}