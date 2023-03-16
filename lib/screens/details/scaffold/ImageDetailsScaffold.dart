import 'package:flutter/material.dart';

import 'ImageDetailsScaffoldAndroid.dart';
import 'ImageDetailsScaffoldCupertino.dart';

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
      case TargetPlatform.iOS: return ImageDetailsScaffoldCupertino(title: title, imageId: imageId, imageUrl: imageUrl);
      default: return ImageDetailsScaffoldAndroid(imageId: imageId, imageUrl: imageUrl);
    }
  }
}