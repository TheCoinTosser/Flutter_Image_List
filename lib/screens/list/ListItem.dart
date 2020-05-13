import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget{

  static const EdgeInsets CARD_PADDING = EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
  static const EdgeInsets CARD_MARGIN = EdgeInsets.only(left: 0.0, right: 0.0);
  static const CARD_ELEVATION = 10.0;
  static const CARD_RADIUS = 15.0;

  final String imageUrl;

  ImageItem({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CARD_PADDING,
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
                        fit: BoxFit.fill,
                        image: NetworkImage(imageUrl)
                      )
                    ),
          ),
        ),
      ),
    );
  }
}
