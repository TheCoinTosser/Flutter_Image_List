import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget{

  final String imageUrl;

  ImageDetails({
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Hero(
              tag: imageUrl,
              child: Image.network(imageUrl)
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("Author: ", style: TextStyle(fontSize: 30)),
                  Text("Tiago", style: TextStyle(fontSize: 30))
                ],
              ),
            ),
          )
        ],
    );
  }
}