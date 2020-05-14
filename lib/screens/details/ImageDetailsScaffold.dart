import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsScaffoldCupertino.dart';

import 'ImageDetailsScaffoldAndroid.dart';

class ImageDetailsScaffold extends StatelessWidget{

  final String title = "Details";
  final String imageUrl;

  ImageDetailsScaffold({
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    switch(Theme.of(context).platform){
      case TargetPlatform.iOS: return ImageDetailsScaffoldCupertino(title: title, imageUrl: imageUrl);
      default: return ImageDetailsScaffoldAndroid(imageUrl: imageUrl);
    }
  }
}