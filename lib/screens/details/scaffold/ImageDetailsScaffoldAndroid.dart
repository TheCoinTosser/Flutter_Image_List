import 'package:flutter/material.dart';

import '../ImageDetails.dart';

class ImageDetailsScaffoldAndroid extends StatelessWidget{

  final int imageId;
  final String imageUrl;

  ImageDetailsScaffoldAndroid({
    @required this.imageId,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryTextTheme: TextTheme(
                titleLarge: TextStyle(color: Colors.white)
            )
        ),
        home: Scaffold(
          body: ImageDetails(
              imageId: imageId,
              imageUrl: imageUrl
          )
        )
    );
  }
}