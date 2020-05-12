import 'package:flutter/cupertino.dart';

//Based on: https://stackoverflow.com/q/57052297/1369016
extension MediaQueryExtensions on MediaQueryData {
  int retrieveScreenWidthInPixels(BuildContext context) {
    final screenWidthInDP = this.size.width;
    return (screenWidthInDP * this.devicePixelRatio).toInt();
  }
}