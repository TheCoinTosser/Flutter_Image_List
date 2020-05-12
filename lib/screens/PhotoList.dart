import 'package:flutter/cupertino.dart';
import 'package:flutterpresentation/extensions/Extensions.dart';

class PhotoList extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final screenWidthInPixels = MediaQuery.of(context).retrieveScreenWidthInPixels(context);
    final int heightInPixels = (9 * screenWidthInPixels / 16).floor();

    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){

          return Image.network(
            "https://i.picsum.photos/id/$index/$screenWidthInPixels/$heightInPixels.jpg"
          );
        }
    );
  }
}