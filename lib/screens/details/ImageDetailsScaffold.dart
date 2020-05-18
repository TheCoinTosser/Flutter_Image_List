import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsScaffoldCupertino.dart';

import 'ImageDetailsScaffoldAndroid.dart';

class ImageDetailsScaffold extends StatelessWidget{

  static const String title = "Details";

  final int imageId;
  final String imageUrl;

  ImageDetailsScaffold({
    @required this.imageId,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    switch(Theme.of(context).platform){
      case TargetPlatform.iOS: return ImageDetailsScaffoldCupertino(previousPageName: title, imageId: imageId, imageUrl: imageUrl);
      default: return ImageDetailsScaffoldAndroid(imageId: imageId, imageUrl: imageUrl);
    }
  }
}