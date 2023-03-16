import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorMultiplatform{
  static Widget build(BuildContext context){
    if(Theme.of(context).platform == TargetPlatform.iOS){
      return CupertinoActivityIndicator(radius: 20);
    }
    return CircularProgressIndicator();
  }
}