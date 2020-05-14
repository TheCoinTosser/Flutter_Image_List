import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/extensions/Extensions.dart';
import 'package:flutterpresentation/screens/list/ListItem.dart';

class PhotoList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final mediaQueryData = MediaQuery.of(context);
    final imageWidthInPixels = mediaQueryData.retrieveScreenWidthInPixels(context);
    final imageHeightInPixels = (9 * imageWidthInPixels / 16).ceil();

    return ListView.builder(
        itemCount: 1000,
        itemBuilder: (BuildContext context, int index){
            return ImageItem(
              imageUrl: "https://i.picsum.photos/id/${index + 10}/$imageWidthInPixels/$imageHeightInPixels.jpg"
            );
        }
    );
  }
}
