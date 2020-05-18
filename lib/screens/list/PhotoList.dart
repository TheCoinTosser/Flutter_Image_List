import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/extensions/Extensions.dart';
import 'package:flutterpresentation/screens/list/ListItem.dart';

class PhotoList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final mediaQueryData = MediaQuery.of(context);
    final imageWidthInPixels = mediaQueryData.retrieveScreenWidthInPixels(context);
    final imageHeightInPixels = (3 * imageWidthInPixels / 4).ceil();

    if(Theme.of(context).platform == TargetPlatform.iOS){
      return ListView.builder(
          itemBuilder: (context, index) => buildItem(index, imageWidthInPixels, imageHeightInPixels)
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, index) => buildItem(index, imageWidthInPixels, imageHeightInPixels),
              childCount: 1000
      )
    );
  }

  Widget buildItem(int index,
                   int imageWidthInPixels,
                   int imageHeightInPixels){
    final imageId = index + 10;
    return ImageItem(
        imageId: imageId,
        imageUrl: "https://i.picsum.photos/id/$imageId/$imageWidthInPixels/$imageHeightInPixels.jpg"
    );
  }
}
