import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PhotoList.dart';

class PhotoListScaffoldCupertino extends StatelessWidget{

  final String barTitle;

  PhotoListScaffoldCupertino({
    @required this.barTitle
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoPageScaffold(
          navigationBar: buildNavigationBar(context),
          child: PhotoList()
      ),
    );
  }

  CupertinoNavigationBar buildNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
        middle: Text(
            barTitle,
            style: TextStyle(color: CupertinoColors.activeBlue)
        )
    );
  }
}