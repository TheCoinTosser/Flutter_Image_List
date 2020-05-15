import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffoldCupertino.dart';

import 'PhotoListScaffoldAndroid.dart';

class PhotoListScaffold extends StatelessWidget{

  static const String title = "Photos";

  @override
  Widget build(BuildContext context) {
    switch(Theme.of(context).platform){
      case TargetPlatform.iOS: return PhotoListScaffoldCupertino(barTitle: title);
      default: return PhotoListScaffoldAndroid(barTitle: title);
    }
  }
}