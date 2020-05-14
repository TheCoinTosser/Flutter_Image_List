import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ImageDetails.dart';

class ImageDetailsScaffoldAndroid extends StatelessWidget{

  final String imageUrl;

  ImageDetailsScaffoldAndroid({
    @required this.imageUrl
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
            body: SafeArea(
                child: ImageDetails(imageUrl: imageUrl)
            )
        )
    );
  }
}