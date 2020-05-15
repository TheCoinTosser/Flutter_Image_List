import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetails.dart';
import 'package:flutterpresentation/screens/list/PhotoListScaffold.dart';

class ImageDetailsScaffoldCupertino extends StatelessWidget{

  final String title;
  final String imageUrl;

  ImageDetailsScaffoldCupertino({
    @required this.title,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: buildNavigationBar(context),
          child: SafeArea(
              child: ImageDetails(imageUrl: imageUrl)
          )
      );
  }

  CupertinoNavigationBar buildNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      previousPageTitle: PhotoListScaffold.title,
      middle: Text(
          title,
          style: TextStyle(color: CupertinoColors.activeBlue)
      ),
    );
  }
}