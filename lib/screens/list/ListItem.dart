import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsScaffold.dart';

class ImageItem extends StatelessWidget{

  static const EdgeInsets CARD_PADDING = EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
  static const EdgeInsets CARD_MARGIN = EdgeInsets.only(left: 0.0, right: 0.0);
  static const Duration FADE_OUT_DURATION = Duration(milliseconds: 100);
  static const Duration FADE_IN_DURATION = Duration(milliseconds: 300);
  static const CARD_ELEVATION = 10.0;
  static const CARD_RADIUS = 15.0;

  final String imageUrl;

  ImageItem({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Padding(
        padding: CARD_PADDING,
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              buildRoute(context)
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Card(
              elevation: CARD_ELEVATION,
              margin: CARD_MARGIN,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CARD_RADIUS)),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(CARD_RADIUS)
                    )
                ),
                child: Center(
                        child: FadeInImage(
                            placeholder: AssetImage("assets/bird.png"),
                            fadeOutDuration: FADE_OUT_DURATION,
                            fadeInDuration: FADE_IN_DURATION,
                            fit: BoxFit.fill,
                            image: NetworkImage(imageUrl)
                          )
                        ),
              ),
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
        return MaterialPageRoute(
          builder: (_) => buildWidgetToLoadAfterTap()
        );
      }
    }
  }
  
  Widget buildWidgetToLoadAfterTap(){
    return ImageDetailsScaffold(imageUrl: imageUrl);
  }
}
