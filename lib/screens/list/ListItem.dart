import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget{

  static const EdgeInsets CARD_MARGINS = EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
  static const CARD_ELEVATION = 10.0;
  static const CARD_RADIUS = 15.0;

  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  ImageItem({
    @required this.imageUrl,
    @required this.imageWidth,
    @required this.imageHeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      child: Card(
        elevation: CARD_ELEVATION,
        margin: CARD_MARGINS,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CARD_RADIUS)),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CARD_RADIUS)
              )
          ),
          child: Image.network(imageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, Widget child, ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ?
                         loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
