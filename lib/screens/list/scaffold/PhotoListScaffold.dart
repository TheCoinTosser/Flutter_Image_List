import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpresentation/screens/list/scaffold/PhotoListScaffoldCupertino.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorBloc.dart';

import 'PhotoListScaffoldAndroid.dart';

class PhotoListScaffold extends StatelessWidget{

  static const String TITLE = "Photos";

  @override
  Widget build(BuildContext context) {

    Widget scaffoldWidget;
    if(Theme.of(context).platform == TargetPlatform.iOS){
      scaffoldWidget = PhotoListScaffoldCupertino(barTitle: TITLE);
      
    }else{
      scaffoldWidget = PhotoListScaffoldAndroid(barTitle: TITLE);
    }

    return BlocProvider.value(
        value: HappyOrErrorBloc(),
        child: scaffoldWidget,
    );
  }
}