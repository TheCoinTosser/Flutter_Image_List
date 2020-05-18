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

    return ListView.builder(
        itemCount: 1000,
        itemBuilder: (BuildContext context, int index){
            final imageId = index + 10;
            return ImageItem(
              imageId: imageId,
              imageUrl: "https://i.picsum.photos/id/$imageId/$imageWidthInPixels/$imageHeightInPixels.jpg"
            );
        }
    );
  }
}
