import 'package:flutter/cupertino.dart';
import 'package:flutterpresentation/screens/details/ImageDetails.dart';
import 'package:flutterpresentation/screens/list/scaffold/PhotoListScaffold.dart';

class ImageDetailsScaffoldCupertino extends StatelessWidget{

  final String title;
  final int imageId;
  final String imageUrl;

  ImageDetailsScaffoldCupertino({
    @required this.title,
    @required this.imageId,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: buildNavigationBar(context),
          child: SafeArea(
              child: ImageDetails(imageId: imageId, imageUrl: imageUrl)
          )
      );
  }

  CupertinoNavigationBar buildNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      previousPageTitle: PhotoListScaffold.TITLE,
      middle: Text(title),
    );
  }
}