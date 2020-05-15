import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsScaffold.dart';

class ImageItem extends StatelessWidget{

  static const EdgeInsets CARD_PADDING = EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
  static const Duration FADE_OUT_DURATION = Duration(milliseconds: 100);
  static const Duration FADE_IN_DURATION = Duration(milliseconds: 300);
  static const CARD_ELEVATION = 5.0;
  static const CARD_ELEVATION_PRESSED = 20.0;
  static const CARD_RADIUS = 15.0;

  final String imageUrl;

  ImageItem({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CARD_PADDING,
      child: Hero(
        tag: imageUrl,
        child: RaisedButton(
          elevation: CARD_ELEVATION,
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.all(0.0),
          color: Colors.white,
          highlightElevation: CARD_ELEVATION_PRESSED,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CARD_RADIUS)
          ),
          onPressed: () => Navigator.push(
              context,
              buildRoute(context)
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FadeInImage.assetNetwork(
                placeholder: "assets/bird.png",
                fadeOutDuration: FADE_OUT_DURATION,
                fadeInDuration: FADE_IN_DURATION,
                fit: BoxFit.cover,
                image: imageUrl
              ),
          ),
        ),
      ),
    );
  }

  Route<dynamic> buildRoute(BuildContext context){
    switch(Theme.of(context).platform){
      case TargetPlatform.iOS:{
        return CupertinoPageRoute(
            builder: (_) => buildWidgetToLoadAfterTap()
        );
      }
      default: {
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => buildWidgetToLoadAfterTap()
        );
      }
    }
  }

  Widget buildWidgetToLoadAfterTap(){
    return ImageDetailsScaffold(imageUrl: imageUrl);
  }
}
